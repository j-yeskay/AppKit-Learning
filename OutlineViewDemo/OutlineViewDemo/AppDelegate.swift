//
//  AppDelegate.swift
//  OutlineViewDemo
//
//  Created by sathish-pt6686 on 05/06/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    public var windowControler : WindowController!

    public var outlineViewController : OutlineViewController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        windowControler = WindowController()

        outlineViewController = OutlineViewController()
        
//        windowControler.contentViewController = viewController
        
        windowControler.contentViewController = outlineViewController
//        windowControler.window!.setContentSize(NSSize(width: 100, height: 100))
        
        windowControler.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}


