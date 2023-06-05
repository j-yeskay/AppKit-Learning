import Foundation
import AppKit

public class OutlineViewManager : NSObject, NSOutlineViewDelegate, NSOutlineViewDataSource{
    var outlineView : NSOutlineView = {
        let view = NSOutlineView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.wantsLayer = true
        view.addTableColumn(NSTableColumn())
        return view
    }()
    
    var scrollView : NSScrollView = {
        let view = NSScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    public func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
            // Return true if the item can be expanded, false otherwise
        return true
    }
        
    public func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
            // Return the number of child items for the specified item
        return 3
    }
        
    public func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
            // Return the child item at the specified index for the specified parent item
        return NSTextField(labelWithString: "hel")
    }
        
//    public func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
//            return NSTextField(labelWithString: "hello")
//    }
    
    
}

