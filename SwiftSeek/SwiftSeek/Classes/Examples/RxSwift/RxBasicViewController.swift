//
//  RxBasicViewController.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/1/17.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxAtomic

class RxBasicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        demo1()
        
        demp2()
    }
    
    func demo1() {
        let disposeBag = DisposeBag()
        var count = 1
        let sequenceThatErrors = Observable<String>.create { observer in
            observer.onNext("🍎")
            observer.onNext("🍐")
            observer.onNext("🍊")
            
            if count == 1 {
//                observer.onError(TestError.test)
                
                print("Error encountered")
                count += 1
            }
            
            observer.onNext("🐶")
            observer.onNext("🐱")
            observer.onNext("🐭")
            observer.onCompleted()
            
            return Disposables.create()
        }
        
        sequenceThatErrors
            .retry()
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    
    func demp2() {
        print("--------------------------------------------")
        
        let disposeBag = DisposeBag()
        var count = 1
        
        let sequenceThatErrors = Observable<String>.create { observer in
            observer.onNext("🍎")
            observer.onNext("🍐")
            observer.onNext("🍊")
            
            if count < 5 {
//                observer.onError(TestError.test)
                print("Error encountered")
                count += 1
            }
            
            observer.onNext("🐶")
            observer.onNext("🐱")
            observer.onNext("🐭")
            observer.onCompleted()
            
            return Disposables.create()
        }
        
        sequenceThatErrors
            .retry(3)
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    

}
