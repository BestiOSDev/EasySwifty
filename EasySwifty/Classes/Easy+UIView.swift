//
//  Easy+UIView.swift
//  EaseSwifty
//
//  Created by 董招兵 on 2017/8/6.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation
import UIKit

//public func kScaleWidth(_ value : CGFloat) -> CGFloat {
//    return UIScreen.main.autoScaleW(value)
//}
//

public func kScaleWidth(_ value : CGFloat) -> CGFloat {
    return 0.0
}

// MARK: - UIView

public extension UIView {

    class func viewType() -> Self {
        return self.init()
    }

    //  Top
    var top : CGFloat {
        set (_newTop){
            var rect      = self.frame;
            rect.origin.y = _newTop;
            self.frame    = rect;
        }
        get { return self.frame.minY }
    }

    // Left
    var left : CGFloat {
        set(_newLeft) {
            var rect      = self.frame;
            rect.origin.x = _newLeft;
            self.frame    = rect;
        }
        get { return self.frame.minX }
    }

    // Bottom
    var bottom : CGFloat {
        set (_newBottom) {
            var frame       = self.frame
            frame.origin.y  = _newBottom - frame.size.height;
            self.frame      = frame;
        }
        get { return self.frame.maxY }
    }

    // Right
    var right : CGFloat {
        set (_newRight){
            var rect      = self.frame;
            rect.origin.x = _newRight - rect.width;
            self.frame    = rect;
        }
        get { return self.frame.maxX }
    }

    // Width
    var width : CGFloat {
        set(_newWidth) {
            var rect        = self.frame;
            rect.size.width = _newWidth;
            self.frame      = rect;
        }
        get { return self.frame.width }
    }
    // Height
    var height : CGFloat {
        set (_newHeight){
            var rect         = self.frame;
            rect.size.height = _newHeight;
            self.frame       = rect;
        }
        get { return self.frame.height }
    }

    // Size
    var size : CGSize {
        set(_newSize) {
            var frame   = self.frame;
            frame.size  = _newSize;
            self.frame  = frame;
        }
        get { return self.frame.size }
    }

    // Origin
    var origin : CGPoint {
        set (_newOrgin) {
            var frame       = self.frame;
            frame.origin    = _newOrgin;
            self.frame       = frame;
        }
        get { return self.frame.origin }
    }

    // CenterX
    var center_x : CGFloat {
        set (_newCenterX) {
            self.center = CGPoint(x: _newCenterX, y: self.center_x)
        }
        get { return self.center.x }
    }

    // CenterY
    var center_y : CGFloat {
        set (_newCenterY) {
            self.center = CGPoint(x: self.center_x, y: _newCenterY)
        }
        get { return self.center.y }
    }

    /**
     移除所有子视图
     */
    func removeAllSubviews() {
        while self.subviews.count > 0 {
            let view = self.subviews.last
            view?.removeFromSuperview()
        }
    }


    /**
     给一个 view 添加手势事件
     */
    func addTarget(_ target : AnyObject?, action : Selector?) {
        if (target == nil || action == nil) { return }
        self.isUserInteractionEnabled = true;
        self.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action!))
    }

    @discardableResult
    class func viewFromNib<T: UIView>() -> T {
        let className = T.reuseIdentifier.components(separatedBy: ".").last ?? ""
        let nib  = Bundle.main.loadNibNamed(className, owner: nil, options: nil)?.last
        guard nib != nil else {
            fatalError("Could not find Nib with name: \(className)")
        }
        return nib as!  T
    }
    

}

// MARK: - UIButton
@objc public extension UIButton {

    /**
     给按钮设置不同状态下的颜色
     */
    func setBackgroundColor(backgroundColor color: UIColor? ,forState state: UIControl.State) {
        guard color != nil else { return }
        self.setBackgroundImage(UIImage.imageWithColor(color!), for: state)
    }

    /// 获取 button 所在tableview cell 的 indexPath
    /// button 点击方法应该

 //   button.addTarget(self, action: #selector(buttonClick(btn:event:)), for: .touchUpInside)

//    @objc func buttonClick(btn:UIButton,event:Any) {
//
//        if let indexPath =  btn.indexPath(at: UITableView(), forEvent: event) {
//            print(indexPath)
//        }
//    }
    @discardableResult
    func indexPathAtTableView(_ tableView : UITableView, forEvent event : Any) -> IndexPath? {

        // 获取 button 所在 cell 的indexPath
        let set = (event as! UIEvent).allTouches
        for (_ ,anyObj) in (set?.enumerated())! {
            let point = anyObj.location(in: tableView)
            let indexPath = tableView.indexPathForRow(at: point)
            if indexPath != nil {
                return indexPath!;
            }
        }

        return nil

    }

    /// 当点击某个 CollectionCell 上 button 时 获取某个 cell.indexPath
    //   button.addTarget(self, action: #selector(buttonClick(btn:event:)), for: .touchUpInside)

    //    @objc func buttonClick(btn:UIButton,event:Any) {
    //
    //        if let indexPath =  btn.indexPath(at: UICollectionView(), forEvent: event) {
    //            print(indexPath)
    //        }
    //    }
    @discardableResult
    func indexPathAtCollectionView(_ collectionView : UICollectionView, forEvent event : NSObject) -> IndexPath?  {

        // 获取 button 所在 cell 的indexPath
        let set = (event as! UIEvent).allTouches
        for (_ ,anyObj) in (set?.enumerated())! {
            let point = anyObj.location(in: collectionView)
            let indexPath = collectionView.indexPathForItem(at: point)
            if indexPath != nil {
                return indexPath!;
            }
        }
        return nil

    }


}

extension UIView : ViewNameReusable {
    
    public class var reuseIdentifier:String {
        return String(describing: self)
    }
    
    public class var xib : UINib? {
        return UINib(nibName: self.reuseIdentifier, bundle: nil)
    }
}


public protocol ViewNameReusable : class {
    static var reuseIdentifier : String { get }
}

