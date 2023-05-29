//
//  DeleteButton.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 29/05/23.
//

import Foundation
import AppKit


public class DeleteButton : NSButton{
    convenience init() {
        self.init(frame: NSRect())
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = NSImage(systemSymbolName: "trash", accessibilityDescription: nil)!
        self.wantsLayer = true
        self.layer?.backgroundColor = .clear
        self.isBordered = false
        self.isHidden = true
    }
}
