//
//  AppDelegate.swift
//  UITest
//
//  Created by sathish-pt6686 on 04/05/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        let windowController = MainWindowController()

        let viewController = MainViewController()

        windowController.contentViewController = viewController

        windowController.showWindow(nil)
          
    }
    
    func applicationDockMenu(_ sender: NSApplication) -> NSMenu? {
        return nil
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

}

