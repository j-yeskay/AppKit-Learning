//
//  CircleView.swift
//  Animations
//
//  Created by sathish-pt6686 on 31/05/23.
//

import Foundation
import AppKit

//
//public class CircleView : NSView{
//    public override func draw(_ dirtyRect: NSRect) {
//        super.draw(dirtyRect)
//
//        // Create an NSBezierPath instance
//        let circlePath = NSBezierPath()
//
//        // Define the circle's shape within a rectangle
//        print(dirtyRect)
////        let circleRect = NSRect(x: 0, y: 0, width: 600, height: 600)
//        let circleRect = NSRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: dirtyRect.width, height: dirtyRect.height))
//        circlePath.appendOval(in: circleRect)
//
//        // Set the fill color
//        NSColor.red.setFill()
//
//        // Fill the circle
//        circlePath.fill()
//
//        // Set the stroke color
//        NSColor.white.setStroke()
//
//        // Add an outline to the circle
//        circlePath.stroke()
//
//    }
//}

//public class CircleView : NSView{
//    public override func draw(_ dirtyRect: NSRect) {
//        super.draw(dirtyRect)
//
//
//
//
//    }
//}

import Cocoa

public class CircleView: NSView {
    
    public let totalSpendings : Int = 100
    
    let categoryPercentages : [NSColor : Double] = [NSColor.red : 25.0, NSColor.yellow : 65.0, NSColor.green : 10.0, NSColor.white : 10.0]

    public override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Calculate the number of colors
//        let numberOfColors = colors.count

        // Calculate the angle per color
        
        let centerX = dirtyRect.midX
        let centerY = dirtyRect.midY
        
        let radius = dirtyRect.width / 2
        let circleCenter = NSPoint(x: centerX, y: centerY)
        
        var startAngle = 0.0
        
        for i in categoryPercentages{
            let angle = (360.0 / 100) * i.value
            
            var circlePath = NSBezierPath()
            
            var endAngle = startAngle + angle
            
            circlePath.move(to: circleCenter)
            
            circlePath.appendArc(withCenter: circleCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            
            i.key.setFill()
            circlePath.fill()
            
            startAngle = endAngle
        }
        
        
//        let anglePerColor = 360.0 / 2.0
//
//        // Calculate the circle's center and radius
//        let centerX = dirtyRect.midX
//        let centerY = dirtyRect.midY
//        let radius = min(dirtyRect.width, dirtyRect.height) / 2
//        let circleCenter = NSPoint(x: centerX, y: centerY)
//
//        // Create an NSBezierPath instance
//        var circlePath = NSBezierPath()
//
//        let redStartAngle = 0.0
//        let redEndAngle = redStartAngle + anglePerColor
//
//        circlePath.move(to: NSPoint(x: centerX, y: centerY))
//
//        circlePath.appendArc(withCenter: circleCenter, radius: radius, startAngle: redStartAngle, endAngle: redEndAngle, clockwise: false)
//
//        NSColor.red.setFill()
//        circlePath.fill()
//
//        circlePath = NSBezierPath()
//
//        let blueStartAngle = redEndAngle
//        let blueEndAngle = blueStartAngle + anglePerColor
//
//        circlePath.move(to: circleCenter)
//
//        circlePath.appendArc(withCenter: circleCenter, radius: radius, startAngle: blueStartAngle, endAngle: blueEndAngle, clockwise: false)
//
//        NSColor.white.setFill()
//        circlePath.fill()

    }
}
