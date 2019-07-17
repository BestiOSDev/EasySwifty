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
public func classFromString(_ className : String) -> AnyClass {
    let workspace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String
    guard workspace != nil else {
        fatalError("获取当前类所在命名空间失败")
    }
    return NSClassFromString(workspace! + "." + className) as! AnyClass
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
    
    var className : String {
        get {
            return String(describing: self)
        }
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
    
    func easy_post(_ name : NotificationName) {
        easy_post(name, object: nil)
    }
    
    func easy_post(_ name : NotificationName , object obj : Any?) {
        easy_post(name, object: obj, info: nil)
    }
    
    func easy_post(_ name : NotificationName , object obj : Any?, info : [String : Any]?) {
        NotificationCenter.default.post(name: name, object: obj, userInfo: info)
    }
    
    func easy_addObserver(forName name : NotificationName, object obj: Any?, queue: OperationQueue?, using block: @escaping (Notification) -> Void) {
        self.addObserver(forName : name, object: obj, queue: queue, using: block)
    }
    
    
}

