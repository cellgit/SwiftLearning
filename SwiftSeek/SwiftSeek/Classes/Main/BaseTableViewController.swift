//
//  BaseTableViewController.swift
//  SwiftSeek
//
//  Created by liuhongli on 2019/1/11.
//  Copyright © 2019年 liuhongli. All rights reserved.
//

import UIKit

let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

public let NavigationH: CGFloat = UIScreen.main.bounds.size.height == 812 ? 88 : 64
public let CMMagin: CGFloat = 10
public let AppWidth: CGFloat = UIScreen.main.bounds.size.width
public let AppHeight: CGFloat = UIScreen.main.bounds.size.height
public let AppSize: CGRect = UIScreen.main.bounds
public let SafeAreaTopHeight : CGFloat = UIScreen.main.bounds.size.height == 812 ? 88 : 64
public let TabarHeight : CGFloat = UIScreen.main.bounds.size.height == 812 ? 83 : 49

// UITableView 列表的数据 struct
struct TableViewDataStruct {
    var title = ""
    var identifier = ""
}

class BaseTableViewController: UIViewController {
    
    let KUITableViewCell = "UITableViewCell"
    var tableView:UITableView!
    var tableviewDataArray = [TableViewDataStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        tableViewData()
        setTableViewUI()
    }
    func tableViewData() {
        /// 子类在这里 添加 data 数据
        //        let data1 = HLTableViewDataStruct.init(title: "UIStoryboardCalandar", identifier: KUIStoryboardCalandarIdentifier)
        //        tableviewDataArray = [data1]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setTableViewUI() {
        tableView = UITableView.init(frame: self.view.frame, style: .grouped)
        self.view.addSubview(tableView)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: KUITableViewCell)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension BaseTableViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableviewDataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :UITableViewCell = tableView.dequeueReusableCell(withIdentifier: KUITableViewCell, for: indexPath)
        cell.layer.shouldRasterize = true
        cell.textLabel?.text = "Row \(indexPath.row) : \(tableviewDataArray[indexPath.row].title)"
        cell.layer.rasterizationScale = UIScreen.main.scale
        cell.textLabel?.textColor = UIColor.init(red: 43/255.0, green: 133/255.0, blue: 208/255.0, alpha: 1.0)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 0))
        return view
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 0))
        return view
    }
}

extension UIViewController {
    func pushViewController(vc: UIViewController, animated: Bool) {
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
