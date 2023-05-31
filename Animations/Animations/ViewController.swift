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
}
