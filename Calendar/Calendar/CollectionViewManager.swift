//
//  CollectionViewManager.swift
//  Calendar
//
//  Created by sathish-pt6686 on 07/06/23.
//

import Foundation
import AppKit



public class CollectionViewManager : NSObject, NSCollectionViewDataSource{
    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "MyItem"), for: indexPath)
        item.view.subviews = []
        
        let date = CalendarController.thisMonthDates[(indexPath.first! * 7) + indexPath.last!]
        let dateString = "\(CalendarController.thisMonthDates[(indexPath.first! * 7) + indexPath.last!].formatted(date: .abbreviated, time: .omitted))"
        
        if dateString == Date().formatted(date: .abbreviated, time: .omitted){
            let attributes : [NSAttributedString.Key: Any] = [.foregroundColor: NSColor.red]
            let attributesString = NSAttributedString(string: dateString, attributes: attributes)
            item.view.addSubview(NSTextField(labelWithAttributedString: attributesString))
        }
        else{
            item.view.addSubview(NSTextField(labelWithString: dateString))
        }
       
        return item
    }
    
    public func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 6
    }
    
    public var collectionView : NSCollectionView = {
        let view = NSCollectionView()
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 100, height: 100)
        view.collectionViewLayout = flowLayout
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var scrollView : NSScrollView = {
        let view = NSScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}
