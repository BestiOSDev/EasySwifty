//
//  Easy+Storyboard.swift
//  CoderLife
//
//  Created by Bryant on 2017/8/24.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import Foundation
import UIKit

public enum EasyStoryBoard : String {
    case main        = "Main"
    case home        = "Home"
    case life        = "Life"
    case login       = "LoginRegist"
    case profile     = "Profile"
}

public extension UIStoryboard {
    
    public class var main : UIStoryboard {
        return UIStoryboard(name: EasyStoryBoard.main.rawValue, bundle: Bundle.main)
    }
    public class var home : UIStoryboard {
        return UIStoryboard(name: EasyStoryBoard.home.rawValue, bundle: Bundle.main)
    }
    public class var life : UIStoryboard {
        return UIStoryboard(name: EasyStoryBoard.life.rawValue, bundle: Bundle.main)
    }
    public class var login : UIStoryboard {
        return UIStoryboard(name: EasyStoryBoard.login.rawValue, bundle: Bundle.main)
    }
    public class var profile : UIStoryboard {
        return UIStoryboard(name: EasyStoryBoard.profile.rawValue, bundle: Bundle.main)
    }
    public  func viewController<T>(withIdentifier identifier: String) -> T {
        return instantiateViewController(withIdentifier: identifier) as! T
    }

}

