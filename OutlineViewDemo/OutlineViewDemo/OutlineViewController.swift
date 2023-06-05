import Foundation
import AppKit


public class OutlineViewController : NSViewController{
    public var outlineViewManager : OutlineViewManager!
    
    public override func loadView() {
        self.view = NSView(frame: NSScreen.main!.frame)
        outlineViewManager = OutlineViewManager()
        outlineViewManager.scrollView.documentView = outlineViewManager.outlineView
        outlineViewManager.scrollView.hasVerticalScroller = true
        
        outlineViewManager.outlineView.delegate = outlineViewManager
        outlineViewManager.outlineView.dataSource = outlineViewManager
    }
    
    public override func viewDidLoad() {
        self.view.addSubview(outlineViewManager.scrollView)
        
        NSLayoutConstraint.activate([
            outlineViewManager.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
            outlineViewManager.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -500),
            outlineViewManager.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            outlineViewManager.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -500),
        ])
        
    }
}

