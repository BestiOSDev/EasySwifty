//
//  Easy+String.swift
//  EaseSwifty
//
//  Created by 董招兵 on 2017/8/6.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation

public extension String {
        
    subscript (bounds: Range<Int>) -> String {
        let startIndex = bounds.startIndex
        let endIndex = bounds.endIndex
        let range = FoundationRange(startIndex, endIndex)
        return self.subString(with: range)
    }
    
    /// 截取字符串到某个位置
    @discardableResult
     func subString(to index :Int) -> String {
        if index > self.count {
            fatalError("\n Index \(index) out of bounds; string length \(self.length) \n")
        }
        let text : String = self
        let startIndex : String.Index = text.startIndex
        let subIndex : String.Index = text.index(startIndex, offsetBy: index)
        let subString = text[startIndex..<subIndex]
        return String(subString)
    }
    
    /// 从某个位置开始截取字符串
    @discardableResult
     func subString(from index : Int) -> String {
        if index > self.count {
            fatalError("\n Index \(index) out of bounds; string length \(self.length) \n")
        }
        let text : String = self
        let startIndex : String.Index = text.startIndex
        let subIndex : String.Index = text.index(startIndex, offsetBy: index)
        let subString = text[subIndex..<text.endIndex]
        return String(subString)
    }
    
    /// 从某个范围截取字符串 比如 2这个位置 截取 3个长度
    @discardableResult
     func subString(with range : FoundationRange) -> String {
        if let range = rangeIndex(with: range) {
            let text : String = self
            let subString = text[range]
            return String(subString)
        } else {
            return ""
        }
    }
    
    @discardableResult
    fileprivate func rangeIndex(with range : FoundationRange) -> Range<String.Index>? {
        guard range.location <= self.length else {
            fatalError("\n range.location \(range.location) out of bounds; string length \(self.count) \n")
        }
        guard range.sum <= self.length else {
            fatalError("\n range.location + range.length \(range.location+range.length) out of bounds; string length \(self.count) \n")
        }
        if let range = Range(NSMakeRange(range.location, range.length), in: self) {
            return range
        } else {
            return nil
        }
    }
    
}

// MARK: - Encode

public extension  String {
    
    @discardableResult
    func base64StringToData() -> Data? {
        return Data(base64Encoded: self)
    }
    
    @discardableResult
    func base64Encoding() -> String? {
        let data = self.data(using: .utf8, allowLossyConversion: true)
        if let base64String  = data?.base64EncodedString() {
            return base64String
        } else {
            return nil
        }
    }
    
    @discardableResult
    func base64Decoding() -> String? {
        if let data = base64StringToData()  {
            return String(data: data, encoding: .utf8)
        } else {
            return nil
        }
    }
    
}

// MARK: - Int Float
public extension String {
    
    var length : Int {
        get {
            return self.count
        }
    }
    
    var boolValue : Bool {
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
    
    var doubleValue: Double {
        get {
            return Double(self) ?? 0.00
        }
    }
    
    var intValue : Int {
        get {
            return Int(self) ?? 0
        }
    }
    
    var floatValue : Float {
        get {
            return Float(self) ?? 0.00
        }
    }

    
}


// MARK: - JSON

public extension String {
    
    /// json 字符串转成 Array
    @discardableResult
    func  arrayValue() -> [Any] {
        let jsonObject = jsonValue()
        if let jsonArray = jsonObject  {
            return (jsonArray as! Array)
        } else {
            return Array()
        }
    }
    
    /// json 字符串转成 JSON数据格式
    @discardableResult
    func jsonValue() -> Any? {
        let data            = self.data(using: .utf8, allowLossyConversion: true)
        let jsonObject      = data?.jsonValue()
        return jsonObject
    }
    
    /// json 字符串转成 Dictionary
    @discardableResult
    func dictionaryValue() -> [String : Any] {
        let jsonObject          = jsonValue()
        if let jsonArray        = jsonObject  {
            return (jsonArray as! Dictionary)
        } else {
            return Dictionary()
        }
    }
    
    
}

extension NSAttributedString {
    
    class func string(with html : String) -> NSMutableAttributedString? {
        if let data = html.data(using: .utf8, allowLossyConversion:true) {
            let html = try? NSMutableAttributedString(data: data, options: [ .documentType : NSAttributedString.DocumentType.html.rawValue,.characterEncoding : String.Encoding.utf8.rawValue], documentAttributes: nil)
            return html
        } else {
            return nil
        }
    }
    
}
