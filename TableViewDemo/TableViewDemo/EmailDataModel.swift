//
//  EmailDataModel.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 25/05/23.
//

import Foundation
import AppKit


public struct Email : Codable{
    var id : String?
    var emailId : String
    var subject : String
    var body : String
}
