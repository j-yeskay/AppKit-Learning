//
//  SearchIcon.swift
//  GoogleHomePage
//
//  Created by sathish-pt6686 on 15/05/23.
//

import Foundation
import AppKit


public class SearchIcon : NSImageView{
    convenience init() {
        self.init(image: NSImage(systemSymbolName: "magnifyingglass", accessibilityDescription: nil)!)
        self.translatesAutoresizingMaskIntoConstraints = false
//        self.contentTintColor = NSColor.black
    }
}

