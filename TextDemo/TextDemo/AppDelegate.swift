//
//  AppDelegate.swift
//  TextDemo
//
//  Created by sathish-pt6686 on 19/05/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let windowController = WindowController()
        let viewController = ViewController()
        
        windowController.contentViewController = viewController
        
//        windowController.contentViewController = NewController()
        
        windowController.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

