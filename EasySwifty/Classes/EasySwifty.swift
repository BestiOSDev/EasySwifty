//
//  EasySwifty.swift
//  EasySwifty
//
//  Created by 董招兵 on 2017/8/5.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation


//public func isMainThread() -> Bool {
//    return Thread.isMainThread
//}
//
//public func currentThread() -> Thread {
//    return Thread.current
//}
//
//public var k_appVersion : String {
//    get {
//        let version = infoDictionary["CFBundleShortVersionString"] as? String
//        return  version ?? "0.0.0"
//    }
//}
//
//public var k_appBundleIdentifier : String {
//    get {
//        let identifier = infoDictionary["CFBundleIdentifier"] as? String
//        return  identifier ?? ""
//    }
//}
//
//public var k_appBundleName : String {
//    get {
//        let name = infoDictionary["CFBundleName"] as? String
//        return  name ?? ""
//    }
//}
//public var k_app_display_name : String {
//    get {
//        let display_name = infoDictionary["CFBundleDisplayName"] as? String
//        return  display_name ?? ""
//    }
//}

//public var infoDictionary : [String :Any]  {
//    get {
//        return Bundle.main.infoDictionary ?? [String:Any]()
//    }
//}
//
//public func documentsPath() -> String {
//    return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first ?? ""
//}
//public func cachesPath() -> String {
//    return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first ?? ""
//}
//public func libraryPath() -> String {
//    return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first ?? ""
//}

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
    if isDebugMode() {
        print("\n\(methodName) \n \(msg)\n")
    }
}

