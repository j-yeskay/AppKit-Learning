//
//  RefreshButton.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 29/05/23.
//
//
import Foundation
import AppKit
//
//
public class RefreshButton : NSButton{
    weak var tableViewManager : TableViewManager?
    weak var emailDataController : EmailDataController?
    var spinningAnimation : CABasicAnimation?
    var isSpinning : Bool = false
    convenience init() {
        self.init(image: NSImage(systemSymbolName: "arrow.clockwise", accessibilityDescription: nil)!, target: nil, action: nil)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.wantsLayer = true
        self.layer?.backgroundColor = .clear
        self.isBordered = false
    }

    @objc public func buttonClick(){
        self.emailDataController?.get()
        (self.tableViewManager!.tableView.dataSource as! TableViewManager).emailsFromNetworkCall = self.emailDataController!.emails
        print(self.emailDataController!.emails)
        print(self.tableViewManager?.emailsFromNetworkCall)
        self.tableViewManager?.tableView.reloadData()

    }

    public override func updateTrackingAreas() {
        super.updateTrackingAreas()
        self.addTrackingArea(NSTrackingArea.init(rect: self.bounds, options: [.activeAlways, .mouseEnteredAndExited], owner: self))
    }
}

