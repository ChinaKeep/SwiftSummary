//
//  ViewController.swift
//  TestSwiftApplication
//
//  Created by apple on 2021/6/2.
//

import UIKit
import Dispatch

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    var tableView: UITableView?
    var funcName:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

      tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
      tableView?.delegate = self as UITableViewDelegate
      tableView?.dataSource = self as UITableViewDataSource
      self.view.addSubview(tableView!)
      tableView?.register(UINib.init(nibName: "SwiftFuncListCell", bundle: nil), forCellReuseIdentifier: "SwiftFuncListCell")
      funcName = ["基础算法、冒泡、排序算法","RxSwift","仿抖音循环列表","RxSwift-Timer","RxSwift-Core","获取启动参数","其他知识点"]
    }
}

extension ViewController {
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return funcName?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SwiftFuncListCell") as? SwiftFuncListCell  else {
            return UITableViewCell()
        }
        cell.funcName.text = funcName?[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(AlgorithmController(), animated:true)
            break
        case 1:
            self.navigationController?.pushViewController(RxSwiftController(), animated:true)
            break
        case 2:
            self.navigationController?.pushViewController(CircleListController(), animated:true)
            break
        case 3:
            self.navigationController?.pushViewController(RxSwiftTimerController(), animated:true)
            break
        case 4:
            self.navigationController?.pushViewController(RxSwiftCoreController(), animated:true)
            break
        case 5:
            self.navigationController?.pushViewController(ProcessInfoController(), animated:true)
            break
        default:
            print("没有对应的功能")
        }
    }
}



