//
//  Request.swift
//  EasyApi
//
//  Created by SaiKiran Panuganti on 23/05/21.
//

import Foundation

class Request {
    static func request(url: String, method: HttpMethod, headers: [String: String]?, parameters: [String: String]?) -> (URLRequest?, Error?) {
        
        guard let url = URL(string: url) else {
            let error = CustomError(description: "Unable to create Url")
            return (nil, error)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        if method != .get {
            if let parameters = parameters {
                if let error = HttpBody.httpBody(parameters: parameters).1 {
                    return (nil, error)
                }else {
                    request.httpBody = HttpBody.httpBody(parameters: parameters).0
                }
            }
        }
        return (request, nil)
    }
}
