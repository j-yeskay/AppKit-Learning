//
//  RightNavbarItemView.swift
//  GoogleHomePage
//
//  Created by sathish-pt6686 on 12/05/23.
//

import Foundation
import AppKit


public class RightNavbarItem : NSTextField{
    public override func mouseExited(with event: NSEvent) {
        self.attributedStringValue = NSAttributedString(string: self.attributedStringValue.string, attributes: [:])
    }

    public override func mouseEntered(with event: NSEvent) {
        self.attributedStringValue = NSAttributedString(string: self.attributedStringValue.string, attributes: [.underlineStyle : NSUnderlineStyle.single.rawValue])
        
    }
    
    public override func updateTrackingAreas() {
        super.updateTrackingAreas()
        self.addTrackingArea(NSTrackingArea.init(rect: self.bounds, options: [.activeAlways, .mouseEnteredAndExited], owner: self))
    }
}
