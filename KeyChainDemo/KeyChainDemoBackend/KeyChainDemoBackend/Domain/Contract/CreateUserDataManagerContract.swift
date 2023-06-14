//
//  CreateUserDataManagerContract.swift
//  KeyChainDemoBackend
//
//  Created by sathish-pt6686 on 13/06/23.
//

import Foundation


public protocol CreateUserDataManagerContract{
    func createUser(userData : [String : String], success : @escaping ((User) -> Void), failure : @escaping ((String) -> Void))
}
