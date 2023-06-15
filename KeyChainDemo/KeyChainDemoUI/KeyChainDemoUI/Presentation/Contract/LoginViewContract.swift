//
//  LoginViewContract.swift
//  KeyChainDemoUI
//
//  Created by sathish-pt6686 on 14/06/23.
//

import Foundation


public protocol LoginViewContract{
    func load(email : String?)
    func showAlert()
    func emptyFields()
}
