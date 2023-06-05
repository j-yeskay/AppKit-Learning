//
//  ViewController.swift
//  TableView2
//
//  Created by sathish-pt6686 on 05/06/23.
//
import Foundation
import AppKit


//public class ViewController : NSViewController, NSSplitViewDelegate{
//    public override func loadView() {
//        let splitView = NSSplitView(frame: NSScreen.main!.frame)
//
//        splitView.dividerStyle = .thin
//
//        splitView.isVertical = true
//
//        splitView.delegate = self
//
//        let leftView = NSView(frame: NSScreen.main!.frame)
//        leftView.translatesAutoresizingMaskIntoConstraints = false
//
//        let rightView = NSView(frame: NSScreen.main!.frame)
//
//        splitView.addArrangedSubview(leftView)
//        splitView.addArrangedSubview(rightView)
//
//
//        NSLayoutConstraint.activate([
//            leftView.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
//            rightView.widthAnchor.constraint(equalToConstant: 100)
//        ])
//
//
//        self.view = splitView
//
//    }
//
//    public func splitView(_ splitView: NSSplitView, canCollapseSubview subview: NSView) -> Bool {
//        true
//    }
//
//    public override func viewDidLoad() {
//
//    }
//}

public class ViewController : NSViewController{
    public var tableViewManager : TableViewManager!
    
    public override func loadView() {
        self.view = NSView(frame: NSScreen.main!.frame)
        
        self.tableViewManager = TableViewManager()
        self.tableViewManager.scrollView.documentView = self.tableViewManager.tableView
        
        self.tableViewManager.tableView.dataSource = self.tableViewManager
        self.tableViewManager.tableView.delegate = self.tableViewManager
    }
    
    public override func viewDidLoad() {
        self.view.addSubview(self.tableViewManager.scrollView)
        
        NSLayoutConstraint.activate([
            self.tableViewManager.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
            self.tableViewManager.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100),
            
            self.tableViewManager.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
//            self.tableViewManager.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
            self.tableViewManager.scrollView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
