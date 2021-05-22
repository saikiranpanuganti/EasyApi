//
//  Network.swift
//  EasyApi
//
//  Created by SaiKiran Panuganti on 23/05/21.
//

import Foundation

public class Network {
    static func request(url: String, method: HttpMethod, headers: [String: String]?, parameters: [String: String]?, completionHandler:@escaping ((Data?, URLResponse?, Error?)->Void)) {
        let urlRequest = Request.request(url: url, method: method, headers: headers, parameters: parameters)
        
        if let error = urlRequest.1 {
            completionHandler(nil, nil, error)
        }else {
            if let request = urlRequest.0 {
                URLSession.shared.dataTask(with: request) { data, response, error in
                    completionHandler(data, response, error)
                }.resume()
            }else {
                completionHandler(nil, nil, nil)
            }
        }
    }
}
