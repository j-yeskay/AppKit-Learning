//
//  ViewController.swift
//  Animations
//
//  Created by sathish-pt6686 on 30/05/23.
//

import Foundation
import AppKit


public class ViewController : NSViewController{
    
    public var datePicker : DatePicker!
    public var collectionViewManager : CollectionViewManager!

    public override func loadView() {
        self.view = NSView(frame: NSScreen.main!.frame)
        
        datePicker = DatePicker(frame: NSRect(x: 100, y: 500, width: 150, height: 150))
        datePicker.datePickerStyle = .clockAndCalendar
        datePicker.wantsLayer = true
        datePicker.backgroundColor = .clear
        datePicker.datePickerElements = [.era, .timeZone,  .yearMonthDay]
        datePicker.calendar = Calendar(identifier: .iso8601)
        datePicker.dateValue = .now
        datePicker.backgroundColor = .controlAccentColor
        datePicker.sizeToFit()
        
        collectionViewManager = collectionViewManager()
        
    }
    
    public override func viewDidLoad() {

//        self.view.addSubview(datePicker)

    }
    

}
