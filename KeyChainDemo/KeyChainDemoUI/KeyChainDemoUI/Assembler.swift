//
//  Assembler.swift
//  KeyChainDemoUI
//
//  Created by sathish-pt6686 on 13/06/23.
//

import Foundation
import KeyChainDemoBackend


public class Assembler{
    private static func getCreateUserUsecase() -> CreateUserUsecase{
        let network = NetworkService()
        
        let dataManager = UserDataManager(network: network)
        
        return CreateUserUsecase(dataManager: dataManager)
    }
    
    static func getCreateUserView(router : LoginRouterContract & CreateUserRouterContract) -> CreateUserView{
        
        let presenter = CreateUserPresenter(router : router, usecase: getCreateUserUsecase())
        
        let view = CreateUserView(presenter : presenter)
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    private static func getLoginUsecase() -> LoginUsecase{
        let network = NetworkService()
        
        let dataManager = UserDataManager(network: network)
        
        return LoginUsecase(dataManager: dataManager)
    }
    
    static func getLoginView(router : LoginRouterContract & CreateUserRouterContract, email : String? = nil) -> LoginView{
        
        let presenter = LoginPresenter(router : router, usecase: getLoginUsecase())
        presenter.email = email
        
        let view = LoginView(presenter : presenter)
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
