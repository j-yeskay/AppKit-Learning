//
//  ScrollView.swift
//  TableViewDemo
//
//  Created by sathish-pt6686 on 24/05/23.
//

import Foundation
import AppKit


public class ScrollView : NSScrollView{
    convenience init() {
        self.init(frame: NSRect())
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.hasVerticalScroller = true
    }
}
