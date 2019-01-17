//
//  RxListViewController.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/1/17.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit

class RxListViewController: BaseTableViewController {
    
    let KRxBasicIdentifier = "RxBasicIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func tableViewData() {
        let data0 = TableViewDataStruct.init(title: "RxBasic", identifier: KRxBasicIdentifier)
        tableviewDataArray = [data0]
        
    }

}

extension RxListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KRxBasicIdentifier)) {
            let vc = RxBasicViewController.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}
