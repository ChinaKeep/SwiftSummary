//
//  RxCoreController.swift
//  TestSwiftApplication
//
//  Created by Keep on 2021/6/24.
//

import UIKit
import RxSwift
import RxCocoa

class RxSwiftCoreController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        /**
            sequence ,boservable 表示 可监听或者可观察
            也就是说RxSwift的核心思想就是可监听的序列
        */
        let array = [1,2,3,4]
        let array2 = array.filter {
            $0 > 1
        }.map {
            $0 * 2
        }
//        log("\(array2)")
        print("\(array2)")

        /**
         RxSwift中的Subjects是什么？
         Subject 是observable 和 observer 之间的桥梁，一个Subject即是一个Observable 也是一个Observer
         它既可以发出事件，也可以监听事件
         
         */
        let variable = Variable("S");variable.asObservable().subscribe { event in
            print("---\(event)")
        }.addDisposableTo(DisposeBag())

        
    }
}
