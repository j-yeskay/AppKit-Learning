//
//  EmailDataController.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 25/05/23.
//

import Foundation
import AppKit
import Network


public class EmailDataController{
    
    let urlSession = URLSession(configuration: .default)
    var emails : [Email] = []
    var postResponse : Email?
    var pageNo : Int = 1
    weak var tableViewManager : TableViewManager!
    
    
    func get(){

        let url = URL(string: "https://646f118b09ff19b12086831f.mockapi.io/emails/")!
        let urlRequest = URLRequest(url: url)
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        
        self.urlSession.dataTask(with: urlRequest, completionHandler: {data, response, error in
                    if response != nil{
                        self.emails = self.emails + self.decode(data: data!)
                        self.tableViewManager.emailsFromNetworkCall = self.emails
                        EmailDBController.getEmailDBControllerInstance().emails = self.emails
                        EmailDBController.getEmailDBControllerInstance().updateDBFromNetwork()
                        
                    }
                    else{
                        let databaseController = EmailDBController.getEmailDBControllerInstance()
                        databaseController.loadEmailsFromDB()
                    }
                    
                    dispatchGroup.leave()
                    
                }).resume()
            

        dispatchGroup.wait()
        
        self.tableViewManager.tableView.reloadData()

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
    
    func decode(data : Data) -> [Email]{
        let jsonDecoder = JSONDecoder()
        
        do{
            let emails = try jsonDecoder.decode([Email].self, from: data)
            return emails.reversed()
        }
        catch{
            print(error.localizedDescription)
            return []
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
