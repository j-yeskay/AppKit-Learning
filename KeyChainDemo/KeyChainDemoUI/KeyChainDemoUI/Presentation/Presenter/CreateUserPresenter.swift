//
//  CreateUserPresenter.swift
//  KeyChainDemoUI
//
//  Created by sathish-pt6686 on 13/06/23.
//

import Foundation
import KeyChainDemoBackend

public class CreateUserPresenter{
    var view : CreateUserViewContract?
    var router : CreateUserRouterContract
    var usecase : CreateUserUsecase
    
    public init(router: CreateUserRouterContract, usecase : CreateUserUsecase) {
        self.router = router
        self.usecase = usecase
    }
}


extension CreateUserPresenter : CreateUserPresenterContract{
    public func viewLoaded() {
        self.view!.load()
    }
    
    public func signUp(userData : [String:String]){
        let request = CreateUserUsecaseRequest(userData: userData)
        
        self.usecase.execute(request: request, usecaseSuccess: {[weak self] (response) in
            self?.result(user : response.user)
        }, usecaseFailure: {[weak self] (error) in
            self?.failure(error : error)
        })
    }
    
    public func result(user : User){
        print("Account Created For : \(user.email)")
    }
    public func failure(error : CreateUserUsecaseError){
        print("fail : \(error.error)")
    }
}
