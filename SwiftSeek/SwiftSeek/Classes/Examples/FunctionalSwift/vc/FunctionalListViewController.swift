//
//  FunctionalListViewController.swift
//  SwiftSeek
//
//  Created by 刘宏立 on 2019/3/30.
//  Copyright © 2019 liuhongli. All rights reserved.
//

import UIKit

class FunctionalListViewController: BaseTableViewController {
    
    let KFunctionalIdentifier = "FunctionalIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
    }
    

    override func tableViewData() {
        let data0 = TableViewDataStruct.init(title: "Functional Swift", identifier: KFunctionalIdentifier)
        tableviewDataArray = [data0]
    }

}

extension FunctionalListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KFunctionalIdentifier)) {
            let vc = BasicFunctionalViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KFunctionalIdentifier)) {
            let vc = BasicFunctionalViewController.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}
