//
//  UserModel.swift
//  KeyChainDemoBackend
//
//  Created by sathish-pt6686 on 13/06/23.
//

import Foundation


public class User{
    public var id : Int?
    public var email : String
    
    init(id: Int? = nil, email: String) {
        self.id = id
        self.email = email
    }
}
