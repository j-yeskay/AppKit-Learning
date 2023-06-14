//
//  BaseUsecase.swift
//  KeyChainDemoBackend
//
//  Created by sathish-pt6686 on 13/06/23.
//

import Foundation


open class BaseUsecaseRequest{
    public var qos: DispatchQoS.QoSClass = .utility
    
    public init(){
        
    }
}

open class BaseUsecaseResponse{
    
    public var status : ResponseStatus
    
    public enum ResponseStatus{
        case success
        case failure
        
    }
    public init(status : ResponseStatus){
        self.status = status
    }
}

open class BaseUsecaseError{
    public var error : ErrorType
    
    public enum ErrorType{
        case networkError(String)
        case unknownError
    }
    
    public init(error: ErrorType) {
        self.error = error
    }
}


struct UsecaseQueue{
    static let queue = DispatchQueue(label: "usecaseQueue", attributes: .concurrent)
}

open class BaseUsecase<CustomRequest : BaseUsecaseRequest, CustomResponse : BaseUsecaseResponse, CustomError : BaseUsecaseError>{
    public final func execute(request : CustomRequest, usecaseSuccess : @escaping ((_ response : CustomResponse) -> Void), usecaseFailure : @escaping ((_ error : CustomError) -> Void)){
        UsecaseQueue.queue.async {[weak self] in
            self?.run(request : request, success : usecaseSuccess, failure : usecaseFailure)
        }
    }
    
    open func run(request : CustomRequest, success : @escaping ((_ response : CustomResponse) -> Void), failure :  @escaping ((_ error : CustomError) -> Void)){
        
    }
    
    public final func invokeSuccess(callback : @escaping ((_ response : CustomResponse) -> Void), response : CustomResponse){
        if Thread.isMainThread{
            callback(response)
        }
        else{
            DispatchQueue.main.async {
                callback(response)
            }
        }
    }
    
    public final func invokeFailure(callback : @escaping ((_ error : CustomError) -> Void), error : CustomError){
        if Thread.isMainThread{
            callback(error)
        }
        else{
            DispatchQueue.main.async {
                callback(error)
            }
        }
    }
}
