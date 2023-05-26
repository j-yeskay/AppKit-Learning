//
//  TableViewController.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 24/05/23.
//

import Foundation
import AppKit



public class TableViewController : NSViewController{
    public var scrollView : TableViewManager.ScrollView!
    public var tableViewManager : TableViewManager!
    public var emailDataController : EmailDataController!
    public override func loadView() {
        self.view = NSView(frame: NSScreen.main!.frame)

        tableViewManager = TableViewManager()
        scrollView = tableViewManager.scrollView
        tableViewManager.tableView.delegate = tableViewManager
        tableViewManager.tableView.dataSource = tableViewManager
        
        scrollView.documentView = tableViewManager.tableView
        emailDataController = EmailDataController()
        
        
    }
    
    public override func viewDidLoad() {
        view.addSubview(scrollView)
        
        emailDataController.getEmails()
        (self.tableViewManager.tableView.dataSource as! TableViewManager).emailsFromNetworkCall = emailDataController.emails
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(50), execute: {
            self.tableViewManager.tableView.reloadData()
        })
        
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            scrollView.widthAnchor.constraint(equalToConstant: 410),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        ])
    }
}
