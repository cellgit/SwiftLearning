//
//  EntryViewController.swift
//  SwiftSeek
//
//  Created by 刘宏立 on 2019/5/11.
//  Copyright © 2019 liuhongli. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    var containerView: EntryView!
    var presenter: EntryPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.title = "Sketch"
        
        setupNavBar()
        setupUI()
        reqData()
    }
    

    
    func setupNavBar() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        } else {
            // Fallback on earlier versions
        }
    }
    func setupUI() {
        self.containerView = EntryView.init(frame: UIScreen.main.bounds)
        self.view.addSubview(self.containerView)
        self.presenter = EntryPresenter.init(model: HotkeysModel(), containerView: self.containerView)
    }

}


extension EntryViewController {
    func reqData() {
        let dict = ["":""]
        let url = APIManager.baseUrl + API.SKETCH
        let params = SWNetworkParamsStruct.init(url: url, dict: dict, method: .post)
        self.presenter.gotoRequestCommunityData(params: params)
    }
}

