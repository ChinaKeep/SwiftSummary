//
//  RxSwiftController.swift
//  TestSwiftApplication
//
//  Created by apple on 2021/6/16.
//

import UIKit
import RxCocoa
import RxSwift

class RxSwiftController: UIViewController {

    var label: UILabel?
    let bag = DisposeBag()
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
         /**
         Observable: 负责发送事件（Event）
         Observer: 负责订阅Observable,监听Observable发送的事件（Event）
         
         
         public enum Event<Element> {
            case next(Element)  //携带具体数据
            case error(Swift.Error) //携带错误信息，表明Observable终止
            case completed  //表明Observable终止，不会再发送事件
         }
         */
        let observable = Observable<Int>.create { observer  in
            observer.onNext(22) //发送消息
            
            observer.onCompleted() //完成
            return Disposables.create()
        }
    
      observable.subscribe { event in
            switch event{
            case .next(let element):
                print("next",element)
            case .error(let error):
                print("error",error)
            case .completed:
                print("completed")
            }
      }.dispose()//订阅完成就取消订阅，代表只订阅一次
        
        // MARK: --- 以上是发送和订阅 ---
        //有穷订阅
        let observable1 = Observable.just([1,2,3,4])
        observable1.subscribe { (element) in
            print("next",element)
        }
        
        label = UILabel.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 30))
        label?.text = "Keep"
        label?.backgroundColor = UIColor.green
        view.addSubview(label!)
                
        // MARK: 定时器使用
        timer()
        
        button = UIButton.init(type: .custom)
        button.frame = CGRect.init(x: 100, y: 200, width: 100, height: 100)
        button.backgroundColor = UIColor.red
        button.setTitle("Keep", for: .normal)
        view.addSubview(button)
        
        //MARK: binder使用二
        binderUser3()
    }
    // MARK: binder的使用
    func binderUser() {
        // binder
        let binder = Binder<String>.init(label!) { (label, value) in
            label.text = value
        }
        Observable.just(1).map{
            "数值\($0)"
        }.subscribe(binder).dispose()
        
    }
    // MARK: binder使用二
    func binderUser2() {
        let observable = Observable<Int>.timer(.seconds(2), period: .seconds(1), scheduler: MainScheduler.instance)
        //binder 绑定button
        let binder = Binder<Bool>.init(button) { (button, value) in
            button.isHidden  = value
        }
        observable.map {$0 % 2 == 0}.bind(to: binder).disposed(by: bag)
    }
    
    // MARK: binder使用三
    func binderUser3() {
        let observable = Observable<Int>.timer(.seconds(2), period: .seconds(1), scheduler: MainScheduler.instance)
        //binder 绑定button
//        let binder = Binder<Bool>.init(button) { (button, value) in
//            button.isHidden  = value
//        }
        observable.map {$0 % 2 == 0}.bind(to: button.rx.hidden).disposed(by: bag)
    }
    
    func timer() {
        let observable = Observable<Int>.timer(.seconds(2), period: .seconds(1), scheduler: MainScheduler.instance)
        observable.subscribe { number in
            print(number)
        }
        let _ = observable.map {"\($0)"}.bind(to:(label?.rx.text)!).disposed(by: bag) //当bag 销毁（deinit）时，会自动调用Disposable实例的dispose
        //代表跟随self的声明周期
//        observable.takeUntil(self.rx.deallocated).map {"\($0)"}.bind(to:(label?.rx.text)!).disposed(by: bag) //当bag 销毁（deinit）时，会自动调用Disposable实例的dispose

        
    }
 
    
}


// MARK: 给UIButton 扩展功能，一个计算属性
extension Reactive where Base: UIButton{
    var hidden: Binder<Bool>{
        return Binder<Bool>(base){
            button,value in button.isHidden = value
        }
    }
}
























