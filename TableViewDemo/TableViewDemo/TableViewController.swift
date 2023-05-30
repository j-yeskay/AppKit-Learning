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
    
    public var formView : FormView!
    
    public var refreshButton : RefreshButton!
    
    public var emailDetailView : EmailDetailView!
    
    public override func loadView() {
        self.view = NSView(frame: NSScreen.main!.frame)

        tableViewManager = TableViewManager()
        scrollView = tableViewManager.scrollView
        tableViewManager.tableView.delegate = tableViewManager
        tableViewManager.tableView.dataSource = tableViewManager
        
        scrollView.documentView = tableViewManager.tableView
        emailDataController = EmailDataController()
        
        formView = FormView()
        
        formView.tableViewManager = tableViewManager
        formView.emailDataController = emailDataController
        
        tableViewManager.emailDataController = emailDataController
        
        refreshButton = RefreshButton()
        refreshButton.target = refreshButton
        refreshButton.action = #selector(refreshButton.buttonClick)
        refreshButton.tableViewManager = tableViewManager
        refreshButton.emailDataController = emailDataController
        
        tableViewManager.tableView.tableViewManager = tableViewManager
        
        emailDetailView = EmailDetailView.getEmailDetailViewInstance()
        emailDetailView.tableViewManager = tableViewManager

    }
    
    public override func viewDidLoad() {
        view.addSubview(scrollView)
        view.addSubview(formView)
        view.addSubview(refreshButton)
        view.addSubview(emailDetailView)
        
        emailDataController.get()
        (self.tableViewManager.tableView.dataSource as! TableViewManager).emailsFromNetworkCall = emailDataController.emails
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(50), execute: {
            self.tableViewManager.tableView.reloadData()
        })
        
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            scrollView.widthAnchor.constraint(equalToConstant: 410),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            formView.leadingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 100),
            formView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            formView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            formView.heightAnchor.constraint(equalToConstant: 450),
            formView.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor),
            
            refreshButton.leadingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 30),
            refreshButton.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
            emailDetailView.topAnchor.constraint(equalTo: formView.bottomAnchor, constant: 10),
            emailDetailView.trailingAnchor.constraint(equalTo: formView.trailingAnchor),
            emailDetailView.leadingAnchor.constraint(equalTo: formView.leadingAnchor),
            emailDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
        ])
    }
}
