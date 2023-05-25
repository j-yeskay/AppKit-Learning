//nil
//nil
//nil
//nil
//nil
//nil
//nil





























//
//  TableViewDataSource.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 24/05/23.
//

import Foundation
import AppKit


public class TableViewDataSource : NSObject, NSTableViewDataSource{
    
    static var dataSourceInstance : TableViewDataSource!
    
    var emails : [Email] = []
    
    public func numberOfRows(in tableView: NSTableView) -> Int {
        return emails.count
    }
    
    private override init() {

    }
    
    public static func getTableViewDataSourceInstance() -> TableViewDataSource{
        if dataSourceInstance == nil{
            dataSourceInstance = TableViewDataSource()
        }
        return dataSourceInstance
    }
}

