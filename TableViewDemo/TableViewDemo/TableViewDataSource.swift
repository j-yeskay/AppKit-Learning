//
//  TableViewDataSource.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 24/05/23.
//

import Foundation
import AppKit


public class TableViewDataSource : NSObject, NSTableViewDataSource{
    public func numberOfRows(in tableView: NSTableView) -> Int {
        return 30
    }
}
