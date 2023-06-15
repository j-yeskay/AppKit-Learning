//
//  CreateUserView.swift
//  KeyChainDemoUI
//
//  Created by sathish-pt6686 on 13/06/23.
//

import Foundation
import AppKit

public class CreateUserView : NSView{
    var presenter : CreateUserPresenterContract
    public init(presenter : CreateUserPresenterContract){
        self.presenter = presenter
        super.init(frame: NSScreen.main!.frame)
        
        self.signUpButton.target = self
        self.signUpButton.action = #selector(signUpButtonClick)
    }
    
    override public func viewDidMoveToSuperview() {
        if superview != nil {
            presenter.viewLoaded()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var emailLabel : NSTextField = {
        let label = NSTextField(labelWithString: "Email")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var passwordLabel : NSTextField = {
        let label = NSTextField(labelWithString: "Password")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var emailField : NSTextField = {
        let view = NSTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var passwordField : NSTextField = {
        let view = NSTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var signUpTitle : NSTextField = {
        let view = NSTextField(labelWithString: "SignUp Page")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var signUpButton : NSButton = {
        let button = NSButton()
        button.title = "Signup"
        button.wantsLayer = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var alert : NSAlert = {
        let view = NSAlert()
        view.messageText = "User Already Exists!"
        view.icon = NSImage(systemSymbolName: "exclamationmark.brakesignal", accessibilityDescription: nil)
        return view
    }()
    
    @objc func signUpButtonClick(){
        let email = self.emailField.stringValue
        let password = self.passwordField.stringValue
        
        self.presenter.signUp(userData: ["email" : email, "password" : password])
    }
    
    var goToLoginButton : NSButton = {
        let button = NSButton()
        button.title = "Go to Login Page"
        button.wantsLayer = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc func goToLoginButtonClick(){
        self.presenter.getRouter().launchLoginView(email: nil)
    }

}

extension CreateUserView : CreateUserViewContract{
    public func load(){
        self.addSubview(self.emailLabel)
        self.addSubview(self.passwordLabel)
        self.addSubview(self.emailField)
        self.addSubview(self.passwordField)
        self.addSubview(self.signUpTitle)
        self.addSubview(self.signUpButton)
        self.addSubview(self.goToLoginButton)
        
        goToLoginButton.target = self
        goToLoginButton.action = #selector(goToLoginButtonClick)
        self.activateConstraints()
    }
    
    public func showAlert(){
        self.alert.runModal()
    }
    
    public func emptyFields(){
        self.emailField.stringValue = ""
        self.passwordField.stringValue = ""
    }
    
    func activateConstraints(){
        NSLayoutConstraint.activate([
            
            self.signUpTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.signUpTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            
            self.emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailLabel.topAnchor.constraint(equalTo: self.signUpTitle.bottomAnchor, constant: 50),
            
            self.emailField.leadingAnchor.constraint(equalTo: self.emailLabel.trailingAnchor, constant: 30),
            self.emailField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            self.emailField.heightAnchor.constraint(equalToConstant: 26),
            self.emailField.topAnchor.constraint(equalTo: self.emailLabel.topAnchor),
        
            self.passwordLabel.leadingAnchor.constraint(equalTo: self.emailLabel.leadingAnchor),
            self.passwordLabel.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 50),
            
            self.passwordField.leadingAnchor.constraint(equalTo: self.passwordLabel.trailingAnchor, constant: 20),
            self.passwordField.topAnchor.constraint(equalTo: self.passwordLabel.topAnchor),
            self.passwordField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            self.passwordField.heightAnchor.constraint(equalToConstant: 26),
            
            self.signUpButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 200),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 50),
            self.signUpButton.widthAnchor.constraint(equalToConstant: 70),
            self.signUpButton.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 100),
            
            self.goToLoginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -200),
            self.goToLoginButton.heightAnchor.constraint(equalToConstant: 50),
            self.goToLoginButton.widthAnchor.constraint(equalToConstant: 110),
            self.goToLoginButton.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 100)

            
        ])
    }
}
