//
//  TextView.swift
//  TextDemo
//
//  Created by sathish-pt6686 on 19/05/23.
//

import Foundation
import AppKit

public class TextView: NSTextView {
    convenience init() {
        
        let textStorage = NSTextStorage()
        let layoutManager = NSLayoutManager()
        
        textStorage.addLayoutManager(layoutManager)
//        textStorage.setAttributedString(NSAttributedString(string: "helo", attributes: [.foregroundColor: NSColor.white, .font: NSFont.systemFont(ofSize: 18)]))
        
        let textContainer = NSTextContainer()

        layoutManager.addTextContainer(textContainer)
        
        textContainer.layoutManager = layoutManager

        self.init(frame: NSRect(x: 0, y: 0, width: NSScreen.main!.frame.maxX, height: NSScreen.main!.frame.maxY), textContainer: textContainer)
        
        self.textContainerInset = .init(width: 100, height: 400)
        
        self.insertionPointColor = NSColor.clear
        
    }
}





// In summary, the NSTextView combines the functionality of the NSTextStorage, NSLayoutManager, and NSTextContainer to
// provide a versatile text display and editing interface. The NSTextStorage holds the text content, the NSLayoutManager
// manages the layout and rendering of the text, and the NSTextContainer defines the visual boundaries and flow of the
// text. These classes work together to handle text manipulation, layout, and display in the NSTextView component.
