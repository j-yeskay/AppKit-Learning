//
//  FormView.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 26/05/23.
//

import Foundation
import AppKit

public let subjectTextDidChangeNotificationKey = "com.subjectTextDidChange"
public let subjectTextDidChangeNotification = Notification.Name(subjectTextDidChangeNotificationKey)


public class FormView : NSView{
    
    weak var tableViewManager : TableViewManager?
    
    weak var emailDataController : EmailDataController?
    
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
    
    var emailIdInputField : NSTextField = {
        let view = NSTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = NSFont.systemFont(ofSize: 16)

        return view
    }()
    
    public class EmailSubjectBodyInputField : NSTextField{
        convenience init() {
            self.init(frame: NSRect())
            self.translatesAutoresizingMaskIntoConstraints = false
            self.font = NSFont.systemFont(ofSize: 16)
        }
        
    }
    
    var emailSubjectInputField : EmailSubjectBodyInputField = {
       let view = EmailSubjectBodyInputField()
       return view
    }()
    
    var emailBodyInputField : EmailSubjectBodyInputField = {
        let view = EmailSubjectBodyInputField()
        return view
    }()
    
    
    @objc public func sendButtonClicked(){
        let emailId = emailIdInputField.stringValue
        let emailSubject = emailSubjectInputField.stringValue
        let emailBody = emailBodyInputField.stringValue
        
        if !(emailId.isEmpty) && !(emailSubject.isEmpty) && !(emailBody.isEmpty){
            let dict : [String : String] = ["emailId" : emailId, "subject" : emailSubject, "body": emailBody]
            
            self.emailDataController?.post(emailData: dict)
            let postResponseEmail = self.emailDataController?.postResponse!
            self.tableViewManager?.tableView.insertRows(at: IndexSet(integer: 0), withAnimation: .slideRight)
            self.tableViewManager?.emailsFromNetworkCall.insert(Email(id: postResponseEmail!.id, emailId: postResponseEmail!.emailId, subject: postResponseEmail!.subject, body: postResponseEmail!.body), at: 0)
//
//            self.tableViewManager?.tableView.reloadData()
        }
        else{
            print("empty")
        }
    }
    
    var sendButton : NSButton = {
        let view = NSButton()
        view.title = "Send"
        view.bezelStyle = .regularSquare
        view.translatesAutoresizingMaskIntoConstraints = false
        view.action = #selector(sendButtonClicked)
        return view
    }()
    
    convenience init() {
        self.init(frame: NSRect())
        self.translatesAutoresizingMaskIntoConstraints = false
        self.wantsLayer = true
        self.layer?.borderWidth = CGFloat(1)
        self.layer?.borderColor = NSColor.white.cgColor
        self.sendButton.target = self
        
        self.addSubview(emailIdLabel)
        self.addSubview(emailIdInputField)
        self.addSubview(emailSubjectLabel)
        self.addSubview(emailSubjectInputField)
        self.addSubview(sendButton)
        self.addSubview(emailBodyLabel)
        self.addSubview(emailBodyInputField)
        
        NSLayoutConstraint.activate([
            emailIdLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            emailIdLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            emailIdInputField.leadingAnchor.constraint(equalTo: emailSubjectLabel.trailingAnchor, constant: 20),
            emailIdInputField.topAnchor.constraint(equalTo: emailIdLabel.topAnchor),
            emailIdInputField.heightAnchor.constraint(equalTo: emailIdLabel.heightAnchor, constant: 5),
            emailIdInputField.widthAnchor.constraint(equalToConstant: 300),
            
            emailSubjectLabel.leadingAnchor.constraint(equalTo: emailIdLabel.leadingAnchor),
            emailSubjectLabel.topAnchor.constraint(equalTo: emailIdLabel.bottomAnchor, constant: 50),
            
            emailBodyLabel.leadingAnchor.constraint(equalTo: emailSubjectLabel.leadingAnchor),
            emailBodyLabel.topAnchor.constraint(equalTo: emailSubjectInputField.bottomAnchor, constant: 50),
            
            emailSubjectInputField.leadingAnchor.constraint(equalTo: emailIdInputField.leadingAnchor),
            emailSubjectInputField.topAnchor.constraint(equalTo: emailSubjectLabel.topAnchor),
            emailSubjectInputField.heightAnchor.constraint(equalTo: emailIdInputField.heightAnchor, constant: 45),
            emailSubjectInputField.widthAnchor.constraint(equalTo: emailIdInputField.widthAnchor, constant: 40),
            
            emailBodyInputField.leadingAnchor.constraint(equalTo: emailSubjectInputField.leadingAnchor),
            emailBodyInputField.topAnchor.constraint(equalTo: emailBodyLabel.topAnchor),
            emailBodyInputField.heightAnchor.constraint(equalToConstant: 175),
            emailBodyInputField.widthAnchor.constraint(equalTo: emailSubjectInputField.widthAnchor),

            sendButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            sendButton.heightAnchor.constraint(equalToConstant: 40),
            sendButton.widthAnchor.constraint(equalToConstant: 60),
            sendButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100)
        ])
    }
    

}
