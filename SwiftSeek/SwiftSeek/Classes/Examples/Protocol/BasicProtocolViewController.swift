//
//  BasicProtocolViewController.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/1/11.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit
import WebKit

class BasicProtocolViewController: UIViewController {
    
    var webUrl = ""
    
    var webView: WKWebView!
    
    var identifier: String = ""
    
    convenience init(identifier: String, url: String) {
        self.init()
        self.identifier = identifier
        self.webUrl = url
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupUI()
    }
    
    func setupUI() {
        webView = WKWebView.init(frame: CGRect(x: 0, y: 98, width: AppWidth, height: AppHeight - TabarHeight-98))
        view.addSubview(webView)
        let str = self.webUrl
        let url:URL = URL.init(string: str)!
        webView.load(URLRequest(url: url))
    }
    
    

}
