//
//  HotkeysModel.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/3/1.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit
import SwiftyJSON

class HotkeysModel: NSObject {
    var id: String = ""
    var hotkey: String = ""
    var function: String = ""
}

extension HotkeysModel : SWModelProtocal {
    func requestData(params: SWNetworkParamsStruct, isEncrypting: Bool, success: @escaping SWSucceedTypealias, sendError: @escaping SWErrorTypealias) {
        Theme.shared.request(method: params.method, path: params.url, parameters: params.dict, isEncrypting: isEncrypting, success: { (responseObject) in
            
            let json = JSON(responseObject!)
            print("json ======= \(json)")
            var array = [HotkeysModel]()
            let dataArr = json.arrayValue
            for item in dataArr {
                let model = HotkeysModel()
                model.id = item["id"].stringValue
                model.hotkey = item["hotkey"].stringValue
                model.function = item["function"].stringValue
                array.append(model)
            }
            success(SWSucceedParamsStruct.init(array: array, json: json))
        }) { (error) in
            sendError(error)
            print("\(self.description)DataError:\(error)")
        }
    }
}
