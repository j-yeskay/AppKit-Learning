//
//  NewController.swift
//  TextDemo
//
//  Created by sathish-pt6686 on 23/05/23.
//

import Foundation
import AppKit


public class NewController : NSViewController{
    
    public var stackView : NSStackView!
    public var scrollView : NSScrollView!
    public var clippingView : NSClipView!
    public var docView : NSView!
    
    public override func loadView() {
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: NSScreen.main!.frame.maxX, height: NSScreen.main!.frame.maxY))
        
        stackView = NSStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.wantsLayer = true
        stackView.layer?.backgroundColor = .black
        stackView.orientation = .vertical
//        stackView.alignment = .leading
        for i in 0...338{
            stackView.addArrangedSubview(TextField(labelWithString: "\(i)"))
        }

        scrollView = NSScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.hasVerticalScroller = true
        
        clippingView = NSClipView()
        clippingView.translatesAutoresizingMaskIntoConstraints = false
        
        docView = NSView()
        docView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.contentView = clippingView
        scrollView.documentView = stackView
        
//        docView.addSubview(stackView)
    }
    
    public override func viewDidLoad() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
//            clippingView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            clippingView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            clippingView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            clippingView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
//            docView.leadingAnchor.constraint(equalTo: clippingView.leadingAnchor),
//            docView.topAnchor.constraint(equalTo: clippingView.topAnchor),
//            docView.widthAnchor.constraint(equalTo: clippingView.widthAnchor),
//
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            stackView.bottomAnchor.constraint(greaterThanOrEqualTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
//            docView.heightAnchor.constraint(equalTo: stackView.heightAnchor),
        ])
    }
}
