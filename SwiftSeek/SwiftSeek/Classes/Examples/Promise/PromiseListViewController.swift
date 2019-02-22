//
//  PromiseListViewController.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/2/20.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit

class PromiseListViewController: BaseTableViewController {

    let KBasicPromiseIdentifier = "BasicPromiseIdentifier"
    let KNetworkPromiseIdentifier = "NetworkPromiseIdentifier"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
    }
    
    override func tableViewData() {
        let data0 = TableViewDataStruct.init(title: "BasicPromise", identifier: KBasicPromiseIdentifier)
        let data1 = TableViewDataStruct.init(title: "NetworkPromise", identifier: KNetworkPromiseIdentifier)
        tableviewDataArray = [data0,
                              data1]
        
    }
}

extension PromiseListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KBasicPromiseIdentifier)) {
            let vc = BasicPromiseViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KNetworkPromiseIdentifier)) {
            let vc = NetworkPromiseViewController.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}
