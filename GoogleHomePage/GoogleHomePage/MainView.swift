//
//  MainView.swift
//  GoogleHomePage
//
//  Created by sathish-pt6686 on 12/05/23.
//

import Foundation
import AppKit


public class MainView : NSView{
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
//        self.layer?.backgroundColor = NSColor.white.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

