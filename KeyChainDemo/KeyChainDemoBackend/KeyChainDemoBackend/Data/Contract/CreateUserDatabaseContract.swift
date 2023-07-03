//
//  CreateUserDatabaseContract.swift
//  KeyChainDemoBackend
//
//  Created by sathish-pt6686 on 19/06/23.
//

import Foundation

public protocol CreateUserDatabaseContract{
    func createUser(userData: [String: Any], success: @escaping ((User) -> Void), failure: @escaping ((String) -> Void))
}
