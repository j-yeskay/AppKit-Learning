//
//  CircleView.swift
//  Animations
//
//  Created by sathish-pt6686 on 31/05/23.
//

import Foundation
import AppKit
import Cocoa

public class CircleView: NSView {
    
    public let totalSpendings : Int = 100
    
    weak var viewControllerRef : ViewController?
    
    let categoryPercentages : [NSColor : Double] = [NSColor.red : 25.0, NSColor.yellow : 65.0, NSColor.green : 10.0, NSColor.white : 10.0]
    
    let colors = [NSColor.red, NSColor.yellow, NSColor.green, NSColor.white]
    let percentages = [25.0, 65.0, 10.0, 10.0]
    
    var boundsAndColors : [NSColor: NSRect] = [:]

    public override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        let centerX = dirtyRect.midX
        let centerY = dirtyRect.midY
        
        let radius = dirtyRect.width / 2
        let circleCenter = NSPoint(x: centerX, y: centerY)
        
        var startAngle = 0.0
        
        for i in 0...percentages.count - 1{
            let angle = (360.0 / 100) * percentages[i]
            
            let circlePath = NSBezierPath()
            
            let endAngle = startAngle + angle
            
            circlePath.move(to: circleCenter)
            
            circlePath.appendArc(withCenter: circleCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            
            colors[i].setFill()
//            NSColor.clear.setFill()
            circlePath.fill()
            
            
            boundsAndColors[colors[i]] = circlePath.bounds
//            draw(circlePath.bounds)
            
//            NSTextField(labelWithString: "\(NSColor)")
            
            startAngle = endAngle

        }
//        self.viewControllerRef?.addText()
    }
    
    public func fadeOut(){
        let animationDict : [NSViewAnimation.Key : Any] = [.effect : NSViewAnimation.EffectName.fadeOut, .target: self]
        let animation = NSViewAnimation(viewAnimations: [animationDict])
        let delegate = AnimationDelegate()
        delegate.view = self
        animation.delegate = delegate
//        animation.duration = 5
        animation.start()
//        self.isHidden = true
    }
    
    public func fadeIn(){
        let animationDict : [NSViewAnimation.Key : Any] = [.effect : NSViewAnimation.EffectName.fadeIn, .target: self]
        let animation = NSViewAnimation(viewAnimations: [animationDict])
//        let delegate = AnimationDelegate()
//        delegate.view = self
//        animation.delegate = delegate
//        animation.duration = 5
        animation.start()
        self.isHidden = false
    }
    
    
     class AnimationDelegate : NSObject, NSAnimationDelegate{
         var view : NSView?
         func animationDidEnd(_ animation: NSAnimation) {
             self.view?.isHidden = true
        }
    }
    
//    class FadeInAnimationDelegate : NSObject, NSAnimationDelegate{
//        var view : NSView?
//        func animationDidEnd(_ animation: NSAnimation) {
//            self.view?.isHidden = false
//       }
//   }
    

//    public func addText(){
//        print(boundsAndColors)
//        for i in boundsAndColors{
//            self.addSubview(NSView(frame: i.value))
//        }
//    }
}
