//
//  EmailDetailView.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 30/05/23.
//

import Foundation
import AppKit


public class EmailDetailView : NSView{
    weak var tableViewManager : TableViewManager?
    
    private static var emailDetailViewInstance : EmailDetailView?
    
    private init(){
        super.init(frame: NSRect())
        self.translatesAutoresizingMaskIntoConstraints = false
        self.wantsLayer = true
        self.isHidden = true
        self.layer?.borderWidth = 1
        self.layer?.borderColor = .white
        self.addSubview(closeButton)
        self.addSubview(emailIdLabel)
        self.addSubview(emailSubjectLabel)
        self.addSubview(emailBodyLabel)
        self.addSubview(emailId)
        self.addSubview(emailSubjectScrollView)
        self.addSubview(emailBodyScrollView)

        
        self.closeButton.target = self
        self.closeButton.action = #selector(closeButtonClicked)
        
        NSLayoutConstraint.activate([
            self.emailIdLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.emailIdLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            
            self.emailSubjectLabel.leadingAnchor.constraint(equalTo: self.emailIdLabel.leadingAnchor),
            self.emailSubjectLabel.topAnchor.constraint(equalTo: self.emailIdLabel.bottomAnchor, constant: 50),
            
            self.emailBodyLabel.leadingAnchor.constraint(equalTo: self.emailSubjectLabel.leadingAnchor),
            self.emailBodyLabel.topAnchor.constraint(equalTo: self.emailSubjectLabel.bottomAnchor, constant: 70),
            
            
            self.closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            
            self.emailId.leadingAnchor.constraint(equalTo: self.emailIdLabel.trailingAnchor, constant: 50),
            self.emailId.bottomAnchor.constraint(equalTo: self.emailIdLabel.bottomAnchor),
            self.emailId.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.emailId.topAnchor.constraint(equalTo: self.emailIdLabel.topAnchor),
            
            self.emailSubjectScrollView.leadingAnchor.constraint(equalTo: self.emailId.leadingAnchor),
            self.emailSubjectScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            self.emailSubjectScrollView.topAnchor.constraint(equalTo: self.emailSubjectLabel.topAnchor),
            self.emailSubjectScrollView.bottomAnchor.constraint(equalTo: self.emailBodyLabel.topAnchor, constant: -25),
            
            self.emailBodyScrollView.leadingAnchor.constraint(equalTo: self.emailId.leadingAnchor),
            self.emailBodyScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            self.emailBodyScrollView.topAnchor.constraint(equalTo: self.emailBodyLabel.topAnchor),
            self.emailBodyScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25),
        ])
    }
    
    private override init(frame frameRect: NSRect) {
        super.init(frame: NSRect())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public static func getEmailDetailViewInstance() -> EmailDetailView{
        if emailDetailViewInstance == nil{
            emailDetailViewInstance = EmailDetailView()
            return emailDetailViewInstance!
        }
        else{
            return emailDetailViewInstance!
        }
    }
    
    @objc public func closeButtonClicked(){
        self.isHidden = true
        self.tableViewManager?.lastlySelectedCellView?.layer?.backgroundColor = nil
    }
    
    let closeButton : NSButton = {
        let button = NSButton()
        button.image = NSImage(systemSymbolName: "xmark", accessibilityDescription: nil)
        button.imageScaling = .scaleAxesIndependently
        button.translatesAutoresizingMaskIntoConstraints = false
        button.wantsLayer = true
        button.layer?.backgroundColor = .clear
        button.isBordered = false
        return button
    }()
    
    
    var emailIdLabel : NSTextField = {
        let view = NSTextField(labelWithString: "Email ID ")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = NSFont.systemFont(ofSize: 18)
        return view
    }()
    
    var emailSubjectLabel : NSTextField = {
        let view = NSTextField(labelWithString: "Email Subject ")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = NSFont.systemFont(ofSize: 18)
        return view
    }()
    
    var emailBodyLabel : NSTextField = {
        let view = NSTextField(labelWithString: "Email Body ")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = NSFont.systemFont(ofSize: 18)
        return view
    }()
    
    var emailId : NSTextView = {
        let view = NSTextView()
        view.font = NSFont.systemFont(ofSize: 16)
        view.drawsBackground = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isEditable = false
        return view
    }()
    
    var emailSubjectScrollView : NSScrollView = {
        let scrollView = NSTextView.scrollableTextView()

        (scrollView.documentView as! NSTextView).font = NSFont.systemFont(ofSize: 16)
        (scrollView.documentView as! NSTextView).drawsBackground = false
        (scrollView.documentView as! NSTextView).isEditable = false

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.drawsBackground = false
        
        return scrollView
    }()
    
    var emailBodyScrollView : NSScrollView = {
        let scrollView = NSTextView.scrollableTextView()

        (scrollView.documentView as! NSTextView).font = NSFont.systemFont(ofSize: 16)
        (scrollView.documentView as! NSTextView).drawsBackground = false
        (scrollView.documentView as! NSTextView).isEditable = false

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.drawsBackground = false
        
        return scrollView
    }()

}
