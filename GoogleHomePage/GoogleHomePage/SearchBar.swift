//
//  SearchBar.swift
//  GoogleHomePage
//
//  Created by sathish-pt6686 on 12/05/23.
//

import Foundation
import AppKit


public class SearchBar : NSSearchField{
    convenience init() {
        self.init(frame: NSRect())
        self.wantsLayer = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.focusRingType = .none
        self.layer?.cornerRadius = CGFloat(10)
        self.isBordered = false
//        self.textColor = NSColor.black
//        self.layer?.backgroundColor = NSColor.white.cgColor
        self.font = NSFont.systemFont(ofSize: 18)
        self.placeholderString = ""
    }
    
    public override var searchButtonBounds: NSRect{
        return NSRect(x: 0, y: 0, width: 0, height: 0)
    }
    
}
