//
//  TableView.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 24/05/23.
//

import Foundation
import AppKit

public var tableViewDelegate = TableViewDelegate()
public var tableViewDataSource = TableViewDataSource()

public class TableView : NSTableView{
    
    convenience init() {
        self.init(frame: NSRect())
        self.translatesAutoresizingMaskIntoConstraints = false
        self.intercellSpacing = NSSize(width: 0, height: 10)
        self.delegate = tableViewDelegate
        self.headerView = nil
        self.dataSource = tableViewDataSource
//        self.usesAutomaticRowHeights = true
        self.rowHeight = 100
        self.addTableColumn(NSTableColumn())
        self.selectionHighlightStyle = .none
    }
}
