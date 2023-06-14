//
//  NetworkService.swift
//  KeyChainDemoBackend
//
//  Created by sathish-pt6686 on 13/06/23.
//

import Foundation


public class NetworkService{
    public init(){
        
    }
}


extension NetworkService : CreateUserNetworkContract{
    public func createUser(userData: [String : String], success: @escaping ((User) -> Void), failure: @escaping ((String) -> Void)) {
        let url = URL(string: "http://localhost:3000/users")!
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: userData)
        }
        catch{
            
        }
        
        let session = URLSession(configuration: .default)
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()

        session.dataTask(with: urlRequest, completionHandler: {data, response, error in
            if let _ = error{
                failure(error!.localizedDescription)
            }
            else{
                success(User(email: userData["email"]!))
            }
            dispatchGroup.leave()
        }).resume()
        
        dispatchGroup.wait()
    }
}
