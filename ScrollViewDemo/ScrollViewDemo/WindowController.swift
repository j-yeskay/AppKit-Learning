//
//  WindowController.swift
//  ScrollViewDemo
//
//  Created by sathish-pt6686 on 17/05/23.
//

import Foundation
import AppKit

let maxX = NSScreen.main!.frame.maxX
let maxY = NSScreen.main!.frame.maxY

public class WindowController : NSWindowController{
    convenience init() {
        self.init(window: NSWindow(contentRect: NSRect(x: 0, y: 0, width: maxX, height: maxY), styleMask: [.titled, .closable, .resizable, .miniaturizable], backing: .buffered, defer: false))
    }
}
