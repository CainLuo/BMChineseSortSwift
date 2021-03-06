//
//  SortVC.swift
//  BMChineseSortingSwift
//
//  Created by Baymax on 2018/12/21.
//  Copyright © 2018 Baymax. All rights reserved.
//

import UIKit
import BMChineseSort

// 字符串数组 普通排序
class SortVC: UITableViewController {
    
    var dataArr = ["北京","河北","黑龙江","上海","江苏","浙江","福建","湖北","湖南","广东","海南","重庆","四川","贵州","云南","西藏","陕西","沈阳","长春","abc","baba"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        BMChineseSort.share.polyphoneMapping["长安"] = "CA"
        
        BMChineseSort.sortAndGroup(objectArray: dataArr, key: nil) { (isSuccess, unGroupedArr, _, _) in
            if isSuccess{
                self.dataArr = unGroupedArr
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.dataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell!.textLabel?.text = self.dataArr[indexPath.row];
        return cell!
    }

}
