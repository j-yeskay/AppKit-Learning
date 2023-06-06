//
//  EmailDataModel.swift
//  OutlineViewDemo
//
//  Created by sathish-pt6686 on 05/06/23.
//

import Foundation
import AppKit


public class Task : Codable{
    var id :  String?
    var taskGroupName : String
    
    var tasks : [TaskItem]
    
    public class TaskItem : Codable{
        var title : String
        var completed : Bool
    }
}

//
//public struct EmailItem : Codable{
//    var emailId : String
//    var subject : String
//    var body : String
//}
