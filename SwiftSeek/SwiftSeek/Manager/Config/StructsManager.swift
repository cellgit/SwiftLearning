//
//  StructsManager.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/3/1.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

struct SWNetworkParamsStruct {
    var url: String = ""
    var dict = [String : Any]()
    var method = HTTPMethod.post
}
/// 数据解析成功后传递数据时用到的 Struct
/// 用法：success(SWSucceedParamsStruct.init(array: array, json: json))
/// 注:array或json不需要传递可以设置为nil, array设置为 nil,在遵守协议时不要强行解包
struct SWSucceedParamsStruct<T> {
    var array = [T]()
    var json: JSON = JSON()
}

/// 需要解析多个模型的用这个 Struct
/// 用法: success(SWSucceedMultiParamsStruct.init(array: [array, infoArray], json: json))
struct SWSucceedMultiParamsStruct<T> {
    var array = [[T]()]
    var json: JSON = JSON()
}


//struct SWDictStruct {
//    var dict = [String: Any]()
//}

struct SWDictStruct {
    var dict = [String: String]()
}

struct SWCellTitleStruct {
    var title: String = ""
    var subtitle: String = ""
    var imgName: String = ""
    var identifier: String = ""
}
struct SWCellSectionDataStruct {
    var sctTitle = ""
    var sctArray = [SWCellTitleStruct]()
    var sctIdentifier = ""
}

struct SWTableSectionDataStruct {
    var sctTitle = ""
    var sctArray = [SWTableDataStruct]()
    var sctIdentifier = ""
}

struct SWTableDataStruct {
    var title = ""
    var imgName = ""
    var identifier = ""
}

// UITableView 列表的数据 struct, 无image
struct SWTableViewDataStruct {
    var title = ""
    var identifier = ""
}


/// 定义通知、广播名:

/*
 Useage:
 NotificationCenter.default.post(name: SWNotificationHelper.AlipayResuleNotification, object: nil)
 
 添加观察者
 NotificationCenter.default.addObserver(self, selector: #selector(alipayResultCallBackAction) , name: SWNotificationHelper.AlipayResuleNotification, object: nil)
 
 
 /// 传值
 NotificationCenter.default.post(name: SWNotificationHelper.SWCommentResultNotification, object: self, userInfo: ["name" : self.reGeocode?.poiName ?? ""])
 
 func addNotification() {
 NotificationCenter.default.addObserver(self, selector: #selector(showMessageNumber(noti:)), name: SWNotificationHelper.SWMessageNumberNotification, object: nil)
 }
 
 @objc func showMessageNumber(noti:Notification) {
 guard noti.userInfo != nil else { return }
 let messageNumStr = noti.userInfo!["num"] as! String
 let messageNum: Int = String.sw_stringToInt(string: messageNumStr)
 self.tabBarController?.tabBar.showBadgeOnItmIdx(idx: 1, count: messageNum)
 }
 
 */


struct NotificationHelper {
    /// 打开相册和相机的通知
    static let SWOpenPhotosLibraryNotification = Notification.Name("SWOpenPhotosLibraryNotification")
    static let SWPreviewPhotosNotification = Notification.Name("SWPreviewPhotosNotification")
    
    static let SWPreviewImagePhotosNotification = Notification.Name("SWPreviewImagePhotosNotification")
    static let SWUpdateConstrainsNotification = Notification.Name("SWUpdateConstrainsNotification")
    /// 选择的的照片发生变化的标识符
    static let SWPhotosShowingChangedNotification = Notification.Name("SWPhotosShowingChangedNotification")
    
    /// 提问问题提交成功的通知标识符
    static let SWCommitSucceedNotification = Notification.Name("SWCommitSucceedNotification")
    /// 登录成功的通知标识符
    static let SWLoginSucceedNotification = Notification.Name("SWLoginSucceedNotification")
}
