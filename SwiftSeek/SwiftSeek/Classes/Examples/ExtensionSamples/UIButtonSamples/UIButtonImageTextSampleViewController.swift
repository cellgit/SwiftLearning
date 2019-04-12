//
//  UIButtonImageTextSampleViewController.swift
//  SwiftSeek
//
//  Created by 刘宏立 on 2019/4/5.
//  Copyright © 2019 liuhongli. All rights reserved.
//

import UIKit

class UIButtonImageTextSampleViewController: UIViewController {
    
    let btnWidth: CGFloat = 200
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        setupUI()
    }
    

    func setupUI() {
        let btn = UIButton.init(type: .custom)
        
        btn.frame = CGRect.init(x: (UIScreen.main.bounds.size.width - btnWidth) / 2.0, y: btnWidth, width: btnWidth, height: 60)
        
        self.view.addSubview(btn)
        
        btn.setTitle("标题", for: .normal)
//        btn.setImage(UIImage.init(named: "emotarDog"), for: .normal)
        
        
//        btn.setImageForAllStates(UIImage.init(named: "emotarDog")!)
        
        btn.centerTextAndImage(spacing: 10)
        btn.backgroundColor = .lightGray
        
        
    }

}
