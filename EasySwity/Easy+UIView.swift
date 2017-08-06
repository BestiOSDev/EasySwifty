//
//  Easy+UIView.swift
//  EaseSwifty
//
//  Created by 董招兵 on 2017/8/6.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation
import UIKit

public let KScreenWidth  = KscreenSize.width
public let KScreenHeight = KscreenSize.height
public let KscreenSize   = UIScreen.main.bounds.size

// MARK: - UIView

public extension UIView {

    public class func viewType() -> Self {
        return self.init()
    }

    //  Top
    public var top : CGFloat {
        set (_newTop){
            var rect      = self.frame;
            rect.origin.y = _newTop;
            self.frame    = rect;
        }
        get { return self.frame.minY }
    }

    // Left
    public var left : CGFloat {
        set(_newLeft) {
            var rect      = self.frame;
            rect.origin.x = _newLeft;
            self.frame    = rect;
        }
        get { return self.frame.minX }
    }

    // Bottom
    public var bottom : CGFloat {
        set (_newBottom) {
            var frame       = self.frame
            frame.origin.y  = _newBottom - frame.size.height;
            self.frame      = frame;
        }
        get { return self.frame.maxY }
    }

    // Right
    public var right : CGFloat {
        set (_newRight){
            var rect      = self.frame;
            rect.origin.x = _newRight - rect.width;
            self.frame    = rect;
        }
        get { return self.frame.maxX }
    }

    // Width
    public var width : CGFloat {
        set(_newWidth) {
            var rect        = self.frame;
            rect.size.width = _newWidth;
            self.frame      = rect;
        }
        get { return self.frame.width }
    }
    // Height
    public var height : CGFloat {
        set (_newHeight){
            var rect         = self.frame;
            rect.size.height = _newHeight;
            self.frame       = rect;
        }
        get { return self.frame.height }
    }

    // Size
    public var size : CGSize {
        set(_newSize) {
            var frame   = self.frame;
            frame.size  = _newSize;
            self.frame  = frame;
        }
        get { return self.frame.size }
    }

    // Origin
    public var origin : CGPoint {
        set (_newOrgin) {
            var frame       = self.frame;
            frame.origin    = _newOrgin;
            self.frame       = frame;
        }
        get { return self.frame.origin }
    }

    // CenterX
    public var center_x : CGFloat {
        set (_newCenterX) {
            self.center = CGPoint(x: _newCenterX, y: self.center_x)
        }
        get { return self.center.x }
    }

    // CenterY
    public var center_y : CGFloat {
        set (_newCenterY) {
            self.center = CGPoint(x: self.center_x, y: _newCenterY)
        }
        get { return self.center.y }
    }

    /**
     从 XIB 加载一个 view
     */
    public class func viewFromNib<T>() ->  T  {
        let className = self.className().components(separatedBy: ".").last
        let nib  = Bundle.main.loadNibNamed(className! as String, owner: nil, options: nil)?.last
        guard nib != nil else {
            fatalError("Could not find Nib with name: \(className ?? "")")
        }
        return nib as!  T
    }

    /**
     移除所有子视图
     */
    public func removeAllSubviews() {
        while self.subviews.count > 0 {
            let view = self.subviews.last
            view?.removeFromSuperview()
        }
    }

    public var cornerRadius : CGFloat {
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds    = true
        }
        get {
            return self.layer.cornerRadius
        }
    }
    public var borderColor : UIColor? {
        set {
            self.layer.borderColor = newValue?.cgColor
        }
        get {
            guard self.layer.borderColor != nil else {
                return nil
            }
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    public var borderWidth : CGFloat {
        set {
            self.layer.borderWidth = borderWidth
        }
        get {
            return self.layer.borderWidth
        }
    }
    /**
     给一个 view 添加手势事件
     */
    public func addTarget(_ target : AnyObject?, action : Selector?) {
        if (target == nil || action == nil) { return }
        self.isUserInteractionEnabled = true;
        self.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action!))
    }

    public var viewController : UIViewController?  {
        let target  = self.next
        while target != nil {
            if (target?.isKind(of: UIViewController.self))! {
                return target as? UIViewController
            }
        }
        return nil
    }

}


// MARK: - UIButton
@objc public extension UIButton {

    /**
     给按钮设置不同状态下的颜色
     */
    public func setBackgroundColor(backgroundColor color: UIColor? ,forState state: UIControlState) {
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

    @objc public func indexPathAtTableView(_ tableView : UITableView, forEvent event : NSObject) -> IndexPath? {

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

   @objc public func indexPathAtCollectionView(_ collectionView : UICollectionView, forEvent event : NSObject) -> IndexPath?  {

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

// MARK: - UILabel
extension UILabel {

    /// 获取该label展示当前文字所需最小size，当没有文字时，返回宽度为0，高度为font。lineHeight的size
    public var displaySize: CGSize {
        if let text = text {
            let attributes : [NSAttributedStringKey : Any] = [NSAttributedStringKey.font : font]
            return (text as NSString).boundingRect(with: CGSize(width: Double(MAXFLOAT), height: Double(MAXFLOAT)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil).size
        } else {
            return CGSize(width: 0, height: font.lineHeight)
        }
    }

}

public protocol ViewNameReusable : class { }
public extension ViewNameReusable where Self : UIView {
    static var reuseIdentifier:String {
        return String(describing: self)
    }
}


// MARK: - UINavigationController
extension UINavigationController {


    /**
     延迟几秒后执行 pop 操作

     - parameter animated: 是否需要动画
     - parameter delay:    延时时间
     */
    func popViewControllerAnimated(_ animated : Bool ,delay : Double) {
        self.perform(#selector(popViewController(animated:)), with: nil, afterDelay: delay)
    }
    /**
     延时时间调用 pop 方法到指定控制器
     */
    func popToViewController(_ viewController: UIViewController, animated: Bool ,delay : Double){
        self.perform(#selector(popToViewController(_:animated:)), with: nil, afterDelay: delay)
    }

    /**
     延时方法 pop 到根控制器
     */
    func popToRootViewControllerAnimated(_ animated: Bool ,delay : Double) {
        self.perform(#selector(popToRootViewController(animated:)), with: nil, afterDelay: delay)
    }


}



