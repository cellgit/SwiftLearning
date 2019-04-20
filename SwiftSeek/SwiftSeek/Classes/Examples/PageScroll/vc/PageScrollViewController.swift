//
//  PageScrollViewController.swift
//  SwiftSeek
//
//  Created by 刘宏立 on 2019/4/20.
//  Copyright © 2019 liuhongli. All rights reserved.
//

import UIKit


let tagIndex: Int = 20190420


class PageScrollViewController: UIViewController {
    
    
    open var btnArrayM: [String]!
    
    
    
    private var scrollView: UIScrollView!
    private var scrollBtn: UIButton!
    // 分页控制器内部的scrollView
    var pageScrollView: UIScrollView!
    // 分页控制器
    private var pageViewController: UIPageViewController!
    // 当前分页控制器
    private var currentListVC: ScrollTabelViewController!
    // 下一个分页控制器
    private var nextListVC: ScrollTabelViewController!
    
    // 控制器索引
    var idx: Int = 0
    // 按钮索引
    var btnIndex: Int = 0
    // 选中的按钮
//    var selectedBtn: UIButton!
    // 第0个按钮
    var firstBtn: UIButton!
    // 最后一个按钮
    var lastBtn: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.cyan
        self.title = "滚动视图"
        
        initData()
        setupUI()
        setupPageViewController()
    }
    
    func initData() {
        self.btnArrayM = ["北京", "南京", "深圳", "杭州", "上海", "成都", "重庆", "广州", "香港", "纽约"]
    }
    
    func setupUI() {
        let sv = UIScrollView.init(frame: CGRect(x: 0, y: 88, width: self.view.bounds.size.width, height: 44))
        self.scrollView = sv
        self.view.addSubview(sv)
        sv.showsVerticalScrollIndicator = false
        sv.showsHorizontalScrollIndicator = false
        sv.backgroundColor = UIColor.yellow
        self.automaticallyAdjustsScrollViewInsets = false
        let btnFont = UIFont.systemFont(ofSize: 16)
        
        
        for (i, item) in btnArrayM.enumerated() {
            print("========idx:\(i),===item:\(item)")
            
            let scrollBtn = UIButton.init(type: .custom)
            self.scrollBtn = scrollBtn
            scrollBtn.tag = tagIndex + i
            
            scrollBtn.addTarget(self, action: #selector(scroll_btn_evt(sender:)), for: .touchUpInside)
            scrollBtn.setTitle(item, for: .normal)
            
            scrollBtn.backgroundColor = .clear
            scrollBtn.titleLabel?.font = btnFont
            scrollBtn.setTitleColor(.black, for: .normal)
            
            var scrollBtn_X: CGFloat = 15.0
            
            if sv.subviews.count > 0 {
                scrollBtn_X = CGFloat(sv.subviews.last?.frame.maxX ?? 0) + 15
                print("====scrollBtn_X\(scrollBtn_X)")
            }
            let btnRect: CGRect = item.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: 0.0), options: .usesLineFragmentOrigin, attributes:[NSAttributedString.Key.font: btnFont], context: nil)
            scrollBtn.frame = CGRect(x: scrollBtn_X, y: 0, width: btnRect.size.width, height: sv.frame.size.height)
            sv.addSubview(scrollBtn)
            
            if (i == 0) {
                //默认第一个选中
                self.selectedBtn = scrollBtn;
                // 记录第一个按钮
                self.firstBtn = scrollBtn;
            }
            if (i == btnArrayM.count - 1) {
                // 记录最后一个按钮
                self.lastBtn = scrollBtn;
            }
        }
        
        if (self.scrollView.subviews.count > 0) {
            let maxX = self.scrollView.subviews.last?.frame.maxX ?? 0 + 15.0
            self.scrollView.contentSize = CGSize(width: maxX, height: 0)
        }
    }
    
    @objc func scroll_btn_evt(sender: UIButton) {
        if (self.selectedBtn == sender) {
            return;
        }
        print("======btnIdx:\(sender.tag)")
        self.selectedBtn = sender
//        self.setSelectedBtn(selectedBtn: sender)
        let idx = selectedBtn.tag - tagIndex
        self.btnIndex = idx
        let vc = self.pageViewController.viewControllers?.first as! ScrollTabelViewController
        let nextVC = ScrollTabelViewController.init()
        
        var dir: UIPageViewController.NavigationDirection = UIPageViewController.NavigationDirection.forward
        
        if (vc.channelIndex == idx) {
            return
        }
        if (idx < vc.channelIndex) {
            dir = UIPageViewController.NavigationDirection.reverse
        }
        
        self.pageViewController.setViewControllers([nextVC], direction: dir, animated: false, completion: nil)
    }
    
    
    
