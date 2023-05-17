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
        
        let greenView = NSView()
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.wantsLayer = true
        greenView.layer?.backgroundColor = NSColor.green.cgColor
        
        let whiteView = NSView()
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.wantsLayer = true
        whiteView.layer?.backgroundColor = NSColor.white.cgColor
        
        let purpleView = NSView()
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        purpleView.wantsLayer = true
        purpleView.layer?.backgroundColor = NSColor.purple.cgColor
        
        
        

        docView.addSubview(redView)
        docView.addSubview(yellowView)
        docView.addSubview(blueView)
        docView.addSubview(greenView)
        docView.addSubview(purpleView)
        docView.addSubview(whiteView)
        
        
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            clipView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            clipView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            clipView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            clipView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            docView.leadingAnchor.constraint(equalTo: clipView.leadingAnchor),

            docView.topAnchor.constraint(equalTo: clipView.topAnchor),

//          FIRST COLUMN

            redView.leadingAnchor.constraint(equalTo: docView.leadingAnchor),
            redView.topAnchor.constraint(equalTo: docView.topAnchor),
            redView.heightAnchor.constraint(equalTo: view.heightAnchor),
            redView.widthAnchor.constraint(equalTo: view.widthAnchor),

            blueView.leadingAnchor.constraint(equalTo: docView.leadingAnchor),
            blueView.topAnchor.constraint(equalTo: redView.bottomAnchor),
            blueView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blueView.widthAnchor.constraint(equalTo: view.widthAnchor),

            yellowView.leadingAnchor.constraint(equalTo: docView.leadingAnchor),
            yellowView.topAnchor.constraint(equalTo: blueView.bottomAnchor),
            yellowView.heightAnchor.constraint(equalTo: view.heightAnchor),
            yellowView.widthAnchor.constraint(equalTo: view.widthAnchor),

            yellowView.bottomAnchor.constraint(equalTo: docView.bottomAnchor),

//          SECOND COLUMN

            greenView.leadingAnchor.constraint(equalTo: redView.trailingAnchor),
            greenView.topAnchor.constraint(equalTo: docView.topAnchor),
            greenView.heightAnchor.constraint(equalTo: view.heightAnchor),
            greenView.widthAnchor.constraint(equalTo: view.widthAnchor),
            greenView.trailingAnchor.constraint(equalTo: docView.trailingAnchor),

            purpleView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            purpleView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor),
            purpleView.heightAnchor.constraint(equalTo: view.heightAnchor),
            purpleView.widthAnchor.constraint(equalTo: view.widthAnchor),
            purpleView.trailingAnchor.constraint(equalTo: docView.trailingAnchor),

            whiteView.topAnchor.constraint(equalTo: purpleView.bottomAnchor),
            whiteView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor),
            whiteView.heightAnchor.constraint(equalTo: view.heightAnchor),
            whiteView.widthAnchor.constraint(equalTo: view.widthAnchor),
            whiteView.trailingAnchor.constraint(equalTo: docView.trailingAnchor),

            whiteView.bottomAnchor.constraint(equalTo: docView.bottomAnchor),

        ])

    }
}
