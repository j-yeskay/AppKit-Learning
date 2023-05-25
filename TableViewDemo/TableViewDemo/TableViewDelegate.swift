//
//  TabelViewDelegate.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 24/05/23.
//

import Foundation
import AppKit


public class TableViewDelegate : NSObject, NSTableViewDelegate{
    public func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let tableCellView = TableCellView()
        
        return tableCellView
        
    }
}
