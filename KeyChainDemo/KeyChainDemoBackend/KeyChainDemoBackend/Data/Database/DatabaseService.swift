//
//  DatabaseService.swift
//  KeyChainDemoBackend
//
//  Created by sathish-pt6686 on 19/06/23.
//

import Foundation
import SQLite3


public class DatabaseService{
    public var db: OpaquePointer?
    public var databaseURL : URL
    
    public init(){
        self.databaseURL = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appending(path: "KeyChainDemo.sqlite")
        
        if !(FileManager.default.fileExists(atPath: self.databaseURL.path)){
            FileManager.default.createFile(atPath: self.databaseURL.path, contents: nil)
        }

    }
    
    public func openDbConnection(){
        if sqlite3_open(self.databaseURL.path, &self.db) != SQLITE_OK{
            print("ERROR OPENING DB \(String(describing: sqlite3_errmsg(self.db)))")
        }
    }
    
    public func createUserTable() {
        let query = "CREATE TABLE IF NOT EXISTS \"User\" (\"id\" INTEGER NOT NULL UNIQUE, \"email\" TEXT NOT NULL UNIQUE, PRIMARY KEY(\"id\",\"email\"))"
        
        if sqlite3_exec(self.db, query, nil, nil, nil) != SQLITE_OK{
            print("ERROR CREATING USER TABLE \(String(describing: sqlite3_errmsg(self.db)))")
        }
        else{
            print("User Table Created!")
        }
    }
}


extension DatabaseService : GetAllUsersDatabaseContract{
    public func getAllUsers(success: @escaping (([User]) -> Void), failure: @escaping ((String) -> Void)) {
        let query = "SELECT * FROM User"
        
        var selectStatement : OpaquePointer?
        
        if sqlite3_prepare_v2(self.db, query, -1, &selectStatement, nil) != SQLITE_OK{
            print("Error Preparing statement for \(query) \(String(describing: sqlite3_errmsg(self.db)))")
        }
        else{
            print("Prepared Statement for \(query)")
        }
        
        var users : [User] = []
        
        while sqlite3_step(selectStatement) != SQLITE_DONE{
            let user = User(id: Int(sqlite3_column_int(selectStatement, 0)), email: String(cString: sqlite3_column_text(selectStatement, 1)))
            users.append(user)
        }
        
        sqlite3_finalize(selectStatement)
        
        success(users)
    }
}


extension DatabaseService: CreateUserDatabaseContract{
    public func createUser(userData: [String : Any], success: @escaping ((User) -> Void), failure: @escaping ((String) -> Void)) {
        let id = userData["id"]! as! Int

        let email = userData["email"] as! String
        
        let user = User(id: id, email: email)
        
        let query = "INSERT INTO User Values(\(id), \(email))"
        
        if sqlite3_exec(self.db, query, nil, nil, nil) != SQLITE_OK{
            failure(String(cString: sqlite3_errmsg(self.db)))
        }
        else{
            success(user)
        }
    }
}


