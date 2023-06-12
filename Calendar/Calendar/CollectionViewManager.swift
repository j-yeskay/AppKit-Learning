//
//  CollectionViewManager.swift
//  Calendar
//
//  Created by sathish-pt6686 on 07/06/23.
//

import Foundation
import AppKit

//
public class CollectionViewManager : NSObject, NSCollectionViewDelegate, NSCollectionViewDataSource{
    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        <#code#>
    }
    
    public func numberOfSections(in collectionView: NSCollectionView) -> Int {
        6
    }


}
