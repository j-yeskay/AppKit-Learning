//
//  OutlineViewController.swift
//  SplitViewDemo
//
//  Created by sathish-pt6686 on 01/06/23.
//

import Foundation
import AppKit

public class OutlineViewManager : NSObject, NSOutlineViewDelegate, NSOutlineViewDataSource{
    var outlineView : NSOutlineView = {
        let view = NSOutlineView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.wantsLayer = true
        return view
    }()
    
    var scrollView : NSScrollView = {
        let view = NSScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    public func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
            // Return true if the item can be expanded, false otherwise
        return false
    }
        
    public func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
            // Return the number of child items for the specified item
        return 3
    }
        
    public func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
            // Return the child item at the specified index for the specified parent item
        return NSTextField(labelWithString: "hello")
    }
        
    public func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
            return NSTextField(labelWithString: "hello")
    }
    
    
}
