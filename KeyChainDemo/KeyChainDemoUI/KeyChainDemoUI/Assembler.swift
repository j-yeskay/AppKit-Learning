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
    
    static func getCreateUserView(router : CreateUserRouterContract) -> CreateUserView{
        
        let presenter = CreateUserPresenter(router : router, usecase: getCreateUserUsecase())
        
        let view = CreateUserView(presenter : presenter)
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
