//
//  AppDelegate.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 23/05/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    public var windowController : WindowController!
    public var viewController : TableViewController!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        windowController = WindowController()
        viewController = TableViewController()
        
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

