//
//  Router.swift
//  KeyChainDemoUI
//
//  Created by sathish-pt6686 on 13/06/23.
//

import Foundation
import AppKit


public class Router{
    var window : NSWindow
    var createUserView : CreateUserViewContract?
    init() {
        self.window = NSWindow(contentRect: NSScreen.main!.frame, styleMask: [.closable, .miniaturizable, .resizable, .titled], backing: .buffered, defer: false)
        self.window.setContentSize(NSSize(width: NSScreen.main!.frame.width / 2.0, height: NSScreen.main!.frame.height / 2.0))
        self.window.makeKeyAndOrderFront(nil)
    }
}

extension Router : CreateUserRouterContract{
    public func launchCreateUserView() {
        self.window.contentView = Assembler.getCreateUserView(router : self)
    }
}
