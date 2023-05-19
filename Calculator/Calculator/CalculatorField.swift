//
//  CalculatorField.swift
//  Calculator
//
//  Created by sathish-pt6686 on 18/05/23.
//

import Foundation
import AppKit

let validCalculatorItems = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", ".", "=", "+", "-", "/", "x", "DEL"]


public class CalculatorField : NSTextField{
    convenience init() {
        self.init(frame: NSRect())
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = NSFont.systemFont(ofSize: 65)
        self.alignment = .right
        self.isSelectable = false
        self.createObservers()
    }
}

extension CalculatorField{
    func createObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(receiveButtonClick), name: buttonNotification, object: nil)
        
    }
    
    @objc func receiveButtonClick(notification: Notification){
        let buttonData = (notification.object! as! String)
        
        
        guard validCalculatorItems.contains(buttonData) else{
            return
        }
        
        if buttonData == "DEL"{
            if !self.stringValue.isEmpty{
                self.stringValue.removeLast()
            }
            return
        }
        
        
        if (buttonData == "/" || buttonData == "x" || buttonData == "="){
            if (!self.stringValue.isEmpty){
                let last = self.stringValue.last!
                if let _ = Int(String(last)){
                    self.stringValue.append(buttonData)
                }
            }
        }
        else if buttonData == "+" || buttonData == "-" || buttonData == "."{
            if (!self.stringValue.isEmpty){
                let last = self.stringValue.last!
                    if let _ = Int(String(last)){
                        self.stringValue.append(buttonData)
                    }
            }
            else{
                self.stringValue.append(buttonData)
            }
        }
        else{
            self.stringValue.append(buttonData)
        }
        
    }
    
}