//    func setSelectedBtn(selectedBtn: UIButton) {
//        if (selectedBtn == self.selectedBtn) {
//            return
//        }
//        self.selectedBtn = selectedBtn
//        var originX = selectedBtn.center.x - self.scrollView.frame.midX
//        let maxOffsetX = self.scrollView.contentSize.width - self.scrollView.frame.size.width
//
//        print("===== originX:\(originX),====maxOffsetX:\(maxOffsetX)")
//        if originX < 0 {
//            originX = 0
//        }
//        else if originX > maxOffsetX {
//            originX = maxOffsetX
//        }
//        self.scrollView.setContentOffset(CGPoint(x: originX, y: 0), animated: true)
//        self.selectedBtn.setTitleColor(.red, for: .normal)
//        selectedBtn.setTitleColor(UIColor.blue, for: .normal)
//        let animation1: CABasicAnimation = CABasicAnimation.init(keyPath: "transform.scale")
//        animation1.fromValue = NSNumber.init(floatLiteral: 1.2)
//        animation1.toValue = NSNumber.init(floatLiteral: 1.0)
//        animation1.duration = 0.3
//        animation1.repeatCount = 1
//        animation1.fillMode = CAMediaTimingFillMode.forwards
//        animation1.isRemovedOnCompletion = false
//        animation1.autoreverses = false
//        self.selectedBtn.titleLabel?.layer.add(animation1, forKey: "animation1")
//
//
//        let animation2: CABasicAnimation = CABasicAnimation.init(keyPath: "transform.scale")
//        animation2.fromValue = NSNumber.init(floatLiteral: 1.0)
//        animation2.toValue  = NSNumber.init(floatLiteral: 1.2)
//        animation2.duration = 0.3
//        animation2.repeatCount = 1
//        animation2.fillMode = CAMediaTimingFillMode.forwards
//        animation2.isRemovedOnCompletion = false
//        animation2.autoreverses = false
//        selectedBtn.titleLabel?.layer.add(animation2, forKey: "animation2")
//
//        self.selectedBtn = selectedBtn;
//    }
    
    var selectedBtn: UIButton! {
        didSet {
//            if (self.selectedBtn == selectedBtn) {
//                return
//            }
            var originX = selectedBtn.center.x - self.scrollView.frame.midX
            let maxOffsetX = self.scrollView.contentSize.width - self.scrollView.frame.size.width

            print("===== originX:\(originX),====maxOffsetX:\(maxOffsetX)")
            if originX < 0 {
                originX = 0
            }
            else if originX > maxOffsetX {
                originX = maxOffsetX
            }
            self.scrollView.setContentOffset(CGPoint(x: originX, y: 0), animated: true)
//            self.selectedBtn.setTitleColor(.red, for: .normal)
            selectedBtn.setTitleColor(UIColor.blue, for: .normal)
            let animation1: CABasicAnimation = CABasicAnimation.init(keyPath: "transform.scale")
            animation1.fromValue = NSNumber.init(floatLiteral: 1.2)
            animation1.toValue = NSNumber.init(floatLiteral: 1.0)
            animation1.duration = 0.3
            animation1.repeatCount = 1
            animation1.fillMode = CAMediaTimingFillMode.forwards
            animation1.isRemovedOnCompletion = false
            animation1.autoreverses = false
            selectedBtn.titleLabel?.layer.add(animation1, forKey: "animation1")


            let animation2: CABasicAnimation = CABasicAnimation.init(keyPath: "transform.scale")
            animation2.fromValue = NSNumber.init(floatLiteral: 1.0)
            animation2.toValue  = NSNumber.init(floatLiteral: 1.2)
            animation2.duration = 0.3
            animation2.repeatCount = 1
            animation2.fillMode = CAMediaTimingFillMode.forwards
            animation2.isRemovedOnCompletion = false
            animation2.autoreverses = false
            selectedBtn.titleLabel?.layer.add(animation2, forKey: "animation2")
            
            
        }
    }
    
    
    
    func setupPageViewController() {
        //
        let pc = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let vc = ScrollTabelViewController.init(channelId: self.btnArrayM.first ?? "", index: 0)
        pc.setViewControllers([vc], direction: .forward, animated: false, completion: nil)
        self.addChild(pc)
        self.view.addSubview(pc.view)
        
        pc.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint.init(item: pc.view, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint.init(item: pc.view, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint.init(item: pc.view, attribute: .top, relatedBy: .equal, toItem: self.scrollView, attribute: .bottom, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint.init(item: pc.view, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0))
        
        pc.didMove(toParent: self)
        
        pc.dataSource = self
        pc.delegate = self
        
        self.pageViewController = pc
        
        if pc.view.subviews[0].self == UIScrollView.self() {
            self.pageScrollView = pc.view.subviews[0] as? UIScrollView
        }
    }
}

extension PageScrollViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var idx = (viewController as! ScrollTabelViewController).channelIndex
        self.idx = idx
        idx = idx - 1
        if idx < 0 {
            self.selectedBtn = firstBtn
//            self.setSelectedBtn(selectedBtn: self.firstBtn)
            return nil
        }
        let vc = ScrollTabelViewController.init(channelId: self.btnArrayM[idx], index: idx)
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var idx = (viewController as! ScrollTabelViewController).channelIndex //?? self.btnArrayM.count - 1
        idx = idx + 1
        if idx >= btnArrayM.count {
            self.selectedBtn = self.lastBtn
//            self.setSelectedBtn(selectedBtn: self.lastBtn)
            return nil
        }
        let vc = ScrollTabelViewController.init(channelId: self.btnArrayM[idx], index: idx)
        return vc
    }
    
    
    func selectedIndex(index: Int) {
        if self.scrollView.subviews.count > index {
            let selectedButton = (self.scrollView.subviews[index]) as! UIButton
            selectedBtn = selectedButton
        }
    }
    
    
    /// KVO 监听方法
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        let width = self.pageScrollView.bounds.size.width
        let offsetX = abs(self.pageScrollView.contentOffset.x - width)
        if offsetX == width {
            selectedIndex(index: nextListVC.channelIndex)
        }
        
    }
    
    /// UIPageViewControllerDelegate
    private func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [ScrollTabelViewController]) {
        //
        self.currentListVC = pageViewController.viewControllers?[0] as? ScrollTabelViewController
        self.nextListVC = pendingViewControllers[0]
        // KVO监听滚动变化
        if (self.pageScrollView.tag == 0) {
            self.pageScrollView.addObserver(self, forKeyPath: "contentOffset", options: [], context: nil)
            self.pageScrollView.tag = 1
        }
    }
    
    
    private func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [ScrollTabelViewController], transitionCompleted completed: Bool) {
        //移除监听
        if self.pageScrollView.tag == 1 {
            self.pageScrollView.removeObserver(self, forKeyPath: "contentOffset")
            self.pageScrollView.tag = 0
        }
    }
    
    
}
