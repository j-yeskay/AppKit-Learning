//
//  RightNavbarView.swift
//  GoogleHomePage
//
//  Created by sathish-pt6686 on 12/05/23.
//

import Foundation
import AppKit


public class RightNavbarView : NSStackView{
    convenience init() {
        
        let linkattributes : [NSAttributedString.Key : Any] = [:]
        
        
        let gmailAttributedText = NSAttributedString(string: "Gmail", attributes: linkattributes)
        let imagesAttributedText = NSAttributedString(string: "Images", attributes: linkattributes)

        
        let gmailTextField = RightNavbarItem(labelWithAttributedString: gmailAttributedText)
        let imagesTextField = RightNavbarItem(labelWithAttributedString: imagesAttributedText)
        
        let signInButton = SignInButton()
        
        
        self.init(views: [gmailTextField, imagesTextField, signInButton])
        
        self.setCustomSpacing(CGFloat(18), after: self.views.first!)
        self.setCustomSpacing(CGFloat(30), after: self.views[1])
    }
    


}
