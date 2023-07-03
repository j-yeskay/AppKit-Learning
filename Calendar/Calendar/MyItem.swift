//
//  MyItem.swift
//  Calendar
//
//  Created by sathish-pt6686 on 02/07/23.
//

import Foundation
import AppKit


public class MyItem: NSCollectionViewItem{
    public var dayNumber: Int?
    public override func loadView() {
      self.view = NSView()
      self.view.wantsLayer = true

    }
}
