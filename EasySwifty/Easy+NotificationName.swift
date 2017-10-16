//
//  Easy+NotificationName.swift
//  CoderLife
//
//  Created by Bryant on 2017/8/24.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation

public enum NotificationType : String {
    case loginSuccess  = "LoginSuccessName"
}

public extension NotificationName {
    /// 用户登录成功的通知
    public static var login : NotificationName {
        return NotificationName(type: .loginSuccess)
    }
}

extension NotificationName  {
    public typealias LiteralType = NotificationType
    public init(type value: LiteralType) {
        self = NotificationName(value.rawValue)
    }
}

