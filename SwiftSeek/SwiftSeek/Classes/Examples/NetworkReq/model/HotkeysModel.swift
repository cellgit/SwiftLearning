//
//  HotkeysModel.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/3/1.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit
import SwiftyJSON
import PromiseKit

struct HotkeysModel {
    /// id
    var id: String = ""
    /// 快捷键
    var hotkey: String = ""
    /// 功能描述
    var function: String = ""
}

extension HotkeysModel : SWModelProtocal {
    func requestData(params: SWNetworkParamsStruct, isEncrypting: Bool, success: @escaping SWSucceedTypealias, failure: @escaping Failure, finally: @ escaping Finished){
//        Theme.shared.request(method: params.method, path: params.url, parameters: params.dict, isEncrypting: isEncrypting, success: { (responseObject) in
//
//
//
//            let json = JSON(responseObject!)
//            print("json ======= \(json)")
//            var array = [HotkeysModel]()
//            let dataArr = json.arrayValue
//            for item in dataArr {
//                var model = HotkeysModel()
//                model.id = item["id"].stringValue
//                model.hotkey = item["hotkey"].stringValue
//                model.function = item["function"].stringValue
//                array.append(model)
//            }
//            success(SWSucceedParamsStruct.init(array: array, json: json))
//        }) { (error) in
//            sendError(error)
//            print("DataError:\(error)")
//        }
        
        
        Theme.shared.request(method: params.method, path: params.url, parameters: params.dict, isEncrypting: isEncrypting, success: { (responseObject) in
            let json = JSON(responseObject!)
            print("json ======= \(json)")
            var array = [HotkeysModel]()
            let dataArr = json.arrayValue
            for item in dataArr {
                var model = HotkeysModel()
                model.id = item["id"].stringValue
                model.hotkey = item["hotkey"].stringValue
                model.function = item["function"].stringValue
                array.append(model)
            }
            success(SWSucceedParamsStruct.init(array: array, json: json))
        }, failure: { (error) in
            failure(error)
        }) {
            finally()
        }
        
        
        
    }
}
