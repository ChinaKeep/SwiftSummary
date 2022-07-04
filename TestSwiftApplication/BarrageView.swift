//
//  BarrageView.swift
//  TestSwiftApplication
//
//  Created by Keep on 2022/4/6.
//

import UIKit

class BarrageView: UIView,UITableViewDelegate,UITableViewDataSource  {
    
    var dataArray:Array<String>?{
        didSet{
            self.funcName = dataArray
            self.tableView?.reloadData()
        }
    }

    var tableView: UITableView?
    var funcName:[String]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView = UITableView.init(frame: CGRect.zero)
        tableView?.delegate = self as UITableViewDelegate
        tableView?.dataSource = self as UITableViewDataSource
        self.addSubview(tableView!)
        tableView?.register(BarrageCell.self, forCellReuseIdentifier: "BarrageCell")
        tableView?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        })
        funcName = [
            "基础算法、冒泡、排序算法",
            "RxSwift",
            "仿抖音循环列表",
            "RxSwift-Timer",
            "RxSwift-Core",
            "获取启动参数",
            "网络类型获取",
            "C++学习",
            "C语言",
            "其他知识点"
        ]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension BarrageView {
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return funcName?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BarrageCell") as? BarrageCell  else {
            return UITableViewCell()
        }
        cell.nickStr = funcName?[indexPath.row]
        return cell
    }
}
