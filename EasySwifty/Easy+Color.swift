//
//  Easy+Color.swift
//  EaseSwifty
//
//  Created by 董招兵 on 2017/8/6.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 颜色拓展类
public extension UIColor {

    // 根据 RGB 生成一个颜色,透明度是可以设置 0.0 ~ 1.0
    @discardableResult
    public class func RGBAColor(_ red : CGFloat ,green : CGFloat , blue : CGFloat,alpha : CGFloat) -> UIColor {
        return UIColor(red:(red/255.0), green: (green/255.0), blue: (blue/255.0), alpha: (alpha))
    }
    // 根据 RGB 生成一个颜色,透明度是1.0
    @discardableResult
    public class func RGBColor(_ red : CGFloat ,green : CGFloat , blue : CGFloat) -> UIColor {
        return RGBAColor(red, green: green, blue: blue, alpha: 1.0)
    }

    /// 生成一个随机色
    @discardableResult
    public class func RandomColor() -> UIColor {
        let red     = arc4random_uniform(255)
        let green   = arc4random_uniform(255)
        let blue    = arc4random_uniform(255)
        return RGBColor(CGFloat(red), green: CGFloat(green), blue: CGFloat(blue))
    }

    /// 根据一个字符串生成一个 UIColor 透明度 1.0
    @discardableResult
    public class  func colorWithHexString(_ hexString : String) -> UIColor {
        return colorWithHexString(hexString, alpha: 1.0)
    }

    /// 根据一个字符串生成一个 UIColor 透明度 0.0~1.0
    @discardableResult
    public class func colorWithHexString(_ hexString : String, alpha : CGFloat) -> UIColor {

        var cString:String  = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString         = cString.substring(from: cString.characters.index(cString.startIndex, offsetBy: 1))
        }
        if (cString.characters.count != 6) {
            return UIColor.gray
        }
        let rString         = cString.substring(to: cString.characters.index(cString.startIndex, offsetBy: 2))
        let gString         = cString.substring(from: cString.characters.index(cString.startIndex, offsetBy: 2)).substring(to: cString.characters.index(cString.startIndex, offsetBy: 2))
        let bString         = cString.substring(from: cString.characters.index(cString.startIndex, offsetBy: 4)).substring(to: cString.characters.index(cString.startIndex, offsetBy: 2))
        var r:CUnsignedInt  = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        return UIColor(red: CGFloat(r) / 255.0, green:CGFloat(g) / 255.0, blue:CGFloat(b) / 255.0, alpha:CGFloat(alpha))

    }


}

