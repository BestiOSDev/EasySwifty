//
//  EasySwifty.swift
//  EasySwifty
//
//  Created by 董招兵 on 2017/8/5.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation

public func isMainThread() -> Bool {
    return Thread.isMainThread
}

public func currentThread() -> Thread {
    return Thread.current
}

public var k_AppVersion : String {
    get {
        let version = infoDictionary["CFBundleShortVersionString"] as? String
        return  version ?? "0.0.0"
    }
}

public var k_appBundleIdentifier : String {
    get {
        let identifier = infoDictionary["CFBundleIdentifier"] as? String
        return  identifier ?? ""
    }
}

public var k_appBundleName : String {
    get {
        let name = infoDictionary["CFBundleName"] as? String
        return  name ?? ""
    }
}
public var k_app_display_name : String {
    get {
        let display_name = infoDictionary["CFBundleDisplayName"] as? String
        return  display_name ?? ""
    }
}

public var infoDictionary : [String :Any]  {
    get {
        return Bundle.main.infoDictionary ?? [String:Any]()
    }
}

public func documentsPath() -> String {
    return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first ?? ""
}
public func cachesPath() -> String {
    return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first ?? ""
}
public func libraryPath() -> String {
    return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first ?? ""
}

public func isDebugMode() -> Bool {
    #if DEBUG
        return true
    #else
        return false
    #endif
}

/**
 自定义 LOG
 */
public func NJLog<T>(_ msg: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line) {
    #if DEBUG
        print("\n\(methodName) \n \(msg)\n")
    #endif
}

public extension DispatchTime  {

    public init<T : DispatchTimeValueType>(value : T) {
        if value.type == 1 {
            let v = value.rawValue as! Int
            self = DispatchTime.now() + .seconds(v)
        } else  {
            let d = value.rawValue as! Double
            self = DispatchTime.now() + .milliseconds(Int(d * 1000))
        }
    }

}
public protocol DispatchTimeValueType {

    associatedtype TimeLiteralType
    init(value: Self.TimeLiteralType)
    var type : Int { get }
    var rawValue : Any { get }

}

extension Int : DispatchTimeValueType {
    public var rawValue: Any { return self }
    public var type : Int {  return 1  }
    public typealias TimeLiteralType = Int
    public init(value: TimeLiteralType) {
        self = value
    }
}

extension Double : DispatchTimeValueType {
    public var rawValue: Any { return self }
    public var type: Int { return 2 }
    public typealias TimeLiteralType = Double
    public init(value: TimeLiteralType) {
        self = value
    }
}

// MARK: - DispatchQueue

public extension  DispatchQueue {

    /// 延时调用一段代码 传入 Int / Double
    public func delay<T : DispatchTimeValueType>(deadline time : T,closure:@escaping ()->()) {
        self.asyncAfter(deadline:DispatchTime(value: time), execute: closure)
    }

    /// 主线程异步执行
    public class func mainAsync(_ main : @escaping () -> Void ) {
        DispatchQueue.main.async {
            main()
        }
    }

    /// 异步线程
    public class func globalAsync(_ global : @escaping () -> Void) {
        DispatchQueue.global().async {
            global()
        }
    }

    /// 执行耗时操作完毕后回到主线程
    public class func startAsync(_ global : @escaping () -> Void,main : @escaping () -> Void) {
        DispatchQueue.global().async {
            global()
            DispatchQueue.main.async {
                main()
            }
        }
    }


}

// MARK: - OperationQueue
public extension OperationQueue {

    public class func mainAsync(_ main : @escaping () -> Void) {
        OperationQueue.main.addOperation {
            main()
        }
    }

}
