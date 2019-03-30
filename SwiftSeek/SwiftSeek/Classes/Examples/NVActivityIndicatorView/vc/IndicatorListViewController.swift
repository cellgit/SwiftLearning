//
//  IndicatorListViewController.swift
//  SwiftSeek
//
//  Created by 刘宏立 on 2019/3/24.
//  Copyright © 2019 liuhongli. All rights reserved.
//

import UIKit

class IndicatorListViewController: BaseTableViewController {
    
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

extension IndicatorListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KSketchHotkeysIdentifier)) {
            let vc = IndicatorViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KSketchHotkeysIdentifier)) {
            let vc = IndicatorViewController.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}
