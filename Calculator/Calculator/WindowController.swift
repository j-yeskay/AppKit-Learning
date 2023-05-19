//
//  WindowController.swift
//  Calculator
//
//  Created by sathish-pt6686 on 18/05/23.
//

import Foundation
import AppKit


public class WindowController : NSWindowController{
    convenience init() {
        self.init(window: NSWindow(contentRect: NSRect(x: 0, y: 0, width: NSScreen.main!.frame.maxX, height: NSScreen.main!.frame.maxY), styleMask: [.closable, .miniaturizable, .titled, .resizable], backing: .buffered, defer: false))
    }
}
