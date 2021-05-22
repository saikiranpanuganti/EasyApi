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
    let dispatchQueue = DispatchQueue(label: "Com.Network.Queue", qos: .userInteractive)
    
    public init() {}

    public func dispatchTasks(tasks: [DispatchTask]) {
        let group = DispatchGroup()
        
        for task in tasks {
            group.enter()
            let selfDelegate = delegate//, count: count)
            
            dispatchQueue.async {
                Network.request(url: task.url, method: task.httpMethod, headers: task.headers, parameters: task.parameters) { data, response, error in
                    selfDelegate?.taskResponse(data: data, response: response, error: error, task: task.taskTitle)
                    group.leave()
                }
            }
            
        }
        
        let selfDelegate = delegate
        
        group.notify(queue: .main) {
            selfDelegate?.notifyCompletion()
        }
    }
}
