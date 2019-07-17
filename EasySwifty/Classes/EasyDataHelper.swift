//
//  EasyDataHelper.swift
//  MiaoTuProject
//
//  Created by dzb on 2019/7/4.
//  Copyright © 2019 大兵布莱恩特. All rights reserved.
//

import Foundation
//import SwiftyJSON
//
//protocol MTJSONCodable : class {
//     init(fromJson json: JSON!)
//}
//
//class EasyDataHelper<T :MTJSONCodable> {
//    let num : Int = 10
//    typealias EasyDataResponse = (data : [T],indexPaths : [IndexPath]?, noData : Bool)
//    
//    class func loadMoreData(_ jsonData : [JSON], startPage : Int,currentPage : Int, source :  [T]) -> EasyDataResponse {
//        var temp : [T] = [T]()
//        var dataArray = [T](source)
//        var location = source.count
//        let isRefresh : Bool = (startPage == currentPage)
//        var indexPaths : [IndexPath]? =  !isRefresh ? [IndexPath]() : nil
//        for i in 0..<jsonData.count {
//            let dict = jsonData[i]
//            let object = T(fromJson: dict)
//            temp.append(object)
//            if (!isRefresh) {
//                let indexPath = IndexPath(row: location,section: 0)
//                indexPaths?.append(indexPath)
//                location += 1
//            }
//        }
//        if isRefresh {
//            dataArray = temp
//        } else {
//            dataArray.append(contentsOf: temp)
//        }
//        let nodata : Bool = (temp.count < 10)
//        return (dataArray,indexPaths,nodata)
//    }
//    
//    static func loadMoreData(_ jsonData : [JSON], page : Int, source : [T]) -> EasyDataResponse {
//        return loadMoreData(jsonData, startPage: 1, currentPage: page, source: source)
//    }
//    
//}
//
