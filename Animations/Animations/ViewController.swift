//
//  ViewController.swift
//  Animations
//
//  Created by sathish-pt6686 on 30/05/23.
//

import Foundation
import AppKit


public class ViewController : NSViewController{
    public var circle : CircleView!
    public override func loadView() {
        self.view = NSView(frame: NSScreen.main!.frame)
        circle = CircleView()
        circle.viewControllerRef = self
        circle.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    public override func viewDidLoad() {
        print("skadjbdas")
        view.addSubview(circle)
        
        NSLayoutConstraint.activate([
            circle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            circle.heightAnchor.constraint(equalToConstant: 600),
            circle.widthAnchor.constraint(equalToConstant: 600)
        ])

    }
    
//    public func addText(){
//        for i in circle.boundsAndColors{
////            let newView = NSTextView(frame: i.value)
//            let newView = NSTextField(labelWithString: "ding dong")
////            newView.string = "ding dong"
////            newView.drawsBackground = false
////            newView.isEditable = false
////            print(i.key)
//            newView.isSelectable = false
//            print(i.value)
//            print(i.value.origin.y)
//            newView.frame = NSRect(x: (i.value.origin.x + 200), y: i.value.origin.y, width: 10, height: 10)
//            newView.sizeToFit()
//            print("called")
//            self.view.addSubview(newView)
//        }
//    }
}
