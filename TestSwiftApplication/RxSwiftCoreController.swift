//
//  RxCoreController.swift
//  TestSwiftApplication
//
//  Created by Keep on 2021/6/24.
//

import UIKit

class RxCoreController: UIViewController {

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
        }

    }
}
