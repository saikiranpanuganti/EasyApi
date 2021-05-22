//
//  CustomError.swift
//  EasyApi
//
//  Created by SaiKiran Panuganti on 23/05/21.
//

import Foundation

struct CustomError : Error {
    let description : String

    var localizedDescription: String {
        return description
    }
}
