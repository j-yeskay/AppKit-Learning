//
//  AppDelegate.swift
//  TableView2
//
//  Created by sathish-pt6686 on 31/05/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    public var viewController : ViewController!
    public var windowController : WindowController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        viewController = ViewController()
        windowController = WindowController()
        
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

