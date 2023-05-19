//
//  CalculatorResult.swift
//  Calculator
//
//  Created by sathish-pt6686 on 19/05/23.
//

import Foundation
import AppKit


public class CalculatorResult : NSTextView{
    convenience init() {
        self.init(frame: NSRect())
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isSelectable = false
        self.backgroundColor = .clear
        self.wantsLayer = true
        self.layer?.borderWidth = CGFloat(0.4)
        self.layer?.borderColor = NSColor.lightGray.cgColor
        self.font = NSFont.systemFont(ofSize: 65)
    }
}
