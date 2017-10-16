//
//  Easy+Foundation.swift
//  EasySwifty
//
//  Created by 董招兵 on 2017/8/5.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation
import UIKit

extension URL  {
    public typealias StringLiteralType = String
    public init(_ value: StringLiteralType) {
        self = URL(string: value)!
    }
}

extension UIImage {
    public typealias StringLiteralType = String
    public class func imageNamed(_ name : StringLiteralType?) -> UIImage? {
        guard let _ = name else {
            return nil
        }
        return UIImage(named: name!)
    }
}


