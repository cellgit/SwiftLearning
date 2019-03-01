//
//  ProtocolListViewController.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/1/11.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit

class ProtocolListViewController: BaseTableViewController {
    
    let KBasicProtocolIdentifier = "BasicProtocolIdentifier"
    let KBasicProtocolGrammarIdentifier = "BasicProtocolGrammarIdentifier"

    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableViewData() {
        let data0 = TableViewDataStruct.init(title: "BasicProtocol", identifier: KBasicProtocolIdentifier)
//        tableviewDataArray = [data0]
        let data1 = TableViewDataStruct.init(title: "BasicProtocolGrammar", identifier: KBasicProtocolGrammarIdentifier)
        tableviewDataArray = [data0,
                              data1]
    }

}
extension ProtocolListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KBasicProtocolIdentifier)) {
            let webUrl = "https://github.com/cellgit/SwiftSeek/wiki/ProtocolIntroduce"
            let vc = BasicProtocolViewController.init(identifier: KBasicProtocolIdentifier, url: webUrl)
            pushViewController(vc: vc, animated: true)
        }
        else if
            (tableviewDataArray[indexPath.row].identifier .elementsEqual(KBasicProtocolGrammarIdentifier)) {
            let vc = BasicProtocolGrammarViewController.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}
