//
//  Easy+TableView.swift
//  EaseSwifty
//
//  Created by 董招兵 on 2017/8/6.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation
import UIKit


public extension UITableView {
    
    func insertRows(at indexPaths: [IndexPath]) {

        if #available(iOS 11.0, *) {
            self.performBatchUpdates({ [weak self] in
                self?.insertRows(at: indexPaths, with: .none)
            }) { (true) in
                
            }
        } else {
            self.beginUpdates()
            self.insertRows(at: indexPaths, with: .none)
            self.endUpdates()
        }
    }
    
    ///找UITableViewCell 的重用
    @discardableResult
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    ///找UITableViewHeaderFooterView 的重用
    @discardableResult
    func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue HeaderFooter with identifier: \(T.reuseIdentifier)")
        }
        return view
    }
    
    ///找UITableViewHeaderFooterView 的重用
    @discardableResult
    func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>(_ reuseIdentifier : String) -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? T else {
            fatalError("Could not dequeue HeaderFooter with identifier: \(reuseIdentifier)")
        }
        return view
    }
    
    /// 注册cell 通过class 或者nib
    func registerCell<T: UITableViewCell >(_ t : T.Type) {
        if let xib = t.xib {
            register(xib, forCellReuseIdentifier: t.reuseIdentifier)
        } else {
            register(t, forCellReuseIdentifier: t.reuseIdentifier)
        }
    }
    
    /// 通过xib 或者 class 注册header footerview
    func registerHeaderFooter<T : UITableViewHeaderFooterView>(_ t : T.Type) {
        if let xib = t.xib {
            register(xib, forHeaderFooterViewReuseIdentifier: t.reuseIdentifier)
        } else {
            register(t, forHeaderFooterViewReuseIdentifier: t.reuseIdentifier)
        }
    }
    
    /// 通过 class 注册header footerview 并制定任意标识符
    func registerHeaderFooter<T : UITableViewHeaderFooterView>(_ t : T.Type,reuseIdentifier : String) {
        register(t, forHeaderFooterViewReuseIdentifier:reuseIdentifier)
    }
    
}

/// 添加上拉下拉刷新的
protocol MJTableViewRefreshable where Self : UIViewController {
    var tableView : UITableView { get set }
    var pageNo : Int { get set}
    func refreshingHandler(_ page : Int) //刷新后
}

//extension MJTableViewRefreshable {
//    
//    /// 默认实现 下拉刷新
//    func addHeaderRefresh() {
//        self.tableView.mj_header = MiaoTuHeader(refreshingBlock: { [weak self] in
//            self?.pageNo = 1
//            self?.refreshingHandler(self?.pageNo ?? 1)
//        })
//    }
//    
//    /// 默认实现 上拉加载更多
//    func addFooterRefresh() {
//        self.tableView.mj_footer = MiaoTuFooter(refreshingBlock: { [weak self] in
//            self?.pageNo += 1
//            self?.refreshingHandler(self?.pageNo ?? 1)
//        })
//    }
//    
//    func endRefresh() {
//        if self.tableView.mj_header != nil {
//            self.tableView.mj_header.endRefreshing()
//        }
//        if self.tableView.mj_footer != nil {
//            self.tableView.mj_footer.endRefreshing()
//        }
//    }
//}
