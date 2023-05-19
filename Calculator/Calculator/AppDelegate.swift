//
//  AppDelegate.swift
//  Calculator
//
//  Created by sathish-pt6686 on 18/05/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    

    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let windowController = WindowController()
        
        let viewController = ViewController()
        
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

