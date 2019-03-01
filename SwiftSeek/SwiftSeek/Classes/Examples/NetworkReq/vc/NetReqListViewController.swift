//
//  NetReqListViewController.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/3/1.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit

class NetReqListViewController: BaseTableViewController {
    
    let KSketchHotkeysIdentifier = "SketchHotkeysIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
    }
    

    override func tableViewData() {
        let data0 = TableViewDataStruct.init(title: "SketchHotkeys", identifier: KSketchHotkeysIdentifier)
        tableviewDataArray = [data0]
    }
}

extension NetReqListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KSketchHotkeysIdentifier)) {
            let vc = SketchHotkeysViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KSketchHotkeysIdentifier)) {
            let vc = SketchHotkeysViewController.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}
