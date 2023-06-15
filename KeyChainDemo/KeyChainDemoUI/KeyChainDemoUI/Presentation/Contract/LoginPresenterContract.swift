//
//  LoginPresenterContract.swift
//  KeyChainDemoUI
//
//  Created by sathish-pt6686 on 14/06/23.
//

import Foundation


public protocol LoginPresenterContract{
    func viewLoaded()
    
    func login(userData : [String : String])
    
    func getRouter() -> LoginRouterContract & CreateUserRouterContract
}
