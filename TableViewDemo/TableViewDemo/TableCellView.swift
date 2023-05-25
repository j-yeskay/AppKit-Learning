//
//  TableViewCell.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 24/05/23.
//

import Foundation
import AppKit

class TesterView : NSTableRowView{
    convenience init() {
        self.init(frame: NSRect())
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.wantsLayer = true

        //        self.layer?.backgroundColor = NSColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1).cgColor
        
        let emailId = NSTextField(labelWithString: "zac-noreply@zoho.com.au")
        emailId.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailId)

        
        
        NSLayoutConstraint.activate([
            emailId.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            emailId.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])

    }
    
}

public class TableCellView : NSTableCellView{
    convenience init() {
        self.init(frame: NSRect())
        self.translatesAutoresizingMaskIntoConstraints = false
        let testerView = TesterView()
        self.addSubview(testerView)

        
        NSLayoutConstraint.activate([
            testerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            testerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            testerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            testerView.heightAnchor.constraint(equalToConstant: 100),
        ])
        
    }
    
    public override func mouseExited(with event: NSEvent) {
        self.layer?.backgroundColor = nil
    }

    public override func mouseEntered(with event: NSEvent) {
        self.shadow = NSShadow()
        self.layer?.backgroundColor = NSColor.lightGray.withAlphaComponent(0.2).cgColor
    }
    
    
    public override func updateTrackingAreas() {
        super.updateTrackingAreas()
        self.addTrackingArea(NSTrackingArea.init(rect: self.bounds, options: [.activeAlways, .mouseEnteredAndExited], owner: self))
    }
}
