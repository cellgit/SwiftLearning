//
//  FunctionalCoreImageViewController.swift
//  SwiftSeek
//
//  Created by 刘宏立 on 2019/3/31.
//  Copyright © 2019 liuhongli. All rights reserved.
//

import UIKit

/*
 “案例研究：封装 Core Image”
 
 Excerpt From: Chris Eidhof. “函数式 Swift.” Apple Books.
 */

class FunctionalCoreImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        let image = UIImage.init(named: "BeiJing")
        
        let image2 = UIKit.CIImage.init(image: image!)
        
//        let blurImage = Filter.blur(radius: 10)
        
        let blurImage = image2?.blur(radius: 10)
        
        
        
        
        
//        let ciImage = UIKit.CIImage(image:UIImage())
        
        
        
//        let iv2 = UIImageView.init(image: UIImage.init(ciImage: ciimg))
//        iv2.frame = CGRect(x: 100, y: 100, width: UIScreen.main.bounds.width - 200, height: (UIScreen.main.bounds.width - 200) * 0.62)
//
//        iv2.backgroundColor = UIColor.lightGray
//
//        self.view.addSubview(iv2)
        
    }
    
}

/// 1. 构建(滤镜)类型
typealias Filter = (CIImage) -> CIImage

/// 2. 构建滤镜

// 1. 简单的高斯模糊滤镜

//struct CIImage {
//    var x: Double
//
//}


//func blur(radius: Double) -> Filter {
//    return {image in
//        let parameters: [String: Any] = [kCIInputRadiusKey: radius,
//                                         kCIInputImageKey: image]
//        guard let filter = CIFilter(name: "CIGaussianBlur", parameters: parameters) else {
//            fatalError()
//        }
//        guard let outputImage = filter.outputImage else {
//            fatalError()
//        }
//        return outputImage
//    }
//}

extension CIImage {
    func blur(radius: Double) -> Filter {
        return {image in
            let parameters: [String: Any] = [kCIInputRadiusKey: radius,
                                             kCIInputImageKey: image]
            guard let filter = CIFilter(name: "CIGaussianBlur", parameters: parameters) else {
                fatalError()
            }
            guard let outputImage = filter.outputImage else {
                fatalError()
            }
            return outputImage
        }
    }
    
    func exchage(image: CIImage) -> CIImage {
        return image
    }
    
}





