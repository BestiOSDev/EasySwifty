//
//  EasyDataManager.swift
//  MiaoTuProject
//
//  Created by dzb on 2019/7/4.
//  Copyright © 2019 大兵布莱恩特. All rights reserved.
//

import Foundation

//
//func loadMoreData<T>(_ content : [[String : Any]],pageNo : Int, scrArray : inout [T], completionHandler : @escaping (_ dictionary : [String : Any])->T) {
//    var temp : [T] = [T]()
//    var location = scrArray.count
//    var indexPaths : [IndexPath] = [IndexPath]()
//    for i in 0..<content.count {
//        let dict = content[i]
//        let object = completionHandler(dict)
//        temp.append(object)
//        if (pageNo > 1) {
//            let indexPath = IndexPath(row: location, section: 0)
//            indexPaths.append(indexPath)
//            location += 1
//        }
//    }
//    if pageNo == 1 {
//        scrArray.removeAll()
//        scrArray.append(contentsOf: temp)
//        self.reloadData()
//    } else {
//        scrArray.append(contentsOf: temp)
//        self.beginUpdates()
//        self.insertRows(at: indexPaths, with: .automatic)
//        self.endUpdates()
//    }
//    if temp.count < 10 {
//        let _ = self.mj_footer?.endRefreshingWithNoMoreData()
//    }
//}
