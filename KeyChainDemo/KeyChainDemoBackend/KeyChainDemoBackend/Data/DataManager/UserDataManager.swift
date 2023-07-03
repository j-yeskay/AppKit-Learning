//
//  UserDataManager.swift
//  KeyChainDemoBackend
//
//  Created by sathish-pt6686 on 13/06/23.
//

import Foundation


public class UserDataManager{
    var network : CreateUserNetworkContract & LoginNetworkContract & GetAllUsersNetworkContract
    var database : CreateUserDatabaseContract & GetAllUsersDatabaseContract
    
    public init(network : CreateUserNetworkContract & LoginNetworkContract & GetAllUsersNetworkContract, database : CreateUserDatabaseContract & GetAllUsersDatabaseContract) {
        self.network = network
        self.database = database
    }
}


extension UserDataManager : CreateUserDataManagerContract{
    public func createUser(userData: [String : String], success: @escaping ((User) -> Void), failure: @escaping ((String) -> Void)) {
        self.network.createUser(userData: userData, success: success, failure: failure)
    }
}


extension UserDataManager : GetAllUsersDataManagerContract{
    public func getAllUsers(success: @escaping (([User]) -> Void), failure: @escaping ((String) -> Void)) {
        self.database.getAllUsers(success: success, failure: failure)
        self.network.getAllUsers(success: {
            
        }, failure: {
            
        })
    }
}


extension UserDataManager : LoginDataManagerContract{
    public func login(userData: [String : String], success: @escaping ((User) -> Void), failure: @escaping ((String) -> Void)) {
        self.network.login(userData: userData, success: success, failure: failure)
    }
}
