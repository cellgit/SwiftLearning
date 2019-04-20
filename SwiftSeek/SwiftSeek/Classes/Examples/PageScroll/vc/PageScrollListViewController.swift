//
//  PageScrollListViewController.swift
//  SwiftSeek
//
//  Created by 刘宏立 on 2019/4/20.
//  Copyright © 2019 liuhongli. All rights reserved.
//

import UIKit

class PageScrollListViewController: BaseTableViewController {
    
    let KPageScrollVCIdentifier = "PageScrollVCIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
    }
    

    override func tableViewData() {
        let data0 = TableViewDataStruct.init(title: "PageScrollVC", identifier: KPageScrollVCIdentifier)
        let data1 = TableViewDataStruct.init(title: "Functional Core Image", identifier: KPageScrollVCIdentifier)
        
        tableviewDataArray = [data0,
                              data1]
    }

}

extension PageScrollListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KPageScrollVCIdentifier)) {
            let vc = PageScrollViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        //        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KImageAndTextIdentifier)) {
        //            let vc = FunctionalCoreImageViewController.init()
        //            pushViewController(vc: vc, animated: true)
        //        }
    }
}

