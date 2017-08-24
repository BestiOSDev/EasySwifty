//
//  Easy+NSObject.swift
//  EasySwifty
//
//  Created by 董招兵 on 2017/8/5.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation

/**
 根据一个类找到这个类字符串
 */
public func stringFromClass(_ aClass : AnyClass?) -> String? {
    guard let cls = aClass else { return nil }
    return NSStringFromClass(cls)
}

/**
 从一个字符串生成一个类
 */
public func classFromString(_ className : String?) -> AnyClass? {
    guard  className != nil else { return nil}
    guard let workspace =  Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
        fatalError("获取当前类所在命名空间失败")
    }
    return NSClassFromString(workspace + "." + className!)
}

fileprivate var block_key: Void?

// MARK: - Runtime 对象属性关联

public extension NSObject {

    /**
     关联一个对象 保留所有权
     */
    func setAssociateValue(_ value : Any! ,forKey key : UnsafeRawPointer!) {
        objc_setAssociatedObject(self, key, value,objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    /**
     关联一个弱引用对象
     */
    func setAssociateWeakValue(_ value : Any! ,forKey key : UnsafeRawPointer!) {
        objc_setAssociatedObject(self, key, value, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
    }

    /**
     移除所有关联的对象
     */
    func  removeAssociatedValues() {
        objc_removeAssociatedObjects(self)
    }

    /**
     获取关联的某个对象 根据这个对象的 key
     */
    func getAssociatedValue(forKey key : UnsafeRawPointer!) -> Any? {
        return objc_getAssociatedObject(self, key)
    }

    /**
     获取类名 如 UIView 不带命名空间
     */
    public class func className() -> String {
        return String(describing: self)
    }

    /**
     获取类名 命名空间.加文件名 如 Baye.Home
     */
    public class func fullClassName() -> String {
        let cls = stringFromClass(self)!
        guard let workspace =  Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            fatalError("获取当前类所在命名空间失败")
        }
        return workspace + "." + cls
    }

    public func className() -> String {
        return String(describing: self.classForCoder)
    }

    public func fullClassName() -> String {
        return stringFromClass(self.classForCoder)!
    }


}

public typealias NotificationName = Notification.Name
extension NotificationName : ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    public init(stringLiteral value: StringLiteralType) {
        self = Notification.Name.init(value)
    }
}

public extension NotificationCenter {

    public class func post(_ name : NotificationName) {
        post(name, object: nil)
    }

    public  class func post(_ name : NotificationName , object obj : Any?) {
        post(name, object: obj, info: nil)
    }

    public  class func post(_ name : NotificationName , object obj : Any?, info : [String : Any]?) {
        NotificationCenter.default.post(name: name, object: obj, userInfo: info)
    }

    public class func addObserver(forName name : NotificationName, object obj: Any?, using block: @escaping (Notification) -> Void) {
        addObserver(forName: name, object: obj, queue: OperationQueue.main, using: block)
    }

    public class func addObserver(forName name : NotificationName, object obj: Any?, queue: OperationQueue?, using block: @escaping (Notification) -> Void) {
        NotificationCenter.default.addObserver(forName : name, object: obj, queue: queue, using: block)
    }


}
