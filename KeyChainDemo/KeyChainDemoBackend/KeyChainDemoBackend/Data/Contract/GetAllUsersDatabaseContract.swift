//
//  GetAllUsersDatabaseContract.swift
//  KeyChainDemoBackend
//
//  Created by sathish-pt6686 on 19/06/23.
//

import Foundation

public protocol GetAllUsersDatabaseContract{
    func getAllUsers(success: @escaping (([User]) -> Void), failure: @escaping ((String) -> Void))
}
