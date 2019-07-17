//
//  EasyShareSDK.swift
//  MiaoTuProject
//
//  Created by dzb on 2019/7/12.
//  Copyright © 2019 大兵布莱恩特. All rights reserved.
//

import UIKit
//import SwiftyJSON
//
//struct  EasyShareSDK  {
//    
//    static func share(with paramters : JSON,completionHandler: (()->Void)?) {
//        var shareImage : UIImage? = UIImage(named: "Icon-1024")
//        let title = paramters["title"].stringValue
//        let body = paramters["body"].stringValue
//        let url = paramters["url"].stringValue
//        let type = paramters["type"].int32Value
//        let cover = paramters["cover"].stringValue
//        if cover.count > 0 {
//            if let imageUrl : URL = URL(string: cover) {
//                if let data = try? Data(contentsOf: imageUrl) {
//                    shareImage = UIImage(data: data, scale: 0.5)
//                }
//            }
//        }
//        
//        var platformType = SSDKPlatformType.typeAny
//        if type == 1 {
//            platformType = SSDKPlatformType.typeWechat
//        } else if type == 2 {
//            platformType = SSDKPlatformType.typeQQ
//        } else if type == 3 {
//            platformType = SSDKPlatformType.subTypeWechatTimeline
//        } else if type == 4 {
//            platformType = SSDKPlatformType.typeSinaWeibo
//        }
//        
//        let parameters : NSMutableDictionary = NSMutableDictionary(capacity: 0)
//        parameters.ssdkSetupShareParams(byText: body, images: [shareImage!], url: URL(string: url), title: title, type: SSDKContentType.auto)
//        ShareSDK.share(platformType, parameters: parameters) { (state, userData, contentEntity, error) in
//            
//            switch state {
//            case SSDKResponseState.upload :
//                // 分享视频的时候上传回调，进度信息在 userData
//                break
//            case SSDKResponseState.success : do { //成功
//                completionHandler?()
//            }
//                break
//            case SSDKResponseState.fail : //失败
//                
//                break
//            case SSDKResponseState.cancel :  //取消
//                break
//            default :
//                
//                break
//            }
//            
//        }
//        
//    }
//    
//}
//
