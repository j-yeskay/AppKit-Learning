//
//  UserDataManager.swift
//  KeyChainDemoBackend
//
//  Created by sathish-pt6686 on 13/06/23.
//

import Foundation


public class UserDataManager{
    var network : CreateUserNetworkContract
    
    public init(network : CreateUserNetworkContract) {
        self.network = network
    }
}


extension UserDataManager : CreateUserDataManagerContract{
    public func createUser(userData: [String : String], success: @escaping ((User) -> Void), failure: @escaping ((String) -> Void)) {
        network.createUser(userData: userData, success: success, failure: failure)
    }
}
