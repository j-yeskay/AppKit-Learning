//
//  MainView.swift
//  Calculator
//
//  Created by sathish-pt6686 on 18/05/23.
//

import Foundation
import AppKit


public class MainView : NSView{
    public override var acceptsFirstResponder: Bool {
        return true
    }
    public override func keyDown(with event: NSEvent) {
        super.keyDown(with: event)
        
        if event.modifierFlags.contains(.shift){
            if Int(event.keyCode) == 24{
                bplus.buttonClicked()
            }
            else if Int(event.keyCode) == 28{
                bmultiply.buttonClicked()
            }
        }
        else{
            keyCodeIndex[Int(event.keyCode)]?.buttonClicked()
        }
        
    }
    
}
