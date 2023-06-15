//
//  GetUserNetworkContract.swift
//  KeyChainDemoBackend
//
//  Created by sathish-pt6686 on 14/06/23.
//

import Foundation


public protocol GetUserNetworkContract{
    func getUser(userEmail : String, success : @escaping ((User) -> Void), failure : @escaping ((String) -> Void))
}
