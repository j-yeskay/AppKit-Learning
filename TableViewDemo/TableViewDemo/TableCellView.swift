//
//  TableViewCell.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 24/05/23.
//

import Foundation
import AppKit

class EmailView : NSView{
    var emailId : NSTextField = NSTextField(labelWithString: "")
    convenience init() {
        self.init(frame: NSRect())
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.wantsLayer = true

//        let emailId = NSTextField(labelWithString: "zac-noreply@zoho.com.au")
        self.emailId.translatesAutoresizingMaskIntoConstraints = false
        self.emailId.lineBreakMode = .byTruncatingTail
        
        let profilePicture = ProfilePictureView(image: NSImage(systemSymbolName: "a.circle.fill", accessibilityDescription: nil)!)
        
        let archiveIcon = NSImageView(image: NSImage(systemSymbolName: "archivebox", accessibilityDescription: nil)!)
        archiveIcon.translatesAutoresizingMaskIntoConstraints = false
        archiveIcon.imageScaling = .scaleAxesIndependently
        
        self.addSubview(emailId)
        self.addSubview(profilePicture)
        
        NSLayoutConstraint.activate([
            profilePicture.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            profilePicture.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            profilePicture.heightAnchor.constraint(equalToConstant: 30),
            profilePicture.widthAnchor.constraint(equalToConstant: 35),
            
            emailId.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 10),
            emailId.topAnchor.constraint(equalTo: profilePicture.topAnchor, constant: -3),
            emailId.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
    }

}

    public class TableCellView : NSTableCellView{
        var emailView : EmailView = EmailView()
        convenience init() {
            self.init(frame: NSRect())
            self.translatesAutoresizingMaskIntoConstraints = false
//            let emailView = EmailView()
            
            self.addSubview(self.emailView)
            
            self.wantsLayer = true
            self.layer?.cornerRadius = 15
            
            NSLayoutConstraint.activate([
                emailView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                emailView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
                emailView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
                emailView.heightAnchor.constraint(equalToConstant: 100),
                
            ])
            
        }
        
        
        public override func mouseExited(with event: NSEvent) {
            self.layer?.backgroundColor = nil
        }
        
        public override func mouseEntered(with event: NSEvent) {
            self.layer?.backgroundColor = NSColor.lightGray.withAlphaComponent(0.2).cgColor
        }
        
        public override func updateTrackingAreas() {
            super.updateTrackingAreas()
            self.addTrackingArea(NSTrackingArea.init(rect: self.bounds, options: [.activeAlways, .mouseEnteredAndExited], owner: self))
        }

    }
