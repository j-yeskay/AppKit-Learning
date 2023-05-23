//
//  MainView.swift
//  TextDemo
//
//  Created by sathish-pt6686 on 19/05/23.
//

import Foundation
import AppKit


public class MainView : NSView{
    convenience init() {
        self.init(frame: NSRect(x: 0, y: 0, width: NSScreen.main!.frame.maxX, height: NSScreen.main!.frame.maxY))
    }
}
