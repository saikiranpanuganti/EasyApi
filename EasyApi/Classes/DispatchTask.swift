//
//  DispatchTask.swift
//  EasyApi
//
//  Created by SaiKiran Panuganti on 23/05/21.
//

import Foundation

public struct DispatchTask {
    var url: String
    var httpMethod: HttpMethod
    var headers: [String: String]?
    var parameters: [String: String]?
    var taskTitle: String
    var barrier: Bool
    
    public init(url: String, httpMethod: HttpMethod, headers: [String: String]?, parameters: [String: String]?, taskTitle: String, barrier: Bool = false) {
        self.url = url
        self.httpMethod = httpMethod
        self.headers = headers
        self.parameters = parameters
        self.taskTitle = taskTitle
        self.barrier = barrier
    }
}
