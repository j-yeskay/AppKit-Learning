//
//  RefactoredTableView.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 25/05/23.
//

import Foundation
import AppKit


public class TableViewManager : NSObject, NSTableViewDelegate, NSTableViewDataSource{
    
    weak var emailDataController : EmailDataController?
    weak var refreshButton : RefreshButton?
    
    public class TableView : NSTableView{
        convenience init() {
            self.init(frame: NSRect())
            self.translatesAutoresizingMaskIntoConstraints = false
            let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "Column"))
            self.addTableColumn(column)
            self.headerView = nil
//            self.style = .fullWidth
//            self.intercellSpacing = .init(width: 17, height: 50)
            self.selectionHighlightStyle = .none
        }
        public override func reloadData() {
            super.reloadData()
        }
    }
    
    
    public class ScrollView : NSScrollView{
        convenience init() {
            self.init(frame: NSRect())
            self.translatesAutoresizingMaskIntoConstraints = false
            
            self.hasVerticalScroller = true
        }
    }
    
    public class EmailView : NSView{
        weak var emailDataController : EmailDataController?
        weak var tableViewManager : TableViewManager?
        
        var emailId : NSTextField = {
            let view = NSTextField(labelWithString: "")
            view.translatesAutoresizingMaskIntoConstraints = false
            view.lineBreakMode = .byTruncatingTail
            return view
        }()
        
        var emailObjectId : String = {
            return ""
        }()
        
        var profilePicture : ProfilePictureView = {
            let view = ProfilePictureView(image: NSImage(systemSymbolName: "a.circle.fill", accessibilityDescription: nil)!)
            return view
        }()
        
        var emailSubject : NSTextField = {
            let view = NSTextField(labelWithString: "")
            view.translatesAutoresizingMaskIntoConstraints = false
            view.lineBreakMode = .byTruncatingTail
            return view
        }()

        
        var emailBody : NSTextField = {
            let view = NSTextField(labelWithString: "")
            view.cell = NSTextFieldCell()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.usesSingleLineMode = false
            view.cell!.wraps = true
            view.maximumNumberOfLines = 2
            view.cell!.truncatesLastVisibleLine = true
            return view
        }()

        
        var deleteButton : DeleteButton = {
            let view = DeleteButton()
            
            return view
        }()
        
        @objc public func deleteEmail(){
            self.emailDataController?.delete(emailObjectId : emailObjectId)
            
            for i in 0...(self.tableViewManager?.emailsFromNetworkCall.count)!{
                if self.tableViewManager?.emailsFromNetworkCall[i].id == self.emailObjectId{
                    self.tableViewManager?.emailsFromNetworkCall.remove(at: i)
                    break
                }
            }
            self.tableViewManager?.tableView.reloadData()

        }
        
        convenience init() {
            self.init(frame: NSRect())
            self.translatesAutoresizingMaskIntoConstraints = false
            self.wantsLayer = true
            
            self.addSubview(emailId)
            self.addSubview(profilePicture)
            self.addSubview(emailSubject)
            self.addSubview(emailBody)
            self.addSubview(deleteButton)
            self.deleteButton.target = self
            self.deleteButton.action = #selector(deleteEmail)
            
            NSLayoutConstraint.activate([
                profilePicture.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                profilePicture.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                profilePicture.heightAnchor.constraint(equalToConstant: 32),
                profilePicture.widthAnchor.constraint(equalToConstant: 37),
                
                emailId.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 10),
                emailId.topAnchor.constraint(equalTo: profilePicture.topAnchor, constant: -3),
                emailId.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                
                emailSubject.leadingAnchor.constraint(equalTo: emailId.leadingAnchor),
                emailSubject.topAnchor.constraint(equalTo: emailId.bottomAnchor, constant: 2),
                emailSubject.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                
                emailBody.leadingAnchor.constraint(equalTo: profilePicture.leadingAnchor),
                emailBody.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 5),
                emailBody.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                
                deleteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                deleteButton.topAnchor.constraint(equalTo: emailId.topAnchor, constant: 3),

            ])
        }

    }
    
    public class TableCellView : NSTableCellView{
        
        var emailView : EmailView = {
            let view = EmailView()
            
            return EmailView()
        }()
        
        convenience init() {
            self.init(frame: NSRect())
            self.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(self.emailView)
            self.wantsLayer = true
            self.layer?.cornerRadius = 15
            
            NSLayoutConstraint.activate([
                self.emailView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                self.emailView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
                self.emailView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
                self.emailView.heightAnchor.constraint(equalToConstant: 100),
        
            ])
            
        }
        
        public override func prepareForReuse() {
            self.layer?.backgroundColor = nil
            self.emailView.deleteButton.isHidden = true
        }
        
        public override func mouseExited(with event: NSEvent) {
            self.layer?.backgroundColor = nil
            self.emailView.deleteButton.isHidden = true

        }

        public override func mouseEntered(with event: NSEvent) {
            self.layer?.backgroundColor = NSColor.lightGray.withAlphaComponent(0.2).cgColor
            self.emailView.deleteButton.isHidden = false
        }

        public override func updateTrackingAreas() {
            super.updateTrackingAreas()
            self.addTrackingArea(NSTrackingArea.init(rect: self.bounds, options: [.activeAlways, .mouseEnteredAndExited], owner: self))
        }
        
    }
    
    var tableView : TableView = {
        return TableView()
    }()
    
    var scrollView : ScrollView = {
        let view = ScrollView()
        return view
    }()
    
    public func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 100
    }
    
    
    public var emailsFromNetworkCall : [Email] = []

    
    public func numberOfRows(in tableView: NSTableView) -> Int {
        return emailsFromNetworkCall.count
    }
    
    public func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let identifier = NSUserInterfaceItemIdentifier(rawValue: "cellview")
        var view = tableView.makeView(withIdentifier: identifier, owner: self) as? TableCellView
        if view == nil{
            view = TableCellView()
            view?.identifier = identifier
        }
//        setting data from the network to the view
        
        view?.emailView.emailObjectId = emailsFromNetworkCall[row].id!
        
        view?.emailView.emailId.stringValue = emailsFromNetworkCall[row].emailId
        
        view?.emailView.profilePicture.originalImage = NSImage(systemSymbolName: "\(view!.emailView.emailId.stringValue.first!).circle.fill", accessibilityDescription: nil)
        view?.emailView.profilePicture.image = view?.emailView.profilePicture.originalImage
        
        view?.emailView.emailSubject.stringValue = emailsFromNetworkCall[row].subject
        
        view?.emailView.emailBody.stringValue = emailsFromNetworkCall[row].body
        
        view?.emailView.emailDataController = self.emailDataController
        view?.emailView.tableViewManager = self
        return view

    }
    
    public func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {

        let view = TableRowView()

        return view
    }
    
    public class TableRowView : NSTableRowView{
        
        convenience init() {
            self.init(frame: NSRect())
            self.translatesAutoresizingMaskIntoConstraints = false
            self.wantsLayer = true
            self.layer?.cornerRadius = 15
        }
   }

}
