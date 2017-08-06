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

    /*
     Perform a series of method calls that insert, delete, or select rows and
     sections of the receiver.
     */
    public func update(using block : (UITableView)->Void) {
        beginUpdates()
        block(self)
        endUpdates()
    }
    /*
     Scrolls the receiver until a row or section location on the screen.
     */
    public func scrollTo(row : Int ,in section : Int,at position : UITableViewScrollPosition , with animated : Bool) {
        let indexPath = IndexPath(row: row, section: section)
        scrollToRow(at: indexPath, at: position, animated: animated)
    }
    /**
     Inserts a row in the receiver with an option to animate the insertion.
     */
    public func insert(atRow row : Int, inSection section : Int , with animation : UITableViewRowAnimation) {
        let indexPath = IndexPath(row: row, section: section)
        insert(atIndexPath: indexPath, with: animation)
    }
    /*
     Inserts a row in the receiver by an IndexPath with an option to animate the insertion.
     */
    public func insert(atIndexPath indexPath : IndexPath, with animation : UITableViewRowAnimation) {
        insertRows(at: [indexPath], with: animation)
    }
    /*
     Reloads the specified row using a certain animation effect.
     */
    public func reload(atRow row : Int , inSection section : Int , with animation : UITableViewRowAnimation) {
        reload(atIndexPath: IndexPath(row: row, section: section), with: animation)
    }
    /*
     Reloads the specified row using a certain animation effect.
     */
    public func reload(atIndexPath indexPath : IndexPath, with animation : UITableViewRowAnimation) {
        reloadRows(at: [indexPath], with: animation)
    }

    /**
     Deletes the row with an option to animate the deletion.
     **/
    public func delete(atRow row:Int , inSection section : Int , with animation : UITableViewRowAnimation) {
        delete(atIndexPath: IndexPath(row: row, section: section), with: animation)
    }
    public func delete(atIndexPath indexPath : IndexPath , with animation : UITableViewRowAnimation) {
        deleteRows(at: [indexPath], with: animation)
    }
    /**
     Inserts a section in the receiver, with an option to animate the insertion.
     **/
    public func insert(atSection section : Int , with animation : UITableViewRowAnimation) {
        insertSections(IndexSet(integer: section), with: animation)
    }
    /**
     Deletes a section in the receiver, with an option to animate the deletion.
     **/
    public func delete(atSection section : Int , with animation : UITableViewRowAnimation) {
        deleteSections(IndexSet(integer: section), with: animation)
    }
    /**
     Reloads the specified section using a given animation effect.
     */
    public func reload(atSection section : Int , with animation : UITableViewRowAnimation) {
        reloadSections(IndexSet(integer: section), with: animation)
    }
    /**
     Unselect all rows in tableView.
     */
    public func clearSelectedRows(with animated : Bool) {
        if let indexs = indexPathsForSelectedRows {
            for (_,indexPath) in indexs.enumerated() {
                deselectRow(at: indexPath, animated: animated)
            }
        }
    }
    
}


extension UITableView {

    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T : ViewNameReusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

    // 非常用方法 延时 tableView 刷新 巴爷汇中设置 tableViewHeader 界面布局出现问题 需要延时刷新下
    func delayReload(with duration : Double) {
        self.perform(#selector(reloadData), with: nil, afterDelay: duration)
    }

}



