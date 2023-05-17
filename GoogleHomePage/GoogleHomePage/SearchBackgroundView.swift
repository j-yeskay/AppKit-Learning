//
//  SearchBackgroundView.swift
//  GoogleHomePage
//
//  Created by sathish-pt6686 on 12/05/23.
//

import Foundation
import AppKit


public class SearchBackground : NSView{
    init() {
        super.init(frame: NSRect())
        self.wantsLayer = true
        self.translatesAutoresizingMaskIntoConstraints = false
//        self.layer?.backgroundColor = NSColor.white.cgColor
        
        self.layer?.cornerRadius = CGFloat(23)
        self.layer?.borderWidth = CGFloat(0.2)
        self.layer?.borderColor = NSColor.gray.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func mouseExited(with event: NSEvent) {
        self.shadow = nil
    }

    public override func mouseEntered(with event: NSEvent) {
        self.shadow = NSShadow()
        self.layer?.shadowOpacity = 1.0
        self.layer?.shadowColor = NSColor.black.withAlphaComponent(1).cgColor
        self.layer?.shadowRadius = 3
    }
    
    public override func updateTrackingAreas() {
        super.updateTrackingAreas()
        self.addTrackingArea(NSTrackingArea.init(rect: self.bounds, options: [.activeAlways, .mouseEnteredAndExited], owner: self))
    }
  
}
