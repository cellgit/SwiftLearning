//
//  Theme.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/3/1.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

//import Foundation
import UIKit
import Alamofire
import CommonCrypto
//import PromiseKit
//import SwiftyJSON

typealias  ReqSuccess = (_ responseObject: AnyObject?)->Void
typealias ReqError = (_ error: String)->Void

typealias Failure = (_ error: Error)->Void
typealias Finished = ()->Void


struct Theme {
    static let shared = Theme()
    // requet: default is post
    public func request(method: HTTPMethod, path: String, parameters: [String : Any], isEncrypting : Bool, success: @escaping ReqSuccess, failure: @escaping Failure, finally: @escaping Finished) {
        switch method {
        case .post:
            return self.postRequest(path: path, parameters: parameters, isEncrypting: isEncrypting, success: success, failure: failure, finally: finally)
        case .get:
            return self.getRequest(path: path, parameters: parameters, isEncrypting: isEncrypting, success: success, failure: failure, finally: finally)
        default:
            return self.postRequest(path: path, parameters: parameters, isEncrypting: isEncrypting, success: success, failure: failure, finally: finally)
        }
    }
}

private extension Theme {
    // post request
    private func postRequest(path: String, parameters: [String : Any], isEncrypting: Bool, success: @escaping ReqSuccess, failure: @escaping Failure, finally: @escaping Finished) {
        var headers = [String:String]()
        let token = UserInfo == nil ? "" : UserInfo!.token
        if isEncrypting {
            let  tiems = Theme().TimeInterval()
            headers = ["Content-Type":"application/json", "token":token,"timestamp" :tiems, "sign":Theme().MD5Action(tiems)]
        }else{
            headers = ["Content-Type":"application/json"]
        }
        print(headers)
        
        Alamofire.request(path, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .responseJSON()
            
            .done { str, rsp in
//                print("--- 请求结果 ---\(str)")
                success(str as AnyObject)
            }
            .catch { (error) in
                print("--- 请求失败 ---")
                failure(error)
            }.finally {
//                print("--- 请求完成 ---")
        }
    }
    
    // get request
    private func getRequest(path: String, parameters: [String : Any], isEncrypting: Bool, success: @escaping ReqSuccess, failure: @escaping Failure, finally: @escaping Finished){
        var headers = [String:String]()
        let token = UserInfo == nil ? "" : UserInfo!.token
        if isEncrypting {
            let  tiems = Theme().TimeInterval()
            headers = ["Content-Type":"application/json", "token":token,"timestamp" :tiems, "sign":Theme().MD5Action(tiems)]
        }else{
            headers = ["Content-Type":"application/json"]
        }
        
        Alamofire.request(path, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .responseJSON()
            .done { str, rsp in
//                print("--- 请求结果 ---")
//                print(str)
                if let results = rsp.request?.value {
                    success(results as AnyObject)
                }
            }
            .catch { (error) in
                print("--- 请求失败 ---")
                print(error)
            }.finally {
//                print("--- 请求完成 ---")
        }
    }
}

extension Theme {
    func TimeInterval() -> String{
        let date = Date()
        let timeInterval = date.timeIntervalSince1970 * 1000
        return String(format: "%.0f", timeInterval)
    }
    //MAPK : MD5加密
    func MD5Action(_ sender: Any)-> String {
        var token : String = ""
        if UserInfo != nil {
            token = (UserInfo != nil) ? UserInfo!.token : ""
        }
        let strDic = (sender as! String) +  "&" + token +  "&" + "12345"
        let str = self.md5String(strDic)
        return str.uppercased()
    }
    func md5String(_ str:String) -> String{
        let cStr = str.cString(using: String.Encoding.utf8);
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
}
