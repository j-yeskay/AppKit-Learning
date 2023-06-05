//
//  EmailDataController.swift
//  OutlineViewDemo
//
//  Created by sathish-pt6686 on 05/06/23.
//

import Foundation
import AppKit


public class TaskDataController{
    
    let urlSession = URLSession(configuration: .default)
    var tasks : [Task] = []
//    var postResponse : Task?
//    var pageNo : Int = 1
    
    func get(){
//        print("called")
        let url = URL(string: "https://646f118b09ff19b12086831f.mockapi.io/tasks")!
        let urlRequest = URLRequest(url: url)
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        self.urlSession.dataTask(with: urlRequest, completionHandler: {data, response, error in
            self.tasks = self.tasks + self.decode(data: data!)!
//            self.pageNo = self.pageNo + 1
                    dispatchGroup.leave()
                }).resume()
        dispatchGroup.wait()
    }
    
//    func post(taskData : [String : String]){
//        let url = URL(string: "https://646f118b09ff19b12086831f.mockapi.io/tasks")!
//
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "POST"
//
////        let email = Email(emailId: emailData["emailId"]!, subject: emailData["subject"]!, body: emailData["body"]!)
//        let task = Task(taskGroupName: , tasks: <#T##[Task.TaskItem]#>)
//
//
//        urlRequest.httpBody = self.encode(email: email)
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let dispatchGroup = DispatchGroup()
//
//        dispatchGroup.enter()
//        self.urlSession.dataTask(with: urlRequest, completionHandler: {data, response, error in
//            print("posting done")
//            self.postResponse = try? JSONDecoder().decode(Email.self, from: data!)
//            dispatchGroup.leave()
//        }).resume()
//        dispatchGroup.wait()
//
//    }
    
//    func delete(emailObjectId : String){
//        let url = URL(string: "https://646f118b09ff19b12086831f.mockapi.io/emails/\(emailObjectId)")!
//
//        var urlRequest = URLRequest(url: url)
//
//        urlRequest.httpMethod = "DELETE"
//
//        let dispatchGroup = DispatchGroup()
//
//        dispatchGroup.enter()
//        self.urlSession.dataTask(with: urlRequest, completionHandler: {data, response, error in
//            print("deleted!")
//            dispatchGroup.leave()
//        }).resume()
//        dispatchGroup.wait()
//    }
    
    func decode(data : Data) -> [Task]?{
        let jsonDecoder = JSONDecoder()
        
        do{
            let tasks = try jsonDecoder.decode([Task].self, from: data)
//            print(tasks)
            return tasks.reversed()
        }
        catch{
            print(error.localizedDescription)
            return nil
        }
    }
    
//
//    func encode(task : Task) -> Data?{
//        let jsonEncoder = JSONEncoder()
//
//        do{
//            let jsonData = try jsonEncoder.encode(email)
//            return jsonData
//        }
//        catch{
//            print(error.localizedDescription)
//        }
//        return nil
//    }
}

