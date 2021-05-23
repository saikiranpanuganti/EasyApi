//
//  DispatchGroup.swift
//  EasyApi
//
//  Created by SaiKiran Panuganti on 23/05/21.
//

import Foundation

public protocol GroupDispatchDelegate: AnyObject {
    func taskResponse(data: Data?, response: URLResponse?, error: Error?, task: String)
    func notifyCompletion()
}

public class GroupDispatch {
    public weak var delegate: GroupDispatchDelegate?
    private let dispatchQueue = DispatchQueue(label: "Com.Network.Queue", qos: .userInteractive)
    private var barrierTasks: [[Int]] = []
    private var dispatchTasks: [DispatchTask] = []
    private var index: Int = 0 {
        didSet {
            dispatchBarrierTasks()
        }
    }
    
    public init() {}

    public func dispatchTasks(tasks: [DispatchTask]) {
        dispatchTasks = tasks
        var barrierTask: Bool = true
        var nonBarrierTasks: [Int] = []
        
        for (index, task) in tasks.enumerated() {
            if task.barrier {
                if !barrierTask {
                    barrierTasks.append(nonBarrierTasks)
                }
                
                barrierTask = true
                nonBarrierTasks = []
                barrierTasks.append([index])
            }else {
                nonBarrierTasks.append(index)
                barrierTask = false
                
                if index == tasks.count - 1 {
                    barrierTasks.append(nonBarrierTasks)
                }
            }
        }
        
        index = 0
    }
    
    func dispatchBarrierTasks() {
        let tasks = barrierTasks[index]
        let group = DispatchGroup()
        
        for task in tasks {
            group.enter()
            let context = (delegate: delegate, dispatchTasks: dispatchTasks)
            
            dispatchQueue.async {
                Network.request(url: context.dispatchTasks[task].url, method: context.dispatchTasks[task].httpMethod, headers: context.dispatchTasks[task].headers, parameters: context.dispatchTasks[task].parameters) { data, response, error in
                    context.delegate?.taskResponse(data: data, response: response, error: error, task: context.dispatchTasks[task].taskTitle)
                    group.leave()
                }
            }
        }
            
        group.notify(queue: dispatchQueue) {
            if self.index == self.barrierTasks.count - 1 {
                self.delegate?.notifyCompletion()
            }else {
                self.index += 1
                print(self.index)
            }
        }
    }
}
