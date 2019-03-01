//
//  SketchHotkeysPresenter.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/3/1.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit

class SketchHotkeysPresenter: NSObject {
    var model: SWModelProtocal!
    var containerView: SWViewProtocol!
    
    override init() {
        super.init()
    }
    
    convenience init(model: HotkeysModel, containerView: SketchHotkeysView) {
        self.init()
        self.model = model
        self.containerView = containerView
    }
    
    func gotoRequestCommunityData(params: SWNetworkParamsStruct) {
        self.model.requestData(params: params, isEncrypting: false, success: { (data) in
            self.containerView.showView(data: data)
        }) { (error) in
            print("数据请求失败 ==== \(error)")
        }
    }
}
