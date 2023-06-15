//
//  LoginNetworkCOntract.swift
//  KeyChainDemoBackend
//
//  Created by sathish-pt6686 on 14/06/23.
//

import Foundation


public protocol LoginNetworkContract{
    func login(userData : [String : String], success : @escaping ((User) -> Void), failure : @escaping ((String) -> Void))
}
