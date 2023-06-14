//
//  CreateUserUsecase.swift
//  KeyChainDemoBackend
//
//  Created by sathish-pt6686 on 13/06/23.
//

import Foundation


public class CreateUserUsecaseRequest : BaseUsecaseRequest{
    public var userData : [String : String]
    
    public init(userData: [String : String]) {
        self.userData = userData
    }
}


public class CreateUserUsecaseResponse : BaseUsecaseResponse{
    public var user : User
    public init(user: User, status : ResponseStatus) {
        self.user = user
        super.init(status: status)
    }
}

public class CreateUserUsecaseError : BaseUsecaseError{
    
}


public class CreateUserUsecase : BaseUsecase<CreateUserUsecaseRequest, CreateUserUsecaseResponse, CreateUserUsecaseError>{
    var dataManager : CreateUserDataManagerContract
    
    public override func run(request: CreateUserUsecaseRequest, success: @escaping ((CreateUserUsecaseResponse) -> Void), failure: @escaping ((CreateUserUsecaseError) -> Void)) {
        dataManager.createUser(userData: request.userData, success: {[weak self] (user) in
            self?.success(user: user, callback: success)
        }, failure: {[weak self] error in
            self?.failure(error: error, callback: failure)
        })
    }
    
    public init(dataManager: CreateUserDataManagerContract) {
        self.dataManager = dataManager
    }
    
    
// MARK :- Convert User to Response Object and callback to Main Thread
    
    private func success(user : User, callback : @escaping ((CreateUserUsecaseResponse) -> Void)){
        let response = CreateUserUsecaseResponse(user: user, status: .success)
        invokeSuccess(callback: callback, response: response)
    }
    
// MARK :- Convert Error String to Error Object and callback to Main Thread
    
    private func failure(error : String, callback : @escaping ((CreateUserUsecaseError) -> Void)){
        let error = CreateUserUsecaseError(error: .networkError(error))
        invokeFailure(callback: callback, error: error)
    }
}
