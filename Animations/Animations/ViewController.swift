//
//  ViewController.swift
//  Animations
//
//  Created by sathish-pt6686 on 30/05/23.
//

import Foundation
import AppKit


public class ViewController: NSViewController {
    public var collectionViewManager: CollectionViewManager!
    public var calendarController: CalendarController!

//    public var currentMonth: NSTextField!
    
    public override func loadView() {
        self.view = NSView(frame: NSScreen.main!.frame)
        collectionViewManager = CollectionViewManager()
        calendarController = CalendarController()
        calendarController.collectionViewManager = collectionViewManager
        calendarController.generateDates()
        collectionViewManager.collectionView.dataSource = collectionViewManager
        collectionViewManager.scrollView.documentView = collectionViewManager.collectionView
        collectionViewManager.collectionView.register(MyItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: "MyItem"))
        
        calendarController.nextbutton.target = calendarController
        calendarController.previousbutton.target = calendarController

    }

    public override func viewDidLoad() {
        self.view.addSubview(collectionViewManager.scrollView)
        self.view.addSubview(calendarController.previousbutton)
        self.view.addSubview(calendarController.nextbutton)
        self.view.addSubview(calendarController.currentMonth)

        NSLayoutConstraint.activate([
            collectionViewManager.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionViewManager.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -500),
            collectionViewManager.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionViewManager.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            
            calendarController.previousbutton.leadingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -500),
            calendarController.previousbutton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            calendarController.previousbutton.heightAnchor.constraint(equalToConstant: 50),
            calendarController.previousbutton.widthAnchor.constraint(equalToConstant: 100),
            
            calendarController.nextbutton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            calendarController.nextbutton.heightAnchor.constraint(equalToConstant: 50),
            calendarController.nextbutton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            calendarController.nextbutton.widthAnchor.constraint(equalToConstant: 100),
            
            calendarController.currentMonth.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 115),
            calendarController.currentMonth.leadingAnchor.constraint(equalTo: calendarController.previousbutton.trailingAnchor, constant: 100)
            
        ])
    }
}
