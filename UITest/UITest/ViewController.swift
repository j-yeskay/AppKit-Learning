//
//  ViewController.swift
//  UITest
//
//  Created by sathish-pt6686 on 04/05/23.
//

import Foundation
import AppKit



var blackColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
var whiteColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)


class MainViewController : NSViewController{

    override func loadView() {
        
        let maxX = NSScreen.main!.frame.maxX
        
        let maxY = NSScreen.main!.frame.maxY
        
        class MyView : NSView{
            
            weak var stackView : NSStackView?
            
            func activateLightMode(){
                self.layer?.backgroundColor = whiteColor
            }
            
            func activateDarkMode(){
                self.layer?.backgroundColor = blackColor
            }
            
            override init(frame frameRect: NSRect) {
                super.init(frame: frameRect)
                self.wantsLayer = true
                
                if getSystemTheme() == "Light"{
                    self.activateLightMode()
                }
                else{
                    self.activateDarkMode()
                }
            }
            
                
            override func draw(_ dirtyRect: NSRect) {
                if self.frame.width <= NSScreen.main!.frame.maxX / 2{
                    self.stackView?.orientation = .vertical
                    self.stackView?.distribution = .fillEqually
                }
                else{
                    self.layer?.backgroundColor = NSColor.black.cgColor
                    self.stackView?.orientation = .horizontal
                    self.stackView?.distribution = .fillProportionally
                }
            }
            
            
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
            
        }
        
        view = MyView(frame: NSRect(x: 0, y: 0, width: maxX, height:  maxY))
        
        class MyButton : NSButton{
            
            var currentMode : String?
            weak var parentView : MyView?
            
            func activateLightMode(){
                self.layer?.backgroundColor = blackColor
                let buttonTextAttributes : [NSAttributedString.Key : Any] = [.foregroundColor : NSColor.white]
                self.attributedTitle = NSAttributedString(string: "Go Dark!", attributes: buttonTextAttributes)
                self.currentMode = "Light"
            }
            
            func activateDarkMode(){
                self.layer?.backgroundColor = whiteColor
                let buttonTextAttributes : [NSAttributedString.Key : Any] = [.foregroundColor : NSColor.black]
                self.attributedTitle = NSAttributedString(string: "Go Light!", attributes: buttonTextAttributes)
                self.currentMode = "Dark"
            }
            
            override init(frame frameRect: NSRect) {
                super.init(frame: frameRect)
                self.wantsLayer = true
                self.bezelStyle = .texturedSquare
                self.setButtonType(.momentaryChange)
                self.target = self
                self.action = #selector(self.onclick)
                
    
                if getSystemTheme() == "Light"{
                    activateLightMode()
                }
                else{
                    activateDarkMode()
                }
            }
            
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
            
            @objc
            func onclick(){
                if currentMode == "Light"{
                    activateDarkMode()
                    self.parentView?.activateDarkMode()
                }
                else{
                    activateLightMode()
                    self.parentView?.activateLightMode()
                }
            }
            
        }
    
        let myButton = MyButton(frame: NSRect(x: 700, y: 400, width: 100, height: 100))
        myButton.parentView = (view as! MyView)
        
        func getSystemTheme() -> String{
            let systemTheme = UserDefaults.standard.string(forKey: "AppleInterfaceStyle") ?? "Light"
            return systemTheme
        }
        
//        var text = NSTextField(string: "hello world")
        
        let text = NSTextView(frame: NSRect(x: 500, y: 600, width: 100, height: 10))
        
        text.isEditable = false
        
        text.isSelectable = false
    
        text.string = "hello world"
        
        text.textColor = NSColor.white
        
        text.backgroundColor = NSColor.black
        
        let text1 = NSTextView(frame: NSRect(x: 578, y: 600, width: 100, height: 10))
        
        text1.isEditable = false
        
        text1.isSelectable = false
    
        text1.string = "hello world"
        
        text1.textColor = NSColor.black
        
        text1.backgroundColor = NSColor.white
        
        let stringAttributes : [NSAttributedString.Key : Any] = [.underlineStyle : NSUnderlineStyle.double.rawValue, .underlineColor : NSColor.white, .strikethroughStyle : NSUnderlineStyle.single.rawValue]
        
        let string = NSAttributedString(string: "hello world", attributes: stringAttributes)
        
        let text2 = NSTextField(labelWithAttributedString: string)
        
//        text2.backgroundColor = NSColor.blue
        
        text2.drawsBackground = true
        
        text2.frame.origin.x = 50
        text2.frame.origin.y = 50
//        view.layer?.backgroundColor = NSColor.white.cgColor
        
//        text2.isEditable = false
//        text2.isSelectable = false
//        text2.backgroundColor = NSColor.blue
//        text2.drawsBackground = true
        

  
//        view.addSubview(myButton)
        
//        view.addSubview(text)
//
//        view.addSubview(text1)
        
//        view.addSubview(text2)
        
        let leftView = NSView()
        let rightView = NSView()
        let midView = NSView()

        leftView.wantsLayer = true
        rightView.wantsLayer = true
        midView.wantsLayer = true
    
        leftView.layer?.backgroundColor = CGColor(red: 0, green: 1, blue: 1, alpha: 1)
        rightView.layer?.backgroundColor = CGColor(red: 1, green: 1, blue: 0, alpha: 1)
        midView.layer?.backgroundColor = CGColor(red: 1, green: 0, blue: 1, alpha: 1)
        
        rightView.translatesAutoresizingMaskIntoConstraints = false
        leftView.translatesAutoresizingMaskIntoConstraints = false
        midView.translatesAutoresizingMaskIntoConstraints = false
                
//        view.addSubview(leftView)
//        view.addSubview(rightView)
//        view.addSubview(midView)

        let stackView = NSStackView(views: [leftView, midView, rightView])
        
        (view as! MyView).stackView = stackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.orientation = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = .zero
        
        
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            leftView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            rightView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            midView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),

//            leftView.heightAnchor.constraint(equalToConstant: 100),
//            midView.heightAnchor.constraint(equalToConstant: 100),
//            rightView.heightAnchor.constraint(equalToConstant: 100),

//            leftView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.333333333333333),
//            midView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.333333333333333),
//            rightView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.333333333333333),

//            leftView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            leftView.rightAnchor.constraint(equalTo: midView.leftAnchor),

//            midView.leftAnchor.constraint(equalTo: leftView.rightAnchor),
//            rightView.leftAnchor.constraint(equalTo: midView.rightAnchor),

//            midView.rightAnchor.constraint(equalTo: rightView.leftAnchor),
//            rightView.rightAnchor.constraint(equalTo: view.rightAnchor),

        ])
    
}

}


