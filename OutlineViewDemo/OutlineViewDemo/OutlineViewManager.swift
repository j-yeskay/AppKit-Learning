import Foundation
import AppKit

public class OutlineViewManager : NSObject, NSOutlineViewDelegate, NSOutlineViewDataSource{
    var outlineView : NSOutlineView = {
        let view = NSOutlineView()
//        view.translatesAutoresizingMaskIntoConstraints = false
        view.wantsLayer = true
        view.addTableColumn(NSTableColumn())
//        view.style = .fullWidth
        view.intercellSpacing = NSSize(width: 0, height: 10)
        view.selectionHighlightStyle = .none
        return view
    }()
    
    var scrollView : NSScrollView = {
        let view = NSScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public class TableRowView : NSTableRowView{
        var isTaskItem : Bool = false
        convenience init(){
            self.init(frame: NSRect())
            self.selectionHighlightStyle = .none
        }
        
        public override func rightMouseDown(with event: NSEvent) {
            if isTaskItem{
                print("yes")
            }
            else{
                print("no")
            }
        }

        public override func updateTrackingAreas() {
            super.updateTrackingAreas()
            self.addTrackingArea(NSTrackingArea.init(rect: self.bounds, options: [.activeAlways, .mouseEnteredAndExited], owner: self))
        }
    }
    
    public func outlineView(_ outlineView: NSOutlineView, rowViewForItem item: Any) -> NSTableRowView? {
        let view = TableRowView()
        if let _ = (item as? Task){
            view.isTaskItem = false
        }
        else{
            view.isTaskItem = true
        }
        return view
    }
    
    public class TaskText : NSTextField{
        
        convenience init(taskTitle : String) {
            let attributedString = NSAttributedString(string: taskTitle)
            self.init(labelWithAttributedString: attributedString)
            self.wantsLayer = true
        }
        
        public func strike(){
            self.attributedStringValue = NSAttributedString(string: self.attributedStringValue.string, attributes: [.strikethroughStyle:1])
        }

        public func unStrike(){
            self.attributedStringValue = NSAttributedString(string: self.attributedStringValue.string, attributes: [:])
        }
        
        public override func mouseEntered(with event: NSEvent) {
            super.mouseEntered(with: event)
            self.layer?.backgroundColor = NSColor.lightGray.withAlphaComponent(0.1).cgColor
        }

        public override func mouseExited(with event: NSEvent) {
            super.mouseExited(with: event)
            self.layer?.backgroundColor = nil
        }
        
        public override func updateTrackingAreas() {
            super.updateTrackingAreas()
            self.addTrackingArea(NSTrackingArea.init(rect: self.bounds, options: [.activeAlways, .mouseEnteredAndExited], owner: self))
        }
    }
    
    public var tasksFromNetworkCall : [Task] = []
    weak var taskDataController : TaskDataController?
    
    public func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        if let _ = item as? Task{
            return true
        }
        else{
            return false
        }
    }

    public func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if item == nil{
            return tasksFromNetworkCall.count
        }
        else{
            return (item as! Task).tasks.count
        }
    }
    
    public func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if item == nil{
            return tasksFromNetworkCall[index]
        }
        
        else{
            return (item as! Task).tasks[index]
        }
    }
    
    public func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        if let _ = (item as? Task){
            return NSTextField(labelWithString: "\(String(describing: (item as! Task).taskGroupName))")
        }
        else{
            let taskItem = (item as! Task.TaskItem)
            let taskText = TaskText(taskTitle: taskItem.title)
            if taskItem.completed{
                taskText.strike()
            }
            return taskText
        }
    }
        

}

