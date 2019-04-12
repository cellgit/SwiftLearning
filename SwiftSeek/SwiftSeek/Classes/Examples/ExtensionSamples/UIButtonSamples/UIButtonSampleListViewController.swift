//
//  UIButtonSampleListViewController.swift
//  SwiftSeek
//
//  Created by 刘宏立 on 2019/4/5.
//  Copyright © 2019 liuhongli. All rights reserved.
//

import UIKit

class UIButtonSampleListViewController: BaseTableViewController {
    
    let KImageAndTextIdentifier = "ImageAndTextIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
    }
    
    override func tableViewData() {
        let data0 = TableViewDataStruct.init(title: "ImageAndText", identifier: KImageAndTextIdentifier)
        let data1 = TableViewDataStruct.init(title: "Functional Core Image", identifier: KImageAndTextIdentifier)
        
        tableviewDataArray = [data0,
                              data1]
    }

}

extension UIButtonSampleListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KImageAndTextIdentifier)) {
            let vc = UIButtonImageTextSampleViewController.init()
            pushViewController(vc: vc, animated: true)
        }
//        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KImageAndTextIdentifier)) {
//            let vc = FunctionalCoreImageViewController.init()
//            pushViewController(vc: vc, animated: true)
//        }
    }
}
