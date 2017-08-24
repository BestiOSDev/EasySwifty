//
//  Easy+Data.swift
//  EaseSwifty
//
//  Created by 董招兵 on 2017/8/6.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation

public protocol ValidJSONObject {
    associatedtype JSONObjectType
    init(json value :Self.JSONObjectType)
}

extension Dictionary : ValidJSONObject {
    public typealias JSONObjectType = Dictionary
    public init(json value: JSONObjectType) {
        self = value
    }
}

extension Array : ValidJSONObject {
    public typealias JSONObjectType = Array
    public init(json value: JSONObjectType) {
        self = value
    }
}

// MARK: - Data
public extension Data {

    /// json 字符串转成 Array
    @discardableResult
    public func  arrayValue() -> [Any] {
        if let jsonArray = jsonValue()  {
            return (jsonArray as!  Array)
        } else {
            return  Array()
        }
    }

    /// json 字符串转成 Dictionary
    @discardableResult
    public func dictionaryValue() -> Dictionary<String, Any> {
        if let jsonDictionay = jsonValue()  {
            return (jsonDictionay as! Dictionary)
        } else {
            return Dictionary()
        }
    }

    /// 将 data 转成 String 类型
    @discardableResult
    public func stringValue() -> String? {
        return String(data: self, encoding: .utf8)
    }

    /// 对 data base64编码 多用于上传二进制文件
    @discardableResult
    public func dataToBase64Sting() -> String {
        return base64EncodedString(options: [])
    }

    /// 转成 json
    @discardableResult
    public func jsonValue() -> Any? {
        let json = try? JSONSerialization.jsonObject(with: self, options: .allowFragments)
        return json
    }

    /// 支持 Array Dictionary 转 Data
    @discardableResult
    public static func dataWithObject<T : ValidJSONObject>(_ object : T) -> Data? {

        if !JSONSerialization.isValidJSONObject(object) { return nil }
        let data = try? JSONSerialization.data(withJSONObject: object, options: JSONSerialization.WritingOptions.prettyPrinted)

        return data
    }

}

