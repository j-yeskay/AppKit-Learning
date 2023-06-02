//
//  OutlineView.swift
//  SplitViewDemo
//
//  Created by sathish-pt6686 on 01/06/23.
//

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
            outlineViewManager.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            outlineViewManager.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            outlineViewManager.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            outlineViewManager.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
    }
}
