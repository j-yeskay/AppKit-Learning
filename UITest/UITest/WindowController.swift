//
//  WindowController.swift
//  UITest
//
//  Created by sathish-pt6686 on 04/05/23.
//

import Foundation
import AppKit


public class MainWindowController : NSWindowController{
        

    
    public override func windowDidLoad() {
        print("window loaded...")
    }
    

    
    
    convenience init() {
        let maxX = NSScreen.main!.frame.maxX

        let maxY = NSScreen.main!.frame.maxY

        let window = NSWindow(contentRect: NSRect(x: 0, y: 0 , width: maxX, height:  maxY), styleMask: [.closable, .resizable, .miniaturizable, .titled], backing: .buffered, defer: false)
        
        window.titlebarAppearsTransparent = true
  
        window.backgroundColor = NSColor.green
        
        window.minSize = NSSize(width: maxX / 4, height: maxY / 2)
        
        self.init(window: window)

    }
}

