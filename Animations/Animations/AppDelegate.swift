//
//  AppDelegate.swift
//  Animations
//
//  Created by sathish-pt6686 on 30/05/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    public var viewController : ViewController!
    public var windowController : WindowController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        windowController = WindowController()
        viewController = ViewController()
        windowController.contentViewController = viewController
        
        windowController.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

