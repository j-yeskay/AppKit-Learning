//
//  TextField.swift
//  TextDemo
//
//  Created by sathish-pt6686 on 19/05/23.
//

import Foundation
import AppKit


public class TextField : NSTextField{
    convenience init() {
        self.init(frame: NSRect())
        self.font = NSFont.systemFont(ofSize: 25)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
