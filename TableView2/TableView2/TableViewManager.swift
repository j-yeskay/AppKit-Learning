//
//  TableViewManager.swift
//  TableView2
//
//  Created by sathish-pt6686 on 31/05/23.
//

import Foundation
import AppKit


public class TableViewManager : NSObject, NSTableViewDataSource, NSTableViewDelegate{
    
    public var tableView : TableView = {
        let view = TableView()
        return view
    }()
    
    public var scrollView : ScrollView = {
        let view = ScrollView()
        return view
    }()
    
    public var data : [Data] = {
        return Data.getData()
    }()
    
    public class TableView : NSTableView{
        convenience init() {
            self.init(frame: NSRect())
            self.translatesAutoresizingMaskIntoConstraints = false
            
            let column1 = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "Column1"))
            let column2 = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "Column2"))
            column1.width = 2
            self.addTableColumn(column1)
            self.columnAutoresizingStyle = .uniformColumnAutoresizingStyle

            self.gridStyleMask = .solidVerticalGridLineMask
            self.addTableColumn(column2)
            self.intercellSpacing = .init(width: 0, height: 10)
            
            let sortDescriptor = NSSortDescriptor(key: "amount", ascending: true)
        
            column2.sortDescriptorPrototype = sortDescriptor
        }
        public override func reloadData() {
            super.reloadData()
        }
    }
    
    public class ScrollView : NSScrollView{
        convenience init() {
            self.init(frame: NSRect())
            self.translatesAutoresizingMaskIntoConstraints = false
            self.hasHorizontalScroller = true
            self.hasVerticalScroller = true
        }
    }
    
    public class TableRowView : NSTableRowView{
        convenience init() {
            self.init(frame: NSRect())
            self.translatesAutoresizingMaskIntoConstraints = false
            self.wantsLayer = true
        }
   }
    
    public func numberOfRows(in tableView: NSTableView) -> Int {
        return self.data.count
    }

    public func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "Column1"){
            return NSTextField(labelWithString: data[row].name)
        }
        else{
            return NSTextField(labelWithString: String(data[row].amount))
        }
    }
    
    public func tableView(_ tableView: NSTableView, sortDescriptorsDidChange oldDescriptors: [NSSortDescriptor]) {

//        if oldDescriptors == []{
//            self.data = self.data.sorted(by: {
//                d1, d2 in
//                return d1.amount < d2.amount
//            })
//        } else {
//            self.data = self.data.sorted(by: {
//                d1, d2 in
//                if oldDescriptors.first!.ascending {
//                    return d1.amount > d2.amount
//                } else {
//                    return d1.amount < d2.amount
//                }
//            })
//        }
        if tableView.sortDescriptors.first!.ascending{
            self.data = self.data.sorted(by: {data1, data2 in
                return data1.amount < data2.amount
            })
        }
        else{
            self.data = self.data.sorted(by: {data1, data2 in
                return data1.amount > data2.amount
            })
        }
        
        tableView.reloadData()
    }
    public func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        let view = TableRowView()
        return view
    }
    
}
