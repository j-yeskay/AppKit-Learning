//
//  ProfilePictureView.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 25/05/23.
//

import Foundation
import AppKit


public class ProfilePictureView : NSImageView{
    var originalImage : NSImage!
    convenience init(image : NSImage){
        self.init(frame: NSRect())
        self.image = image
        self.contentTintColor = NSColor.init(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    
        self.originalImage = image
        self.translatesAutoresizingMaskIntoConstraints = false
        self.wantsLayer = true
        
        
        self.imageScaling = .scaleAxesIndependently
       
    }
    
    public override func mouseExited(with event: NSEvent) {
        self.image = self.originalImage
    }

    public override func mouseEntered(with event: NSEvent) {
        self.image = NSImage(systemSymbolName: "checkmark.circle.fill", accessibilityDescription: nil)
    }

    public override func updateTrackingAreas() {
        super.updateTrackingAreas()
        self.addTrackingArea(NSTrackingArea.init(rect: self.bounds, options: [.activeAlways, .mouseEnteredAndExited], owner: self))
    }
}
