//
//  NetworkPromiseViewController.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/2/20.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit
import PromiseKit

/// URLSession 的扩展

class NetworkPromiseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        /* 1，使用 Data Task 加载数据
         */
        
        ///（1）下面样例发起一个网络请求，并将请求结果打印出来：
        setupBasicNetwork()
        
        ///（2）下面样例同样是发起一个网络请求，不过这次我们将请求结果转换成对象。
        setupFetchData()
    }
    
    
    func setupFetchData() {
        //请求数据
//        fetchData(args: "foo=bar")
//            .done { data in
//                print("--- 请求结果 ---")
//                print(data)
//            }.catch { error in
//                print("--- 请求失败 ---")
//                print(error)
//        }
    }
    

    

}


extension NetworkPromiseViewController {
    
    func setupBasicNetwork() {
        //创建URL对象
        let urlString = "https://httpbin.org/get?foo=bar"
        let url = URL(string:urlString)
        
        //创建请求对象
        let request = URLRequest(url: url!)
        
        //请求数据
        _ = URLSession.shared.dataTask(.promise, with: request)
            .validate() //这个也是PromiseKit提供的扩展方法，比如自动将 404 转成错误
            .done { data, response in
                let str = String(data: data, encoding: String.Encoding.utf8)
//                print("--- 请求结果如下 ---")
                print(str ?? "")
        }
    }
    
    
//    //请求数据
//    func fetchData(args: String) -> Promise<Any>{
//        //创建URL对象
//        let urlString = "https://httpbin.org/get?\(args)"
//        let url = URL(string:urlString)
//        //创建请求对象
//        let request = URLRequest(url: url!)
//
//        //使用PromiseKit的URLSession扩展方法获取数据
//        return URLSession.shared.dataTask(.promise, with: request)
//            .validate() //这个也是PromiseKit提供的扩展方法，比如自动将 404 转成错误
//            .map {
//                //将请求结果转成对象
//                try JSONDecoder().decode(HttpBin.self, from: $0.data)
//        }
//    }
}


