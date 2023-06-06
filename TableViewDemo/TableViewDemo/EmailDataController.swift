//
//  EmailDataController.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 25/05/23.
//

import Foundation
import AppKit


public class EmailDataController{
    
    let urlSession = URLSession(configuration: .default)
    var emails : [Email] = []
    var postResponse : Email?
//    var pageNo : Int = 1
    
    func get(){
//        print("called")
        let url = URL(string: "https://646f118b09ff19b12086831f.mockapi.io/emails")!
        let urlRequest = URLRequest(url: url)
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        self.urlSession.dataTask(with: urlRequest, completionHandler: {data, response, error in
            self.emails = self.decode(data: data!)!
//            self.pageNo = self.pageNo + 1
                    dispatchGroup.leave()
                }).resume()
        dispatchGroup.wait()
    }
    
    func post(emailData : [String : String]){
        let url = URL(string: "https://646f118b09ff19b12086831f.mockapi.io/emails")!

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        let email = Email(emailId: emailData["emailId"]!, subject: emailData["subject"]!, body: emailData["body"]!)
        
        
        urlRequest.httpBody = self.encode(email: email)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        self.urlSession.dataTask(with: urlRequest, completionHandler: {data, response, error in
            print("posting done")
            self.postResponse = try? JSONDecoder().decode(Email.self, from: data!)
            dispatchGroup.leave()
        }).resume()
        dispatchGroup.wait()

    }
    
    func delete(emailObjectId : String){
        let url = URL(string: "https://646f118b09ff19b12086831f.mockapi.io/emails/\(emailObjectId)")!

        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "DELETE"
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        self.urlSession.dataTask(with: urlRequest, completionHandler: {data, response, error in
            print("deleted!")
            dispatchGroup.leave()
        }).resume()
        dispatchGroup.wait()
    }
    
    func decode(data : Data) -> [Email]?{
        let jsonDecoder = JSONDecoder()
        
        do{
            let emails = try jsonDecoder.decode([Email].self, from: data)
            return emails.reversed()
        }
        catch{
            print(error.localizedDescription)
            return nil
        }
    }
    
    func encode(email : Email) -> Data?{
        let jsonEncoder = JSONEncoder()
        
        do{
            let jsonData = try jsonEncoder.encode(email)
            return jsonData
        }
        catch{
            print(error.localizedDescription)
        }
        return nil
    }
}
