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

        let identifier = NSUserInterfaceItemIdentifier(rawValue: "cellview")

        var view = tableView.makeView(withIdentifier: identifier, owner: self) as? TableCellView

        if view == nil{
            view = TableCellView()
            view?.identifier = identifier
        }
        let dataSource = TableViewDataSource.getTableViewDataSourceInstance()
        view?.emailView.emailId.stringValue = dataSource.emails[row].emailId
        return view
//        return TableCellView()
    }
    
    public func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        return NSTableRowView()
    }

}
