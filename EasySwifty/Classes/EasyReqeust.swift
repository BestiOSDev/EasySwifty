//
//  EasyReqeust.swift
//  MiaoTuProject
//
//  Created by dzb on 2019/7/4.
//  Copyright © 2019 大兵布莱恩特. All rights reserved.
//

import Foundation
//import SwiftyJSON
//import Alamofire
//
//
//class EasyResult {
//    var errorMsg : String = "未知错误"
//    var error : NSError? {
//        didSet {
//            errorMsg = error?.localizedDescription ?? "未知错误"
//        }
//    }
//    var dictionary : JSON = JSON()
//    var array : [JSON] =  [JSON]()
//    var stringValue : String = ""
//    var statusCode : Int = 0
//    var data : [String : Any]?
//    
//}
//
//class EasyRequest  {
//    
//    static var shared : EasyRequest = {
//        let manager = EasyRequest()
//        return manager;
//    }()
//    
//    fileprivate let sessionManager : SessionManager = SessionManager.default
//    lazy fileprivate var HTTPHeaders : [String : Any] = {
//        var paramerts = [String : Any]()
//        if let app_Version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] {
//            paramerts["api_version"] = app_Version
//        }
//        paramerts["modelType"] = "iOS"
//        paramerts["app_key"] = "1001"
//        paramerts["device_type"] = "4"
//        paramerts["Content-Type"] = "application/json;charset=UTF-8"
//        return paramerts
//    }()
//    
//    typealias EasyReqeustSuccess = (_ responseObject : EasyResult) -> Void
//    static func get(_ URLString : String,parameters : [String : Any]?,completionHandler : @escaping EasyReqeustSuccess) {
//        EasyRequest.shared.reqeustWithURL(URLString, parameters: parameters, httpMethod: .get, completionHandler: completionHandler)
//    }
//    
//    static func post(_ URLString : String,urlParams : Bool,parameters : [String : Any]?,completionHandler : @escaping EasyReqeustSuccess) {
//        let string = getParameterString(parameters ?? [:])
//        let method : String = urlParams ? "\(URLString)?\(string)" : URLString
//        EasyRequest.shared.reqeustWithURL(method, parameters: urlParams ? nil : parameters, httpMethod: .post, completionHandler: completionHandler)
//    }
//    
//    /// 拼接URL参数
//    fileprivate static func getParameterString(_ paramters : [String : Any]) -> String{
//        guard !paramters.isEmpty else {
//            return ""
//        }
//        let keys = paramters.keys.sorted { (str1, str2) -> Bool in
//            return false
//        }
//        var paraString : String = ""
//        let parameterCount : Int = keys.count
//        for i in 0..<parameterCount {
//            let key = keys[i]
//            if i != 0 {
//                paraString.append("&")
//            }
//            let value = paramters[key]
//            paraString.append(key)
//            paraString.append("=")
//            paraString.append("\(value!)")
//        }
//        let characterSet = CharacterSet.urlQueryAllowed
//        return paraString.addingPercentEncoding(withAllowedCharacters: characterSet) ?? ""
//    }
//    
//    fileprivate  func authBase64String(token : String) -> String {
//        var dict = [String : Any]()
//        dict["authorization_code"] = token
//        if let username : String = YVRealmHelper.shared.userAuthorization?.username {
//            dict["user_name"] = username
//        }
//        let data : Data = try! JSONSerialization.data(withJSONObject: dict, options: [.prettyPrinted])
//        let base64 : String = data.base64EncodedString()
//        return base64
//    }
//    
//    fileprivate  func appendHTTPHeaders() {
//        if let token = YVRealmHelper.shared.userAuthorization?.token {
//            self.HTTPHeaders.set(object: token, forKey: "token")
//            let authorization : String = authBase64String(token: token)
//            self.HTTPHeaders.set(object: authorization, forKey: "Authorization")
//        }
//        let timeStamp : TimeInterval = Date().timeIntervalSince1970 * 1000
//        let localTime = ("\(timeStamp)" as NSString).aci_encrypt()
//        self.HTTPHeaders.set(object: localTime, forKey: "verger")
//    }
//    
//    fileprivate  func printReqeustParams(_ URLString : String,parameters : [String : Any]?) {
//        if isDebugMode() {
//            let headerDict = self.HTTPHeaders
//            NJLog("请求头 : \n \(headerDict) \n ")
//            let url : String = "total url:  \(URLString) \n "
//            NJLog(url)
//            if let dict = parameters {
//                NJLog("请求参数 : \n  \(dict) \n ")
//            }
//        }
//    }
//    
//    /// 打印请求结果内容到控制台
//    fileprivate static func printResponseData(_ json : JSON?, method : String) {
//        if let dict = json {
//            if isDebugMode() {
//                var jsonString = dict.rawString() ?? ""
//                if jsonString.contains("\\") {
//                    jsonString = jsonString.replacingOccurrences(of: "\\", with: "")
//                }
//                if jsonString.contains("\\/") {
//                    jsonString = jsonString.replacingOccurrences(of: "\\/", with: "/")
//                }
//                NJLog("method = \(method) res = \(jsonString)")
//            }
//        }
//    }
//    
//    fileprivate func reqeustWithURL(_ URLString : String,parameters : [String : Any]?,httpMethod : HTTPMethod,completionHandler : @escaping EasyReqeustSuccess) {
//        appendHTTPHeaders()
//        let service = "\(String(describing: ServerConfig.httpServer))\(URLString)"
//        ///打印请求参数到控制台
//        printReqeustParams(service, parameters: parameters)
//        
//        EasyRequest.shared.sessionManager.request(service, method: httpMethod, parameters: parameters, encoding: URLEncoding.default, headers: self.HTTPHeaders as? HTTPHeaders).responseData { (response) in
//            if response.result.isSuccess { ///请求成功
//                
//                if let data = response.result.value {
//                  
//                    let object = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any]
//                    var json : JSON?
//                    if object == nil { //转json失败后尝试用jsonstring 处理
//                        let jsonString = String(data: data, encoding: .utf8)
//                        json = JSON(parseJSON: jsonString ?? "")
//                    } else {
//                        json = JSON(object ?? [:])
//                    }
//                    //打印请求结果
//                    EasyRequest.printResponseData(json, method: response.request?.url?.absoluteString ?? "")
//                    let errorNo : Int = json?["errorNo"].intValue ?? 500
//                    let resultModel = EasyResult()
//                    if errorNo == 0 { //请求结果正常
//                        if let content = json?["content"].dictionary  {
//                            resultModel.dictionary = JSON(content)
//                        }
//                        if let content = json?["content"].array {
//                            let obj = content
//                            resultModel.array = obj
//                        }
//                        if let content = json?["content"].string {
//                            resultModel.stringValue = content
//                        }
//                        resultModel.data = object
//                    } else { ///请求结果出错
//                        let errorMessage : String = json?["errorContent"].stringValue ?? "请求错误,请稍后再试"
//                        MBProgressHUD.showOnlyText(errorMessage, view: UIApplication.shared.keyWindow)
//                        let error = NSError(domain: errorMessage, code: errorNo, userInfo: nil)
//                        resultModel.error = error
//                    }
//                    resultModel.statusCode = errorNo
//                    completionHandler(resultModel)
//                } else {
//                    let resultModel = EasyResult()
//                    resultModel.error = response.result.error as NSError?
//                    resultModel.statusCode = resultModel.error?.code ?? 500
//                    completionHandler(resultModel)
//                }
//                
//            } else {
//                let resultModel = EasyResult()
//                resultModel.error = response.result.error as NSError?
//                resultModel.statusCode = resultModel.error?.code ?? 500
//                completionHandler(resultModel)
//            }
//        }
//    
//        
//    }
//    
//}
//
//
//
//
//
//
//
