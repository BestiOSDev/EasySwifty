//
//  Easy+Array.swift
//  EaseSwifty
//
//  Created by 董招兵 on 2017/8/6.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation


public extension Array {

    public var jsonValue : String? {
        get {
            if let data     = Data.dataWithObject(self) {
                return data.stringValue()
            } else {
                return nil
            }
        }
    }

}

// MARK: - Safe Retrieve 读取数据
public extension Array where Element : Equatable {

    /// 安全获取数组中的元素
    public func safe(at index : Int) -> Element? {
        guard !isEmpty else { return nil }
        guard (index <= self.count - 1) else { return nil }
        return  self[index]
    }

    // 利用下标 通过 ArrayRange 从数组里截取子元素集合
    public subscript (range : FoundationRange) -> [Element] {
        var array        = [Element]()
        guard !isEmpty else { return array }
        if let _ = rangeIndex(from: range) {
            let subArr   = self[range.location..<range.sum]
            for obj in subArr.reversed() {
                array.append(obj)
            }
        }
        return array
    }

}

// MARK: - Safe Delete 移除数据
public extension Array where Element : Equatable {

    /// 移除数组下标的元素 安全判断不可越界
    public mutating func safe_remove(at index: Int) {
        guard !isEmpty else { return }
        guard (index <= self.count - 1) else { return }
        remove(at: index)
    }
    /// 移除数组中单个元素 根据元素
    public mutating func safe_remove(object : Element) {
        let array               = transformMutableArray()
        array.remove(object)
        self                    = array as! [Element]
    }
    /// 批量从数组中移除元素
    public  mutating func safe_remove(objects: [Element]) {
        for obj in objects {
            safe_remove(object: obj)
        }
    }
    /// 移除某个范围的数组元素
    public mutating func safe_remove(in range: FoundationRange) {
        if let  subRange  = rangeIndex(from: range) {
            removeSubrange(subRange)
        }
    }

}

//MARK: Array
public extension Array where Element : Equatable {

    /// 在数组某个位置插入一个元素
    public mutating func safe(insert object : Element ,at index:Int) {
        guard !isEmpty else { return }
        guard index <= self.count else { return }
        insert(object, at: index)
    }
    /// 替换数组某个下标的元素
    public mutating func safe(replace object : Element , at index : Int) {
        guard !isEmpty else { return }
        guard (index <= self.count - 1) else { return }
        self[index] = object
    }

    /// 在数组中间任意位置插入一个数组
    public mutating func safe(insert objects : [Element], at index : Int) {
        var i = index+1
        for obj in objects {
            self.safe(insert: obj, at: i)
            i+=1
        }
    }
    /// 在当前数组末尾追加元素
    public mutating func insert(from array : [Element]) {
        for obj in array {
            self.append(obj)
        }
    }
    /// 交换数组中任意两个元素下标位置的元素 安全判断越界抛异常
    public mutating func exchange(at idx1: Int, withObjectAt idx2: Int) {
        guard !isEmpty else { return }
        let array = transformMutableArray()
        if (idx1<=self.count-1 && idx2<=self.count-1 && idx2 != idx1) {
            array.exchangeObject(at: idx1, withObjectAt: idx2)
        }
        self = array as! [Element]
    }
    /// 截取子数组从原始数组中 如果越界返回 []数组
    public mutating  func subarray(with range: FoundationRange ) -> [Element]? {

        if let subRange = rangeIndex(from: range) {
            let start   = subRange.lowerBound
            let end     = subRange.upperBound
            var array   = [Element]()
            for index in start..<end {
                array.append(self[index])
            }
            return array
        } else {
            return nil
        }
    }

    /// 过滤掉数组中相同的元素
    public func filterTheSameElement() -> [Element] {
        // Array 元素去重 有好几种方法 如果对数组去重后元素顺序没要求的话 可以使用 Set
        let set = NSMutableSet(array: self)
        return set.allObjects as! [Element]
    }

    // 私有方法
    fileprivate  mutating func transformMutableArray() -> NSMutableArray {
        return NSMutableArray(array: self)
    }

    fileprivate func rangeIndex(from range : FoundationRange) -> Range<Index>? {
        guard !isEmpty else { return nil }
        let location                    = range.location
        let length                      = range.length
        guard location <= self.count else  {
            NJLog("\nlocation 越界\n")
            return nil
        }
        guard (range.sum <= self.count) else {
            NJLog("\nlocation + length 越界\n")
            return nil
        }
        let startIndex                  = self.index(self.startIndex, offsetBy:location)
        let endIndex                    = self.index(startIndex, offsetBy:length)
        let range                       = Range<Index>(startIndex..<endIndex)
        return range
    }

    /// 随机从数组中取出一个元素
    public func randomObject() -> Element? {
        guard !isEmpty else { return nil }
        let index = arc4random_uniform(UInt32(self.count))
        return self[Int(index)]
    }


}

