//
//  LoginUsecase.swift
//  KeyChainDemoBackend
//
//  Created by sathish-pt6686 on 14/06/23.
//

import Foundation

public class LoginUsecaseRequest : BaseUsecaseRequest{
    public var userData : [String : String]
    
    public init(userData: [String : String]) {
        self.userData = userData
    }
}


public class LoginUsecaseResponse : BaseUsecaseResponse{
    public var user : User
    public init(user: User, status : ResponseStatus) {
        self.user = user
        super.init(status: status)
    }
}

public class LoginUsecaseError : BaseUsecaseError{
    
}


public class LoginUsecase : BaseUsecase<LoginUsecaseRequest, LoginUsecaseResponse, LoginUsecaseError>{
    var dataManager : LoginDataManagerContract
    
    public override func run(request: LoginUsecaseRequest, success: @escaping ((LoginUsecaseResponse) -> Void), failure: @escaping ((LoginUsecaseError) -> Void)) {
        dataManager.login(userData: request.userData, success: {[weak self] (user) in
            self?.success(user: user, callback: success)
        }, failure: {[weak self] error in
            self?.failure(error: error, callback: failure)
        })
    }
    
    public init(dataManager: LoginDataManagerContract) {
        self.dataManager = dataManager
    }
    
    
// MARK: - Convert User to Response Object and callback to Main Thread
    
    private func success(user : User, callback : @escaping ((LoginUsecaseResponse) -> Void)){
        let response = LoginUsecaseResponse(user: user, status: .success)
        invokeSuccess(callback: callback, response: response)
    }
    
// MARK: - Convert Error String to Error Object and callback to Main Thread
    
    private func failure(error : String, callback : @escaping ((LoginUsecaseError) -> Void)){
        var useCaseError : LoginUsecaseError?
        
        if error == "Wrong Password"{
            useCaseError = .init(error: .wrongPassword)
        }
        else{
            useCaseError = .init(error: .unknownError(error))
        }
        
        invokeFailure(callback: callback, error: useCaseError!)
    }
}
