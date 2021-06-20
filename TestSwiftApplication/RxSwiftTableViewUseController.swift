//
//  RxSwiftTableViewUseController.swift
//  TestSwiftApplication
//
//  Created by 随风流年 on 2021/6/19.
//

import UIKit
import RxCocoa
import RxSwift

struct Person {
    var name: String
    var age: Int
}


class RxSwiftTableViewUseController: UIViewController ,UITableViewDelegate,UITableViewDataSource
{
    var tableView: UITableView = UITableView()
    let disposeBag = DisposeBag()
    let persons = Observable.just([
        Person(name: "Keep", age: 1),
        Person(name: "Niuniu", age: 18),
        Person(name: "Xixi", age: 20)
    ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 100, width: kWidth, height: kHeight), style: .plain)
//        tableView.delegate = self
//        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.sf_registerCell(cell: SFVideoListCell.self)
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior  = UIScrollView.ContentInsetAdjustmentBehavior.never
        } else {
          self.automaticallyAdjustsScrollViewInsets = false;
        }
        persons.bind(to: tableView.rx.items(cellIdentifier: SFVideoListCell.identifier)){
            row,person,cell in
            cell.textLabel?.text  = person.name
        }.disposed(by: disposeBag)
        
        
    }

}

extension RxSwiftTableViewUseController{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.sf_dequeueReusableCell(indexPath: indexPath) as SFVideoListCell
        cell.currentIndex = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("当前点击的是\(indexPath.row)行")
    }
}
    
