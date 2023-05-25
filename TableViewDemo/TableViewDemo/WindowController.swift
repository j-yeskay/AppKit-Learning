//
//  WindowController.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 24/05/23.
//

import Foundation
import AppKit


public class WindowController : NSWindowController{
    convenience init() {
        self.init(window: NSWindow(contentRect: NSScreen.main!.frame, styleMask: [.closable, .miniaturizable, .resizable, .titled], backing: .buffered, defer: false))
    }
}
