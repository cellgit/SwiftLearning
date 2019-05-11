//
//  EntryPresenter.swift
//  SwiftSeek
//
//  Created by 刘宏立 on 2019/5/11.
//  Copyright © 2019 liuhongli. All rights reserved.
//

import UIKit

class EntryPresenter: NSObject {
    var model: SWModelProtocal!
    var containerView: SWViewProtocol!
    
    override init() {
        super.init()
    }
    
    convenience init(model: HotkeysModel, containerView: EntryView) {
        self.init()
        self.model = model
        self.containerView = containerView
    }
    
    func gotoRequestCommunityData(params: SWNetworkParamsStruct) {
        self.model.requestData(params: params, isEncrypting: false, success: { (data) in
            self.containerView.showView(data: data)
        }, failure: { (error) in
            print("数据请求失败 ==== \(error)")
        }) {
            print("数据请求完成")
        }
    }
}
