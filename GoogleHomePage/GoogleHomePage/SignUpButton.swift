//
//  SignUpButton.swift
//  GoogleHomePage
//
//  Created by sathish-pt6686 on 12/05/23.
//

import Foundation
import AppKit


public class SignInButton : NSButton{
    init() {
        super.init(frame: NSRect())
        self.wantsLayer = true
        self.bezelStyle = .texturedSquare
        self.layer?.backgroundColor = NSColor.init(red: 25/255, green: 110/255, blue: 255/255, alpha: 1).cgColor
        self.setButtonType(.momentaryChange)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer?.cornerRadius = CGFloat(4)
        
        let signInButtonAttributes : [NSAttributedString.Key : Any] = [.foregroundColor: NSColor.white, .font : NSFont.systemFont(ofSize: 14)]
        let signInAttributedText = NSAttributedString(string: "Sign In", attributes: signInButtonAttributes)
        
        self.attributedTitle = signInAttributedText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
