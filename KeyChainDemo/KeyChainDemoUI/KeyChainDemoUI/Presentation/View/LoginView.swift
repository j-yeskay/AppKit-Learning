//
//  LoginView.swift
//  KeyChainDemoUI
//
//  Created by sathish-pt6686 on 13/06/23.


import Foundation
import AppKit

public class LoginView : NSView{
    var presenter : LoginPresenterContract
    public init(presenter : LoginPresenterContract){
        self.presenter = presenter
        super.init(frame: NSScreen.main!.frame)

        self.loginButton.target = self
        self.loginButton.action = #selector(loginButtonClick)
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

    var loginTitle : NSTextField = {
        let view = NSTextField(labelWithString: "login Page")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var loginButton : NSButton = {
        let button = NSButton()
        button.title = "Login"
        button.wantsLayer = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var goToSignUpButton : NSButton = {
        let button = NSButton()
        button.title = "Go to Signup Page"
        button.wantsLayer = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc func loginButtonClick(){
        let emailId = self.emailField.stringValue
        let password = self.passwordField.stringValue

        self.presenter.login(userData: ["email" : emailId, "password" : password])
    }
    
    @objc func goToSignupButtonClick(){
        self.presenter.getRouter().launchCreateUserView()
    }

}

extension LoginView : LoginViewContract{
    
    public func showAlert() {
        
    }
    
    public func emptyFields() {
        
    }
    
    public func load(email : String? = nil){
        self.addSubview(self.emailLabel)
        self.addSubview(self.passwordLabel)
        self.addSubview(self.emailField)
        self.addSubview(self.passwordField)
        self.addSubview(self.loginTitle)
        self.addSubview(self.loginButton)
        self.addSubview(self.goToSignUpButton)
        
        self.goToSignUpButton.target = self
        self.goToSignUpButton.action = #selector(goToSignupButtonClick)
        
        self.activateConstraints()
        
        if email != nil{
            self.emailField.stringValue = email!
        }
    }

    func activateConstraints(){
        NSLayoutConstraint.activate([

            self.loginTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.loginTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),

            self.emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailLabel.topAnchor.constraint(equalTo: self.loginTitle.bottomAnchor, constant: 50),

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

            self.loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 200),
            self.loginButton.heightAnchor.constraint(equalToConstant: 50),
            self.loginButton.widthAnchor.constraint(equalToConstant: 70),
            self.loginButton.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 100),
            
            self.goToSignUpButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -200),
            self.goToSignUpButton.heightAnchor.constraint(equalToConstant: 50),
            self.goToSignUpButton.widthAnchor.constraint(equalToConstant: 110),
            self.goToSignUpButton.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 100)

        ])
    }
}
