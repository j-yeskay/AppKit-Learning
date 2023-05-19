//
//  CalculatorButton.swift
//  Calculator
//
//  Created by sathish-pt6686 on 18/05/23.
//

import Foundation
import AppKit

public let buttonNotificationKey = "com.calculatorButtonClick"
public let buttonNotification = Notification.Name(buttonNotificationKey)


public func getAttributedText(text : String) -> NSAttributedString{
    let attributes : [NSAttributedString.Key: Any] = [.font : NSFont.systemFont(ofSize: 36)]
    
    return NSAttributedString(string: text, attributes: attributes)
}


public class CalculatorButton : NSButton{
    convenience init(text : String) {
        self.init(frame: NSRect())
        self.attributedTitle = getAttributedText(text : text)
        self.wantsLayer = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.target = self
        self.action = #selector(buttonClicked)
    }
}

extension CalculatorButton{
    @objc func buttonClicked(){
        if self.attributedTitle.string != "="{
            let numberValue = self.attributedTitle.string
            NotificationCenter.default.post(name: buttonNotification, object: numberValue)
        }
        func evaluateMathExpression(expression: String) -> Double? {
            let mathExpression = NSExpression(format: expression)
            let answer = mathExpression.expressionValue(with: nil, context: nil) as! Double
            return answer
        }

        var expression = textField.stringValue
        
 
       
        guard !expression.isEmpty else{
            result.string = ""
            return
        }
        
        guard let _ = Int(String(expression.last!)) else{
            return
        }
       
        
        expression = expression.replacingOccurrences(of: "x", with: "*")
        
        if let answer = evaluateMathExpression(expression: expression) {
            result.string = String(answer)
        } else {
            print("Invalid expression")
        }

    }
}
