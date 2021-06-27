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
    var textField: UITextField?
    
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
        let variable = Variable("S")
        variable.asObservable().subscribe { event in
            print("---\(event)")
        }.addDisposableTo(DisposeBag())

        textField = UITextField(frame: CGRect(x: 100, y: 100, width: 100, height: 30))
//        textField.backgroundColor = UIColor.red
        textField!.borderStyle = .roundedRect
        textField!.textColor = UIColor.black
        view.addSubview(textField!)
        //点击鼠标 时 输出两次  第一次是初始化 第二次是开始编辑的时候  begen 事件
        textField!.rx.text.skip(1).subscribe(onNext: {
            print("输入来了\($0)")
        })
        
        
    }
}
