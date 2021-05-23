//
//  ViewController.swift
//  EasyApi
//
//  Created by saikiranpanuganti on 05/23/2021.
//  Copyright (c) 2021 saikiranpanuganti. All rights reserved.
//

import UIKit
import EasyApi

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        dispatchGroupTask()
    }

    func getData() {
        var headers : [String: String] = [:]
        headers["Content-Type"] = "application/json"

        let parameters : [String: String] = [:]

        Network.request(url: "https://jsonplaceholder.typicode.com/posts", method: .get, headers: headers, parameters: parameters) { data, response, error in
            print(data as Any, error as Any)
        }
    }
    
    func dispatchGroupTask() {
        var headers : [String: String] = [:]
        headers["Content-Type"] = "application/json"
        
        let task1 = DispatchTask(url: "https://jsonplaceholder.typicode.com/photos", httpMethod: .get, headers: headers, parameters: nil, taskTitle: "T1", barrier: true)
        
        let task2 = DispatchTask(url: "https://jsonplaceholder.typicode.com/posts/1", httpMethod: .get, headers: headers, parameters: nil, taskTitle: "T2")
        
        let task3 = DispatchTask(url: "https://jsonplaceholder.typicode.com/posts/1/comments", httpMethod: .get, headers: headers, parameters: nil, taskTitle: "T3")
        
        let task4 = DispatchTask(url: "https://jsonplaceholder.typicode.com/comments", httpMethod: .get, headers: headers, parameters: nil, taskTitle: "T4")
        
        let task5 = DispatchTask(url: "https://jsonplaceholder.typicode.com/posts", httpMethod: .get, headers: headers, parameters: nil, taskTitle: "T5")
        
        let task6 = DispatchTask(url: "https://jsonplaceholder.typicode.com/photos", httpMethod: .get, headers: headers, parameters: nil, taskTitle: "T6", barrier: true)
        
        let task7 = DispatchTask(url: "https://jsonplaceholder.typicode.com/posts/1", httpMethod: .get, headers: headers, parameters: nil, taskTitle: "T7", barrier: true)
        
        let task8 = DispatchTask(url: "https://jsonplaceholder.typicode.com/posts/1/comments", httpMethod: .get, headers: headers, parameters: nil, taskTitle: "T8")
        
        let task9 = DispatchTask(url: "https://jsonplaceholder.typicode.com/comments", httpMethod: .get, headers: headers, parameters: nil, taskTitle: "T9")
        
        let task10 = DispatchTask(url: "https://jsonplaceholder.typicode.com/posts", httpMethod: .get, headers: headers, parameters: nil, taskTitle: "T10", barrier: true)
        
        let groupDispatch = GroupDispatch()
        groupDispatch.delegate = self
        groupDispatch.dispatchTasks(tasks: [task1, task2, task3, task4, task5, task6, task7, task8, task9, task10])
    }
}

extension ViewController: GroupDispatchDelegate {
    func taskResponse(data: Data?, response: URLResponse?, error: Error?, task: String) {
        if task == "T1" {
            if let data = data {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                    let photosData = (jsonData as! [[String: Any]])
                    print("photos count is : ", photosData.count, "task ", task)
                }catch {
                    print(error.localizedDescription)
                }
            }
        }else if task == "T2" {
            if let data = data {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                    let title = (jsonData as! [String: Any])["title"] as! String
                    print("title is : ", title, "task ", task)
                }catch {
                    print(error.localizedDescription)
                }
                
            }
        }else if task == "T3" {
            if let data = data {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                    let email = ((jsonData as! [[String: Any]])[0])["email"] as! String
                    print("email is : ", email, "task ", task)
                }catch {
                    print(error.localizedDescription)
                }
            }
        }else if task == "T4" {
            if let data = data {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                    let commentsData = (jsonData as! [[String: Any]])
                    print("comments count is : ", commentsData.count, "task ", task)
                }catch {
                    print(error.localizedDescription)
                }
            }
        }else if task == "T5"{
            if let data = data {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                    let postsData = (jsonData as! [[String: Any]])
                    print("posts count is : ", postsData.count, "task ", task)
                }catch {
                    print(error.localizedDescription)
                }
            }
        }else if task == "T6" {
            if let data = data {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                    let photosData = (jsonData as! [[String: Any]])
                    print("photos count is : ", photosData.count, "task ", task)
                }catch {
                    print(error.localizedDescription)
                }
            }
        }else if task == "T7" {
            if let data = data {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                    let title = (jsonData as! [String: Any])["title"] as! String
                    print("title is : ", title, "task ", task)
                }catch {
                    print(error.localizedDescription)
                }
                
            }
        }else if task == "T8" {
            if let data = data {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                    let email = ((jsonData as! [[String: Any]])[0])["email"] as! String
                    print("email is : ", email, "task ", task)
                }catch {
                    print(error.localizedDescription)
                }
            }
        }else if task == "T8" {
            if let data = data {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                    let commentsData = (jsonData as! [[String: Any]])
                    print("comments count is : ", commentsData.count, "task ", task)
                }catch {
                    print(error.localizedDescription)
                }
            }
        }else {
            if let data = data {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                    let postsData = (jsonData as! [[String: Any]])
                    print("posts count is : ", postsData.count, "task ", task)
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func notifyCompletion() {
        print("Tasks completed")
    }
}


