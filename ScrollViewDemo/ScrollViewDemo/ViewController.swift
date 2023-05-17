//
//  ViewController.swift
//  ScrollViewDemo
//
//  Created by sathish-pt6686 on 17/05/23.
//

import Foundation
import AppKit


public class ViewController : NSViewController{
    
    public override func loadView() {
                
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: NSScreen.main!.frame.maxX, height: NSScreen.main!.frame.maxY))

        let scrollView = NSScrollView()
        scrollView.borderType = .noBorder
        scrollView.verticalScrollElasticity = .none
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.wantsLayer = true
        scrollView.hasVerticalScroller = true
        scrollView.hasVerticalRuler = true
        scrollView.hasHorizontalScroller = true
        scrollView.hasHorizontalRuler = true
        
        let clipView = NSClipView()
        clipView.translatesAutoresizingMaskIntoConstraints = false
        clipView.wantsLayer = true

        scrollView.contentView = clipView
        
        
        let docView = NSView()
        docView.wantsLayer = true
        docView.layer?.backgroundColor = .white
        docView.translatesAutoresizingMaskIntoConstraints = false
    
        scrollView.documentView = docView
        
        self.view.addSubview(scrollView)
        
        
        let redView = NSView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.wantsLayer = true
        redView.layer?.backgroundColor = NSColor.red.cgColor
        
        let blueView = NSView()
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.wantsLayer = true
        blueView.layer?.backgroundColor = NSColor.blue.cgColor
        
        let yellowView = NSView()
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.wantsLayer = true
        yellowView.layer?.backgroundColor = NSColor.yellow.cgColor
        

        docView.addSubview(redView)
        docView.addSubview(yellowView)
        docView.addSubview(blueView)

        
//        NSLayoutConstraint.activate([
//            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//
//
//            clipView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            clipView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            clipView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            clipView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//
//            docView.leadingAnchor.constraint(equalTo: clipView.leadingAnchor),
//            docView.topAnchor.constraint(equalTo: clipView.topAnchor),
//            docView.trailingAnchor.constraint(equalTo: clipView.trailingAnchor),
//
//            redView.leadingAnchor.constraint(equalTo: docView.leadingAnchor),
//            redView.trailingAnchor.constraint(equalTo: docView.trailingAnchor),
//            redView.topAnchor.constraint(equalTo: docView.topAnchor),
//            redView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
//
//
//            blueView.leadingAnchor.constraint(equalTo: docView.leadingAnchor),
//            blueView.trailingAnchor.constraint(equalTo: docView.trailingAnchor),
//            blueView.topAnchor.constraint(equalTo: redView.bottomAnchor),
//            blueView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
//
//            yellowView.leadingAnchor.constraint(equalTo: docView.leadingAnchor),
//            yellowView.trailingAnchor.constraint(equalTo: docView.trailingAnchor),
//            yellowView.topAnchor.constraint(equalTo: blueView.bottomAnchor),
//            yellowView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
//
//
//            yellowView.bottomAnchor.constraint(equalTo: docView.bottomAnchor),
//
//
//        ])
//
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

            clipView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            clipView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            clipView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            clipView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            docView.leadingAnchor.constraint(equalTo: clipView.leadingAnchor),
            docView.topAnchor.constraint(equalTo: clipView.topAnchor),

            redView.leadingAnchor.constraint(equalTo: docView.leadingAnchor),
            redView.topAnchor.constraint(equalTo: docView.topAnchor),
            redView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            redView.bottomAnchor.constraint(equalTo: docView.bottomAnchor),
            redView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),


            blueView.leadingAnchor.constraint(equalTo: redView.trailingAnchor),
            blueView.topAnchor.constraint(equalTo: docView.topAnchor),
            blueView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            blueView.bottomAnchor.constraint(equalTo: docView.bottomAnchor),
            blueView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),


            yellowView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor),
            yellowView.topAnchor.constraint(equalTo: docView.topAnchor),
            yellowView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            yellowView.bottomAnchor.constraint(equalTo: docView.bottomAnchor),
            yellowView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            yellowView.trailingAnchor.constraint(equalTo: docView.trailingAnchor)


        ])
    }
}
