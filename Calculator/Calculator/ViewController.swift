//
//  ViewController.swift
//  Calculator
//
//  Created by sathish-pt6686 on 18/05/23.
//

import Foundation
import AppKit


public var b1 : CalculatorButton!
public var b2 : CalculatorButton!
public var b3 : CalculatorButton!
public var b4 : CalculatorButton!
public var b5 : CalculatorButton!
public var b6 : CalculatorButton!
public var b7 : CalculatorButton!
public var b8 : CalculatorButton!
public var b9 : CalculatorButton!
public var b0 : CalculatorButton!

public var bplus : CalculatorButton!
public var bminus : CalculatorButton!
public var bmultiply : CalculatorButton!
public var bdivide : CalculatorButton!

public var bdot : CalculatorButton!
public var bequals : CalculatorButton!

public var bdelete : CalculatorButton!

public var textField : CalculatorField!

public var result : CalculatorResult!

public var keyCodeIndex : [Int: CalculatorButton] = [:]


public class ViewController : NSViewController{
    public override func loadView() {
        
        self.view = MainView(frame: NSRect(x: 0, y: 0, width: NSScreen.main!.frame.maxX, height: NSScreen.main!.frame.maxY))
        
        
        b1 = CalculatorButton(text: "1")
        b2 = CalculatorButton(text: "2")
        b3 = CalculatorButton(text: "3")
        b4 = CalculatorButton(text: "4")
        b5 = CalculatorButton(text: "5")
        b6 = CalculatorButton(text: "6")
        b7 = CalculatorButton(text: "7")
        b8 = CalculatorButton(text: "8")
        b9 = CalculatorButton(text: "9")
        b0 = CalculatorButton(text: "0")
        
        bplus = CalculatorButton(text: "+")
        bminus = CalculatorButton(text: "-")
        bmultiply = CalculatorButton(text: "x")
        bdivide = CalculatorButton(text: "/")
        
        bdot = CalculatorButton(text: ".")
        bequals = CalculatorButton(text: "=")
        
        bdelete = CalculatorButton(text: "DEL")
        
        textField = CalculatorField()
        
        result = CalculatorResult()
    }
    
    public override func viewDidLoad() {
        view.addSubview(b1)
        view.addSubview(b2)
        view.addSubview(b3)
        view.addSubview(b4)
        view.addSubview(b5)
        view.addSubview(b6)
        view.addSubview(b7)
        view.addSubview(b8)
        view.addSubview(b9)
        view.addSubview(b0)
        
        view.addSubview(bplus)
        view.addSubview(bminus)
        view.addSubview(bmultiply)
        view.addSubview(bdivide)

        view.addSubview(bdot)
        view.addSubview(bequals)
        
        view.addSubview(bdelete)
        
        view.addSubview(textField)
        
        view.addSubview(result)
        
        
        NSLayoutConstraint.activate([
        
            b1.heightAnchor.constraint(equalToConstant: 100),
            b2.heightAnchor.constraint(equalToConstant: 100),
            b3.heightAnchor.constraint(equalToConstant: 100),
            b4.heightAnchor.constraint(equalToConstant: 100),
            b5.heightAnchor.constraint(equalToConstant: 100),
            b6.heightAnchor.constraint(equalToConstant: 100),
            b7.heightAnchor.constraint(equalToConstant: 100),
            b8.heightAnchor.constraint(equalToConstant: 100),
            b9.heightAnchor.constraint(equalToConstant: 100),
            b0.heightAnchor.constraint(equalToConstant: 100),
            
            bplus.heightAnchor.constraint(equalToConstant: 100),
            bminus.heightAnchor.constraint(equalToConstant: 100),
            bmultiply.heightAnchor.constraint(equalToConstant: 100),
            bdivide.heightAnchor.constraint(equalToConstant: 100),
            
            bdot.heightAnchor.constraint(equalToConstant: 100),
            bequals.heightAnchor.constraint(equalToConstant: 100),
            
            bdelete.heightAnchor.constraint(equalToConstant: 100),
            
            b1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            b2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            b3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            b4.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            b5.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            b6.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            b7.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            b8.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            b9.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            b0.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            
            bplus.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.14285714285714),
            bminus.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.14285714285714),
            bmultiply.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.14285714285714),
            bdivide.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.14285714285714),
            
            bdot.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.14285714285714),
            bequals.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.14285714285714),
            
            bdelete.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.14285714285714),
            
            b1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            b2.leadingAnchor.constraint(equalTo: b1.trailingAnchor),
            b3.leadingAnchor.constraint(equalTo: b2.trailingAnchor),
            b4.leadingAnchor.constraint(equalTo: b3.trailingAnchor),
            b5.leadingAnchor.constraint(equalTo: b4.trailingAnchor),
            b5.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            b6.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            b6.bottomAnchor.constraint(equalTo: b1.topAnchor),
            
            b7.leadingAnchor.constraint(equalTo: b6.trailingAnchor),
            b7.bottomAnchor.constraint(equalTo: b2.topAnchor),
            
            b8.leadingAnchor.constraint(equalTo: b7.trailingAnchor),
            b8.bottomAnchor.constraint(equalTo: b3.topAnchor),
            
            b9.leadingAnchor.constraint(equalTo: b8.trailingAnchor),
            b9.bottomAnchor.constraint(equalTo: b4.topAnchor),
            
            b0.leadingAnchor.constraint(equalTo: b9.trailingAnchor),
            b0.bottomAnchor.constraint(equalTo: b5.topAnchor),
            
            bplus.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bminus.leadingAnchor.constraint(equalTo: bplus.trailingAnchor),
            bmultiply.leadingAnchor.constraint(equalTo: bminus.trailingAnchor),
            bdivide.leadingAnchor.constraint(equalTo: bmultiply.trailingAnchor),

            bplus.bottomAnchor.constraint(equalTo: b6.topAnchor),
            bminus.bottomAnchor.constraint(equalTo: b7.topAnchor),
            bmultiply.bottomAnchor.constraint(equalTo: b8.topAnchor),
            bdivide.bottomAnchor.constraint(equalTo: b9.topAnchor),

            bdot.leadingAnchor.constraint(equalTo: bdivide.trailingAnchor),
            bdot.bottomAnchor.constraint(equalTo: b9.topAnchor),

            bequals.leadingAnchor.constraint(equalTo: bdot.trailingAnchor),
            bequals.bottomAnchor.constraint(equalTo: b9.topAnchor),

            bdelete.leadingAnchor.constraint(equalTo: bequals.trailingAnchor),
            bdelete.bottomAnchor.constraint(equalTo: b9.topAnchor),
            bdelete.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 100),
            textField.topAnchor.constraint(equalTo: view.topAnchor),
            
            result.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            result.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            result.heightAnchor.constraint(equalToConstant: 100),
            result.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50),
        
        ])
    
        keyCodeIndex[18] = b1
        keyCodeIndex[19] = b2
        keyCodeIndex[20] = b3
        keyCodeIndex[21] = b4
        keyCodeIndex[23] = b5
        keyCodeIndex[22] = b6
        keyCodeIndex[26] = b7
        keyCodeIndex[28] = b8
        keyCodeIndex[25] = b9
        keyCodeIndex[29] = b0
        keyCodeIndex[27] = bminus
        keyCodeIndex[44] = bdivide
        keyCodeIndex[47] = bdot
        keyCodeIndex[51] = bdelete
        keyCodeIndex[24] = bequals

    }
}
