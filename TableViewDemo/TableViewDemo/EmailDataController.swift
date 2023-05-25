//
//  EmailDataController.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 25/05/23.
//

import Foundation
import AppKit


public class EmailDataController{
    var emails : [Email] = []
    func getEmails(){
        let url = URL(string: "http://localhost:3000/emails")!
        let urlRequest = URLRequest(url: url)
        let urlSession = URLSession(configuration: .default)
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
                urlSession.dataTask(with: urlRequest, completionHandler: {data, response, error in
                    self.emails = self.decode(data: data!)!
                    dispatchGroup.leave()
                }).resume()
        dispatchGroup.wait()
    }
    
    func decode(data : Data) -> [Email]?{
        let jsonDecoder = JSONDecoder()
        
        do{
            let emails = try jsonDecoder.decode([Email].self, from: data)
            return emails
        }
        catch{
            print(error.localizedDescription)
            return nil
        }
        
        
    }
}
