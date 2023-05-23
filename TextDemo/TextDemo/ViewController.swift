import Foundation
import AppKit


public class ViewController : NSViewController{

    var textField : TextField!

    var chatScrollView : NSScrollView!

    var chatClipView : NSClipView!

    var chatMessageStackView : NSStackView!
    
    @objc public func messageSent(){
        let input = textField.stringValue
        textField.stringValue = ""
        let newMessage = NSTextField(labelWithString: input)
        newMessage.drawsBackground = true
        newMessage.backgroundColor = NSColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        chatMessageStackView.addArrangedSubview(newMessage)
    }

    public override func loadView() {
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: NSScreen.main!.frame.maxX, height: NSScreen.main!.frame.maxY))

        textField = TextField()

        chatScrollView = NSScrollView()
        chatScrollView.hasVerticalScroller = true
        chatClipView = NSClipView()


        chatScrollView.horizontalScrollElasticity = .none
        chatScrollView.verticalScrollElasticity = .none

        chatScrollView.translatesAutoresizingMaskIntoConstraints = false
        chatClipView.translatesAutoresizingMaskIntoConstraints = false

        chatScrollView.contentView = chatClipView

        chatMessageStackView = NSStackView()
        chatMessageStackView.translatesAutoresizingMaskIntoConstraints = false
        chatMessageStackView.orientation = .vertical
        
//        for i in 0...28{
//            let newMessage = NSTextField(labelWithString: "Message : \(i)")
//            newMessage.drawsBackground = true
//            newMessage.backgroundColor = NSColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
//            chatMessageStackView.addArrangedSubview(newMessage)
//        }

        chatScrollView.documentView = chatMessageStackView
        textField.action = #selector(messageSent)
        textField.target = self

    }

    public override func viewDidLoad() {
        view.addSubview(textField)
        view.addSubview(chatScrollView)
        

        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            textField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),

            chatScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            chatScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            chatScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            chatScrollView.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -100),
            
            chatMessageStackView.leadingAnchor.constraint(equalTo: chatScrollView.leadingAnchor),
            chatMessageStackView.trailingAnchor.constraint(equalTo: chatScrollView.trailingAnchor),
            chatMessageStackView.topAnchor.constraint(equalTo: chatScrollView.topAnchor),
            chatMessageStackView.widthAnchor.constraint(equalTo: chatScrollView.widthAnchor),
            chatMessageStackView.bottomAnchor.constraint(greaterThanOrEqualTo: chatScrollView.bottomAnchor),
            chatMessageStackView.heightAnchor.constraint(greaterThanOrEqualTo: chatScrollView.heightAnchor),

        ])
    }
}
