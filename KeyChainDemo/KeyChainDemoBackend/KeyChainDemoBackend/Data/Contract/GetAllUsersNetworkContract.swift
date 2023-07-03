//
//  GetAllUsersNetworkContract.swift
//  KeyChainDemoBackend
//
//  Created by sathish-pt6686 on 19/06/23.
//

import Foundation

public protocol GetAllUsersNetworkContract{
    func getAllUsers(success: @escaping (([User]) -> Void), failure: @escaping ((String) -> Void))
}
