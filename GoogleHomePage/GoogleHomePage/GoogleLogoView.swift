//
//  GoogleLogoView.swift
//  GoogleHomePage
//
//  Created by sathish-pt6686 on 12/05/23.
//

import Foundation
import AppKit


public class GoogleLogoView : NSImageView{
    convenience init() {
        self.init(image: NSImage(named: NSImage.Name("GoogleLogo"))!)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
