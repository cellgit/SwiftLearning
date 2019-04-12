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
    let KFunctionalCoreImageIdentifier = "FunctionalCoreImageIdentifier"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
    }
    

    override func tableViewData() {
        let data0 = TableViewDataStruct.init(title: "Functional Swift", identifier: KFunctionalIdentifier)
        let data1 = TableViewDataStruct.init(title: "Functional Core Image", identifier: KFunctionalCoreImageIdentifier)
        
        tableviewDataArray = [data0,
                              data1]
    }

}

extension FunctionalListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KFunctionalIdentifier)) {
            let vc = BasicFunctionalViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KFunctionalCoreImageIdentifier)) {
            let vc = FunctionalCoreImageViewController.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}
