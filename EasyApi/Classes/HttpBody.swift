//
//  HttpBody.swift
//  EasyApi
//
//  Created by SaiKiran Panuganti on 23/05/21.
//

import Foundation

class HttpBody {
    static func httpBody(parameters: [String: String]) -> (Data?, Error?) {
        do {
            let data = try JSONSerialization.data(withJSONObject: parameters, options: [])
            return (data, nil)
        }catch {
            return (nil, error)
        }
    }
}
