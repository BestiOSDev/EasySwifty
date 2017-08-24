//
//  Easy+Basic.swift
//  EasySwifty
//
//  Created by 董招兵 on 2017/8/5.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import UIKit
import Foundation

//MARK:  Array String 截取使用的 Range
public struct FoundationRange {

    public var location : Int  = NSNotFound
    public var length   : Int  = NSNotFound
    public init(_ location : Int , _ length : Int) {
        self.location       = location
        self.length         = length
    }
    public var sum : Int {
        get {
            return location+length
        }
    }
    public var NotFound : Bool {
        get {
            return (self.location != NSNotFound || self.length != NSNotFound)
        }
    }
}


// MARK: - Date

public extension Date {

    @discardableResult
    public static func dateFormatterTimeInterval(_ timeInterval : Double,tiemFormatter : String) -> String {
        let date                = Date(timeIntervalSince1970: timeInterval)
        let formatter           = DateFormatter()
        formatter.dateFormat    = tiemFormatter
        return  formatter.string(from: date as Date)
    }

}

public extension Int {

    func myStride(to end : Int , by length : Int,task : (_ index : Int) -> Void) {
        for i in Swift.stride(from: self, to: end, by: length) {
            print(i)
        }
    }

    func myStride(through end : Int , by length : Int,task : (_ index : Int) -> Void) {
        for i in Swift.stride(from: self, through: end, by: length) {
            print(i)
        }
    }

}
