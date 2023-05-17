//
//  WindowController.swift
//  GoogleHomePage
//
//  Created by sathish-pt6686 on 12/05/23.
//

import Foundation
import AppKit



public class WindowController : NSWindowController{
    
    convenience init() {
        
        let maxX = NSScreen.main!.frame.maxX
        let maxY = NSScreen.main!.frame.maxY

        let window = NSWindow(contentRect: NSRect(x: 0, y: 0 , width: maxX, height:  maxY), styleMask: [.closable, .resizable, .miniaturizable, .titled], backing: .buffered, defer: false)
        
        window.minSize = NSSize(width: maxX / 4, height: maxY / 2)
        
        self.init(window: window)

    }
    
}
