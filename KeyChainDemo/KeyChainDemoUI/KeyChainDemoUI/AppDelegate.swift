//
//  AppDelegate.swift
//  KeyChainDemoUI
//
//  Created by sathish-pt6686 on 13/06/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let router = Router()
        router.launchCreateUserView()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

}

