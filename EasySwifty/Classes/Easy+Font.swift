//
//  Easy+Font.swift
//  MiaoTuProject
//
//  Created by dzb on 2019/6/29.
//  Copyright © 2019 大兵布莱恩特. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    class func systemFont(ofSize fontSize: CGFloat, weight: MTFontWeight) -> UIFont {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: fontSize, weight: UIFont.Weight(weight))
        } else {
            return UIFont.systemFont(ofSize: fontSize)
        }
    }
    
    class func fontWithName(name fontName: PingFangFontName, size fontSize: CGFloat) -> UIFont? {
        return UIFont(name: fontName, size: fontSize)
    }
    
}
