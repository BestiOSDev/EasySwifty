//
//  Easy+ScrollView.swift
//  EaseSwifty
//
//  Created by 董招兵 on 2017/8/6.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation
import UIKit

public extension UIScrollView {

    public enum ScrollDirection {
        case top
        case left
        case bottom
        case right
    }

    public func scrollTo(direction value : ScrollDirection , animated : Bool) {

        var offset : CGPoint = self.contentOffset
        switch value {
        case .top:
            offset.y = 0 - self.contentInset.top
            break
        case .left :
            offset.x = 0 - self.contentInset.left
            break
        case .bottom :
            offset.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom
            break
        case .right :
            offset.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right
            break
        }

        setContentOffset(offset, animated: animated)

    }
}


