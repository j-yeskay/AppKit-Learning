//
//  LoginPresenter.swift
//  KeyChainDemoUI
//
//  Created by sathish-pt6686 on 14/06/23.
//

import Foundation
import KeyChainDemoBackend

public class LoginPresenter{
    var view : LoginViewContract?
    var router : LoginRouterContract & CreateUserRouterContract
    var usecase : LoginUsecase
    var email : String?
    
    public init(router: LoginRouterContract & CreateUserRouterContract, usecase : LoginUsecase) {
        self.router = router
        self.usecase = usecase
    }
}


extension LoginPresenter : LoginPresenterContract{
    public func getRouter() -> LoginRouterContract & CreateUserRouterContract {
        return self.router
    }
    
    public func viewLoaded() {
        self.view!.load(email: self.email)
    }
    
    public func login(userData : [String:String]){
        let request = LoginUsecaseRequest(userData: userData)
        
        self.usecase.execute(request: request, usecaseSuccess: {[weak self] (response) in
            self?.result(user : response.user)
        }, usecaseFailure: {[weak self] (error) in
            self?.failure(error : error)
        })
    }
    
    public func result(user : User){
        print("Logged in as \(user.email)")
    }
    public func failure(error : LoginUsecaseError){
        self.view?.emptyFields()
        
        print(error.error)
        
        if error.error == .wrongPassword{
            self.view?.showAlert()
        }
        print("here")
    }
}
