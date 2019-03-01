//
//  ProtocolsManager.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/3/1.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit

/// 显示视图的协议: 数据请求成功后，通过此协议传递请求的数据，然后再视图显示
/*
 用法：
 1. presenter的请求成功的回调处: self.view.showView(data: data)
 2. view 的 extension 中遵守 SWViewProtocol
 3. view 协议方法内获取数据 let array = data.array as! [Model] 或 let json = data.json
 */
protocol SWViewProtocol {
    func showView(data: SWSucceedParamsStruct<Any>)
}
/// 显示视图的协议: 如果同一个View已经使用了 SWViewProtocol, 则再次使用展示协议时用 SWViewSecondProtocol ... ...
protocol SWViewSecondProtocol {
    func showViewSecond(data: SWSucceedParamsStruct<Any>)
}
protocol SWViewThirdProtocol {
    func showViewThird(data: SWSucceedParamsStruct<Any>)
}
protocol SWViewFourthProtocol {
    func showViewFourth(data: SWSucceedParamsStruct<Any>)
}
protocol SWViewFifthProtocol {
    func showViewFifth(data: SWSucceedParamsStruct<Any>)
}
protocol SWViewSixthProtocol {
    func showViewSixth(data: SWSucceedParamsStruct<Any>)
}
protocol SWViewSeventhProtocol {
    func showViewSeventh(data: SWSucceedParamsStruct<Any>)
}

/// 不需要解析的数据用此协议,通过设置标识符区分即可服用presenter
protocol SWViewUnparseProtocol {
    func showViewUnparse(data: SWSucceedParamsStruct<Any>)
}


/// 支付请求获取数据后展示 view 通过此协议
/// 用法: 同 SWViewProtocol
protocol SWPaymentViewProtocol {
    func showPaymentView(data: SWSucceedParamsStruct<Any>)
}

protocol SWMultiModelViewProtocol {
    func showView(data: SWSucceedMultiParamsStruct<Any>)
}
protocol SWMultiModelViewSecondProtocol {
    func showViewSecond(data: SWSucceedMultiParamsStruct<Any>)
}
protocol SWMultiModelViewThirdProtocol {
    func showViewThird(data: SWSucceedMultiParamsStruct<Any>)
}

//protocol SWMultiModelViewProtocol {
//    func showView(data: SWSucceedMultiParamsStruct<Any>)
//}


protocol SWActionDelegate {
    func sw_button_action(sender: UIButton)
}

protocol SWViewActionDelegate {
    func sw_view_action(view: UIView)
}


/// 传递一个字典的代理: 仅传递一个字典
protocol SWDictDelegate {
    func sw_dict_action(dict: [String:String])
}
/// 传递一个字典和按钮的代理
protocol SWDictActionDelegate {
    func sw_button_dict_action(sender: UIButton, dict: [String:String])
}

/// 传递一个字典和按钮的代理(Any)
protocol SWDictAnyActionDelegate {
    func sw_button_dict_any_action(sender: UIButton, dict: [String:Any])
}

/// UISwitch代理
protocol SWSwitchActionDelegate {
    func sw_switch_action(sender: UISwitch)
}


/// 传递字符串的代理
protocol SWTextDelegate {
    func sw_textViewAction(text: String)
}

@objc protocol SWTableViewRefreshDelegate {
    @objc optional func refreshNewDataAction()
    @objc optional func refreshMoreDataAction()
}


protocol SWModelProtocal {
    func requestData(params: SWNetworkParamsStruct, isEncrypting: Bool, success: @escaping SWSucceedTypealias, sendError:@escaping SWErrorTypealias)
}

protocol SWMultiModelProtocal {
    func requestData(params: SWNetworkParamsStruct, isEncrypting: Bool, success: @escaping SWSucceedMultiTypealias, sendError:@escaping SWErrorTypealias)
}


/// 模型的协议
protocol SWUploadImageModelProtocal {
    func requestData(params: SWNetworkParamsStruct, imgParams: [UIImage], isEncrypting: Bool, success: @escaping SWSucceedTypealias, sendError:@escaping SWErrorTypealias)
}

