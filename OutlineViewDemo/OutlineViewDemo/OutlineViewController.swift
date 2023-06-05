import Foundation
import AppKit


public class OutlineViewController : NSViewController{
    public var outlineViewManager : OutlineViewManager!
    public var taskDataController : TaskDataController!
    
    public override func loadView() {
        self.view = NSView(frame: NSScreen.main!.frame)
        outlineViewManager = OutlineViewManager()
        outlineViewManager.scrollView.documentView = outlineViewManager.outlineView
        outlineViewManager.scrollView.hasVerticalScroller = true
        
        outlineViewManager.outlineView.delegate = outlineViewManager
        outlineViewManager.outlineView.dataSource = outlineViewManager
        
        taskDataController = TaskDataController()
        outlineViewManager.taskDataController = taskDataController
    }
    
    public override func viewDidLoad() {
        self.view.addSubview(outlineViewManager.scrollView)
        
        taskDataController.get()
        self.outlineViewManager.tasksFromNetworkCall = taskDataController.tasks
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(50), execute: {
            self.outlineViewManager.outlineView.reloadData()
        })
        NSLayoutConstraint.activate([
            self.outlineViewManager.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
            self.outlineViewManager.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -500),
            self.outlineViewManager.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
//            outlineViewManager.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -500),
            self.outlineViewManager.scrollView.heightAnchor.constraint(greaterThanOrEqualToConstant: 400)
        ])
        
    }
}

