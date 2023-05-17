//
//  Footer.swift
//  GoogleHomePage
//
//  Created by sathish-pt6686 on 15/05/23.
//

import Foundation
import AppKit


public class Footer : NSStackView{
    convenience init() {
        
        let linkattributes : [NSAttributedString.Key : Any] = [:]
        
        
        let aboutAttributedText = NSAttributedString(string: "About", attributes: linkattributes)
        let advertisingAttributedText = NSAttributedString(string: "Advertising", attributes: linkattributes)
        let businessAttributedText = NSAttributedString(string: "Business", attributes: linkattributes)
        let howSearchWorksAttributedText = NSAttributedString(string: "How Search works", attributes: linkattributes)

        
        let aboutAttributedTextField = FooterItem(labelWithAttributedString: aboutAttributedText)
        let advertisingAttributedTextField = FooterItem(labelWithAttributedString: advertisingAttributedText)
        let businessAttributedTextField = FooterItem(labelWithAttributedString: businessAttributedText)
        let howSearchWorksAttributedTextField = FooterItem(labelWithAttributedString: howSearchWorksAttributedText)

        
        
        self.init(views: [aboutAttributedTextField, advertisingAttributedTextField, businessAttributedTextField, howSearchWorksAttributedTextField])
        self.translatesAutoresizingMaskIntoConstraints = false
        self.orientation = .horizontal
        self.wantsLayer = true
        self.layer?.backgroundColor = .black
//        self.setCustomSpacing(CGFloat(18), after: self.views.first!)
//        self.setCustomSpacing(CGFloat(30), after: self.views[1])
    }
}
