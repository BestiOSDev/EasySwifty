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
    
//    //MARK: Reload Cell
//    func reload(at item : Int, inSection section : Int) {
//        reload(at : IndexPath(item: item, section: section))
//    }
//    func reload(at indexPath : IndexPath) {
//        reloadItems(at: [indexPath])
//    }
//    func reload(atSections section : Int) {
//        reloadSections(IndexSet(integer: section))
//    }
//
//    //MARK: Insert Cell
//    func insert(at item : Int, inSection section : Int) {
//        insert(at: IndexPath(item: item, section: section))
//    }
//    func insert(at indexPath : IndexPath) {
//        insertItems(at: [indexPath])
//    }
//    func insert(atSections section : Int) {
//        insertSections(IndexSet(integer: section))
//    }
//
//    //MARK: Delete Cell
//    func delete(at item : Int, inSection section : Int) {
//        delete(at: IndexPath(item: item, section: section))
//    }
//    func delete(at indexPath : IndexPath) {
//        deleteItems(at: [indexPath])
//    }
//    func delete(atSections section : Int) {
//        deleteSections(IndexSet(integer: section))
//    }
//
    @discardableResult
    func dequeueReusableCell<T : UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let  cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func registerCell<T : UICollectionViewCell>(_ t : T.Type) {
        if let xib = t.xib {
            register(xib, forCellWithReuseIdentifier: t.reuseIdentifier)
        } else {
            register(t, forCellWithReuseIdentifier: t.reuseIdentifier)
        }
    }
    
    
}

/// 添加上拉下拉刷新的
protocol MJCollectionViewRefreshable where Self : UIViewController {
    var collectionView : UICollectionView { get set }
    var pageNo : Int { get set}
    func beginRefresh(_ page : Int) //刷新后
}
//
//extension MJCollectionViewRefreshable {
//    
//    /// 默认实现 下拉刷新
//    func addHeaderRefresh() {
//        self.collectionView.mj_header = MiaoTuHeader(refreshingBlock: { [weak self] in
//            self?.pageNo = 1
//            self?.beginRefresh(self?.pageNo ?? 1)
//        })
//    }
//    
//    /// 默认实现 上拉加载更多
//    func addFooterRefresh() {
//        self.collectionView.mj_footer = MiaoTuFooter(refreshingBlock: { [weak self] in
//            self?.pageNo += 1
//            self?.beginRefresh(self?.pageNo ?? 1)
//        })
//    }
//    
//    func endRefresh() {
//        if self.collectionView.mj_header != nil {
//             self.collectionView.mj_header.endRefreshing()
//        }
//        if self.collectionView.mj_footer != nil {
//            self.collectionView.mj_footer.endRefreshing()
//        }
//    }
//}
//
//
