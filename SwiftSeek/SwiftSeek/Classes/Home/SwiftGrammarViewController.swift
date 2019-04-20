//
//  SwiftGrammarViewController.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/1/11.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit

class SwiftGrammarViewController: BaseTableViewController {
    
    let KProtocolIdentifier = "ProtocolIdentifier"
    let KRxSwiftIdentifier = "RxSwiftIdentifier"
    let KPromiseIdentifier = "PromiseIdentifier"
    let KNetworkRequestIdentifier = "NetworkRequestIdentifier"
    let KFunctionalSwiftIdentifier = "FunctionalSwiftIdentifier"
    let KButtonExtensionSampleIdentifier = "ButtonExtensionSampleIdentifier"
    let KPageControlViewControllerIdentifier = "PageControlViewControllerIdentifier"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Swift Grammar"
        tableViewData()
    }
    
    
    override func tableViewData() {
        let data0 = TableViewDataStruct.init(title: "Swift Protocol", identifier: KProtocolIdentifier)
        let data1 = TableViewDataStruct.init(title: "RxSwift", identifier: KRxSwiftIdentifier)
        let data2 = TableViewDataStruct.init(title: "PromiseKit", identifier: KPromiseIdentifier)
        let data3 = TableViewDataStruct.init(title: "NetworkRequest", identifier: KNetworkRequestIdentifier)
        let data4 = TableViewDataStruct.init(title: "FunctionalSwift", identifier: KFunctionalSwiftIdentifier)
        let data5 = TableViewDataStruct.init(title: "ButtonExtensionSample", identifier: KButtonExtensionSampleIdentifier)
        let data6 = TableViewDataStruct.init(title: "PageControlViewController", identifier: KPageControlViewControllerIdentifier)
        tableviewDataArray = [data0,
                              data1,
                              data2,
                              data3,
                              data4,
                              data5,
                              data6]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var vc = UIViewController.init()
        switch tableviewDataArray[indexPath.row].identifier {
        case KProtocolIdentifier:
            vc = ProtocolListViewController.init()
        case KRxSwiftIdentifier:
            vc = RxListViewController.init()
        case KPromiseIdentifier:
            vc = PromiseListViewController.init()
        case KNetworkRequestIdentifier:
            vc = NetReqListViewController.init()
        case KFunctionalSwiftIdentifier:
            vc = FunctionalListViewController.init()
        case KButtonExtensionSampleIdentifier:
            vc = UIButtonSampleListViewController.init()
        case KPageControlViewControllerIdentifier:
            vc = PageScrollListViewController.init()
            
            
        default:
            vc = ProtocolListViewController.init()
        }
        pushViewController(vc: vc, animated: true)
        
        
    }
    // 在这里设置tableViewCell的动画
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // initial state of cell
        cell.alpha = 0.0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -300, 20, 10)
        cell.layer.transform = transform
        // change the final state of cell by UIView animation
        UIView.animate(withDuration: 0.33) {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }
}
