//
//  DataModel.swift
//  TableView2
//
//  Created by sathish-pt6686 on 31/05/23.
//

import Foundation
import AppKit


public class Data{

    var name : String
    var amount : Double
    
    init(_ name: String, _ amount: Double) {
        self.name = name
        self.amount = amount
    }
    
    public static func getData() -> [Data]{
        return [Data("User 1", 100.0), Data("User 2", 125.0), Data("User 3", 35.6), Data("User 4", 43.2), Data("User 5", 10.45)]
    }
}
