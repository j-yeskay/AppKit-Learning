//
//  AppDelegate.swift
//  KeyChainDemoUI
//
//  Created by sathish-pt6686 on 13/06/23.
//

import Cocoa
import KeyChainDemoBackend

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let router = Router()
        router.launchCreateUserView()
        
//        let network = NetworkService()
//        network.createUser(userData: ["email" : "tester@test.com", "password" : "test"], success: {user in
//            print(user)
//        }, failure: {error in
//            print(error)
//        })
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

}

