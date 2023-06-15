//
//  CreateUserViewPresenterContract.swift
//  KeyChainDemoUI
//
//  Created by sathish-pt6686 on 13/06/23.
//

import Foundation

public protocol CreateUserPresenterContract{
    func viewLoaded()
    
    func signUp(userData : [String : String])
    
    func getRouter() -> CreateUserRouterContract & LoginRouterContract
}
