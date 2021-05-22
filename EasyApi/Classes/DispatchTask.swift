//
//  DispatchTask.swift
//  EasyApi
//
//  Created by SaiKiran Panuganti on 23/05/21.
//

import Foundation

struct DispatchTask {
    var url: String
    var httpMethod: HttpMethod
    var headers: [String: String]?
    var parameters: [String: String]?
    var taskTitle: String
}
