//
//  TableViewController.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 24/05/23.
//

import Foundation
import AppKit



public class TableViewController : NSViewController{
    public var scrollView : ScrollView!
    public var tableView: TableView!
    public override func loadView() {
        self.view = NSView(frame: NSScreen.main!.frame)
        scrollView = ScrollView()
        tableView = TableView()
        scrollView.documentView = tableView
    }
    
    public override func viewDidLoad() {
        view.addSubview(scrollView)
        
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            scrollView.widthAnchor.constraint(equalToConstant: 500),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        ])
    }
}
