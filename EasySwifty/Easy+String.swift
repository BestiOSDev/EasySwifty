//
//  Easy+String.swift
//  EaseSwifty
//
//  Created by 董招兵 on 2017/8/6.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation

public extension String {

    /// 截取字符串到某个位置
    @discardableResult
    public func subString(to index :Int) -> String? {
        if index > self.count { return nil }
        let text : String                       = self
        let startIndex : String.Index           = text.startIndex
        let subIndex : String.Index             = text.index(startIndex, offsetBy: index)
        
        return text.substring(to: subIndex)
    }

    /// 从某个位置开始截取字符串
    @discardableResult
    public func subString(from index : Int) -> String? {
        if index > self.count { return nil }
        let text : String                       = self
        let startIndex : String.Index           = text.startIndex
        let subIndex : String.Index             = text.index(startIndex, offsetBy: index)
        return text.substring(from: subIndex)
    }

    /// 从某个范围截取字符串 比如 2这个位置 截取 3个长度
    @discardableResult
    public func subString(from range : FoundationRange) -> String? {
        if  let range                       = rangeIndex(from: range) {
            return self.substring(with: range)
        } else {
            return nil
        }
    }

    @discardableResult
    fileprivate func rangeIndex(from range : FoundationRange) -> Range<String.Index>? {

        guard range.location <= self.length else { return nil }
        guard range.sum <= self.length else { return nil }

        let startIndex                  = self.index(self.startIndex, offsetBy: range.location)
        let endIndex                    = self.index(startIndex, offsetBy: range.length)
        let range                       = Range<String.Index>(startIndex..<endIndex)

        return range
    }

}

// MARK: - Encode

public extension  String {

    @discardableResult
    public func base64StringToData() -> Data? {
        return Data(base64Encoded: self)
    }

    @discardableResult
    public func base64Encoding() -> String? {
        let data = self.data(using: .utf8, allowLossyConversion: true)
        if let base64String  = data?.base64EncodedString() {
            return base64String
        } else {
            return nil
        }
    }

    @discardableResult
    public func base64Decoding() -> String? {
        if let data = base64StringToData()  {
            return String(data: data, encoding: .utf8)
        } else {
            return nil
        }
    }

    // md5加密
    public var md5String : String {
        get {
            return self.md5()
        }
    }
    // md5加密
    @discardableResult
    public func md5() -> String {
        let md5Str = SKStringProxy(proxy: self)
        return md5Str.md5
    }

}

// MARK: - Int Float
public extension String {

    public var length : Int {
        get {
            return self.count
        }
    }

    public var boolValue : Bool {
        get {
            switch self {
            case "true" , "1":
                return true
            case "false","0" :
                return false
            default:
                return false
            }
        }
    }

    public var doubleValue: Double {
        get {
            return Double(self) ?? 0.00
        }
    }

    public var intValue : Int {
        get {
            return Int(self) ?? 0
        }
    }

    public var floatValue : Float {
        get {
            return Float(self) ?? 0.00
        }
    }

    /// 检查字符串是否是0-9的数字
    public var numberValue : Bool {
        get {
            let number                      = "^[0-9]*$"
            let regextestmobile             = NSPredicate(format:"SELF MATCHES %@",number)
            let isNumber                    = regextestmobile.evaluate(with: (self))
            print(isNumber)
            return isNumber
        }
    }

    /// 版本号转成整型
    public var versionValue :  Int {
        get {
            let version = replacingOccurrences(of: ".", with: "")
            return version.intValue
        }
    }

}


// MARK: - JSON

public extension String {

    /// json 字符串转成 Array
    @discardableResult
    public func  arrayValue() -> [Any] {
        let jsonObject = jsonValue()
        if let jsonArray = jsonObject  {
            return (jsonArray as! Array)
        } else {
            return Array()
        }
    }

    /// json 字符串转成 JSON数据格式
    @discardableResult
    public func jsonValue() -> Any? {
        let data            = self.data(using: .utf8, allowLossyConversion: true)
        let jsonObject      = data?.jsonValue()
        return jsonObject
    }

    /// json 字符串转成 Dictionary
    @discardableResult
    public func dictionaryValue() -> [String : Any] {
        let jsonObject          = jsonValue()
        if let jsonArray        = jsonObject  {
            return (jsonArray as! Dictionary)
        } else {
            return Dictionary()
        }
    }


}
