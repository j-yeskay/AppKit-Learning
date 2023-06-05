//
//  WindowController.swift
//  OutlineViewDemo
//
//  Created by sathish-pt6686 on 05/06/23.
//

import Foundation
import AppKit


public class WindowController : NSWindowController{
    convenience init() {
        self.init(window: NSWindow(contentRect: NSScreen.main!.frame, styleMask: [.closable, .resizable, .miniaturizable, .titled], backing: .buffered, defer: false))
        
    }

}


