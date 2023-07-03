//
//  AppDelegate.swift
//  SplitViewDemo
//
//  Created by sathish-pt6686 on 15/06/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    public var window : NSWindow!
    public var sideBar : NSSplitViewItem!

    @objc public func buttonClick(){
        self.sideBar.isCollapsed = true
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.window = NSWindow(contentRect: NSScreen.main!.frame, styleMask: [.closable, .miniaturizable, .resizable, .titled], backing: .buffered, defer: false)
        self.window.setContentSize(NSSize(width: NSScreen.main!.frame.width / 2.0, height: NSScreen.main!.frame.height / 2.0))
//        self.window.backgroundColor = NSColor.clear.withAlphaComponent(0.6)
//        var splitView = NSSplitView()
//        splitView.isVertical = true
//
//        let view1 = NSView(frame: NSRect(x: 0, y: 0, width: NSScreen.main!.frame.width / 2, height: NSScreen.main!.frame.height))
//        view1.wantsLayer = true
//        view1.layer?.backgroundColor = .white
//       let view3 = NSSplitViewItem()
//
//        let view2 = NSView(frame: NSRect(x: view1.frame.width, y: 0, width: NSScreen.main!.frame.width / 2, height: NSScreen.main!.frame.height))
//        view2.wantsLayer = true
//        view2.layer?.backgroundColor = .black
//
//        splitView.addSubview(view1)
//        splitView.addSubview(view2)
        let splitViewController = NSSplitViewController()
        // Create the sidebar view
               let sidebarViewController = NSViewController()
               sidebarViewController.view = NSVisualEffectView(frame: NSRect(x: 0, y: 0, width: 200, height: NSScreen.main!.frame.height))
//        sidebarViewController.view.
               sidebarViewController.view.wantsLayer = true
               sidebarViewController.view.layer?.backgroundColor = NSColor.lightGray.cgColor
                
        
        let collapseButton = NSButton(title: "Close", target: self, action: #selector(buttonClick))
        sidebarViewController.view.addSubview(collapseButton)
        sidebarViewController.view.wantsLayer = true
        sidebarViewController.view.layer?.backgroundColor = .clear

               // Create the main content view
               let contentViewController = NSViewController()
               contentViewController.view = NSView(frame: NSRect(x: 0, y: 0, width: NSScreen.main!.frame.width - 200, height: NSScreen.main!.frame.height))
               contentViewController.view.wantsLayer = true
               contentViewController.view.layer?.backgroundColor = NSColor.white.cgColor

               // Add the sidebar and content view controllers to the split view controller
        sideBar = NSSplitViewItem(viewController: sidebarViewController)
        sideBar.canCollapse = true
        
        splitViewController.addSplitViewItem(sideBar)
        
               splitViewController.addSplitViewItem(NSSplitViewItem(viewController: contentViewController))

               self.window.contentViewController = splitViewController
//
//        self.window.contentView = splitView
        
        self.window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

}

