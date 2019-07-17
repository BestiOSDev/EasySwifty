//
//  Easy+UIImage.swift
//  EaseSwifty
//
//  Created by 董招兵 on 2017/8/6.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIImage

extension UIImage {

    /// 调整图片的方向
    func normalizedImage() -> UIImage {

        if self.imageOrientation == UIImage.Orientation.up {
            return self
        }
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale);
        self.draw(in: CGRect(x: 0.0, y: 0.0, width: self.size.width, height: self.size.height))
        let img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return img!
    }

//    func cirleImage() -> UIImage {
//
//        // NO代表透明
//        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
//        // 获得上下文
//        let  ctx = UIGraphicsGetCurrentContext()
//
//        // 添加一个圆
//        let  rect = CGRect(x: 0, y : 0, width : self.size.width, height: self.size.height);
//        ctx!.addEllipse(in: rect);
//
//        // 裁剪
//        ctx?.clip();
//
//        // 将图片画上去
//        self.draw(in: rect)
//
//        let cirleImage = UIGraphicsGetImageFromCurrentImageContext();
//
//        UIGraphicsEndImageContext();
//
//        return cirleImage!
//
//
//    }

    /// 通过一个 UIColor 生成一个 UIImage
    @discardableResult
    class func imageWithColor(_ color: UIColor) -> UIImage {
        let rect:CGRect          = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context:CGContext    = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image:UIImage        = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext()
        return image

    }



}
