//
//  EmailDBController.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 08/06/23.
//

import Foundation
import AppKit
import SQLite3


public class EmailDBController{
    weak var tableViewManager : TableViewManager?
    
    private init(){
        
    }
    
    static var emailDBControllerInstance : EmailDBController?
    
    static func getEmailDBControllerInstance() -> EmailDBController{
        if emailDBControllerInstance == nil{
            emailDBControllerInstance = EmailDBController()
        }
        return emailDBControllerInstance!
    }
    
    var emails : [Email] = []
    
    func prepareDB() -> OpaquePointer?{
        let fileManager = FileManager()

        let databaseURL = try! fileManager.url(for: .applicationSupportDirectory, in: .allDomainsMask, appropriateFor: nil, create: false).appendingPathComponent("email.sqlite")
        
        print(databaseURL.path)
        
        var db : OpaquePointer?
        
        if !(fileManager.fileExists(atPath: databaseURL.path)){
            fileManager.createFile(atPath: databaseURL.path, contents: nil)
        }

        if sqlite3_open(databaseURL.path, &db) == SQLITE_OK{
            print("opened successfully")
        }
        else{
            print(String(cString: sqlite3_errmsg(db!)))
            print("opening failed")
        }
        
        let createQuery = "CREATE TABLE IF NOT EXISTS \"Email\" (\"id\" TEXT NOT NULL UNIQUE, \"emailId\" TEXT NOT NULL,\"subject\" TEXT NOT NULL, \"body\" TEXT NOT NULL,PRIMARY KEY(\"id\"))"
        
        sqlite3_exec(db, createQuery, nil, nil, nil)
        
        return db
    }
    
    func loadEmailsFromDB(){
        
        let db = prepareDB()
        
        var selectStatement : OpaquePointer?
        
        let selectQuery = "select * from Email"
        
        if sqlite3_prepare_v2(db, selectQuery, -1, &selectStatement, nil) != SQLITE_OK{
            print("compilation failed for select")
        }
        while sqlite3_step(selectStatement) != SQLITE_DONE{
            let email = Email(id: String(cString: sqlite3_column_text(selectStatement, 0)), emailId: String(cString: sqlite3_column_text(selectStatement, 1)), subject: String(cString: sqlite3_column_text(selectStatement, 2)), body: String(cString: sqlite3_column_text(selectStatement, 3)))
            self.emails.append(email)

        }
        sqlite3_finalize(selectStatement)
        tableViewManager?.emailsFromNetworkCall = self.emails
        sqlite3_close(db)
    }
    
    func updateDBFromNetwork(){
        let db = prepareDB()
        
        sqlite3_exec(db, "delete * from Email", nil, nil, nil)
        
        let insertQuery = "insert into Email values(?, ?, ?, ?)"
        
        var insertStatement : OpaquePointer?
        
        sqlite3_prepare_v2(db, insertQuery, -1, &insertStatement, nil)
        
        for email in self.emails{
            sqlite3_bind_text(insertStatement, 1, (email.id! as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (email.emailId as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (email.subject as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (email.body as NSString).utf8String, -1, nil)
            
            sqlite3_step(insertStatement)
            
            sqlite3_reset(insertStatement)
        }
        
        sqlite3_finalize(insertStatement)
        
        sqlite3_close(db)
        
    }
    
}
