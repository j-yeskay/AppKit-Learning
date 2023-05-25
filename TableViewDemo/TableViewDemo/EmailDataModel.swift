//
//  EmailDataModel.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 25/05/23.
//

import Foundation
import AppKit


struct Email : Codable{
    var id : Int?
    var emailId : String
    var subject : String
    var body : String
}
