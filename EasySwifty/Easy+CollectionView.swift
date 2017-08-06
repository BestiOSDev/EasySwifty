//
//  Easy+CollectionView.swift
//  EaseSwifty
//
//  Created by 董招兵 on 2017/8/6.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionView {

    public func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T : ViewNameReusable {
        guard let  cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

}


public extension UICollectionView {

    //MARK: Reload Cell
    public func reload(at item : Int, inSection section : Int) {
        reload(at : IndexPath(item: item, section: section))
    }
    public func reload(at indexPath : IndexPath) {
        reloadItems(at: [indexPath])
    }
    public func reload(atSections section : Int) {
        reloadSections(IndexSet(integer: section))
    }

    //MARK: Insert Cell
    public func insert(at item : Int, inSection section : Int) {
        insert(at: IndexPath(item: item, section: section))
    }
    public func insert(at indexPath : IndexPath) {
        insertItems(at: [indexPath])
    }
    public func insert(atSections section : Int) {
        insertSections(IndexSet(integer: section))
    }

    //MARK: Delete Cell
    public func delete(at item : Int, inSection section : Int) {
        delete(at: IndexPath(item: item, section: section))
    }
    public func delete(at indexPath : IndexPath) {
        deleteItems(at: [indexPath])
    }
    public func delete(atSections section : Int) {
        deleteSections(IndexSet(integer: section))
    }
}

