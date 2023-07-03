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
        
        var userAlreadyExists = false
        
        self.getUser(userEmail: userData["email"]!, success: {user in
                userAlreadyExists = true
                failure("User Already Exists")
        }, failure: {error in
            if error != "User Does Not Exists"{
                failure(error)
            }
        })
        
        guard !userAlreadyExists else{
            return
        }
        
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


extension NetworkService : GetAllUsersNetworkContract{
    public func getAllUsers(success: @escaping (([User]) -> Void), failure: @escaping ((String) -> Void)) {
        let url = URL(string: "http://localhost:3000/users")!
        
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: urlRequest, completionHandler: {data, response, error in
            DispatchQueue.main.async {
                if let error = error{
                    failure(error.localizedDescription)
                }
                else if response == nil{
                    failure("No Internet")
                }
                else{
                    success(try! JSONDecoder().decode([User].self, from: data!))
                }
            }
        })
    }
}


extension NetworkService : GetUserNetworkContract{
    public func getUser(userEmail: String, success: @escaping ((User) -> Void), failure: @escaping ((String) -> Void)) {
        let url = URL(string: "http://localhost:3000/users?email=\(userEmail)")!
        
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()

        session.dataTask(with: urlRequest, completionHandler: {data, response, error in
            if response == nil{
                failure("No Internet")
            }
            else{
                do{
                    let userArray = try JSONSerialization.jsonObject(with: data!) as! Array<Any>
                    if userArray.isEmpty{
                        failure("User Does Not Exists")
                    }
                    else{
                        let userDict = userArray.first! as! Dictionary<String, Any>
                        success(User(email: userDict["email"]! as! String))
                    }
                }
                catch{
                    
                }
            }
            dispatchGroup.leave()
        }).resume()
        
        dispatchGroup.wait()
    }
    
    
}


extension NetworkService : LoginNetworkContract{
    public func login(userData: [String : String], success: @escaping ((User) -> Void), failure: @escaping ((String) -> Void)) {
        
        
        let url = URL(string: "http://localhost:3000/users?email=\(userData["email"]!)")!
        
        let urlRequest = URLRequest(url: url)

        let session = URLSession(configuration: .default)
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()

        session.dataTask(with: urlRequest, completionHandler: {data, response, error in
            if response == nil{
                failure("No Internet")
            }
            else{
                do{
                    let userArray = try JSONSerialization.jsonObject(with: data!) as! Array<Any>
                    if userArray.isEmpty{
                        failure("Account Does Not Exists")
                    }
                    else{
                        let userDict = userArray.first! as! Dictionary<String, Any>
                        if userDict["password"]! as! String == userData["password"]!{
                            success(User(email: userDict["email"]! as! String))
                        }
                        else{
                            failure("Wrong Password")
                        }
                    }
                }
                catch{
                    
                }
            }
            dispatchGroup.leave()
        }).resume()
        
        dispatchGroup.wait()
    }
}
