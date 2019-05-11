//
//  EntryListViewController.swift
//  SwiftSeek
//
//  Created by 刘宏立 on 2019/5/11.
//  Copyright © 2019 liuhongli. All rights reserved.
//

import UIKit

class EntryListViewController: BaseTableViewController {
    let KEntryIdentifier = "EntryIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
    }
    
    
    override func tableViewData() {
        let data0 = TableViewDataStruct.init(title: "EntryIdentifier", identifier: KEntryIdentifier)
        tableviewDataArray = [data0]
    }

}

extension EntryListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KEntryIdentifier)) {
            let vc = EntryViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KEntryIdentifier)) {
            let vc = EntryViewController.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}

