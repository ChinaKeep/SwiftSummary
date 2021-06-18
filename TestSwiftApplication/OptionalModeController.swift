//
//  OptionalModeController.swift
//  TestSwiftApplication
//
//  Created by apple on 2021/6/17.
//

import UIKit

//字符串扩展 以用于switch case 判断
extension String {
    static func ~=(pattern:(String) -> Bool  ,value: String) -> Bool {
        pattern(value)
    }
}

extension Int{
    static func ~=(pattern:(Int) -> Bool,value: Int) -> Bool {
        pattern(value)
    }
}

class OptionalModeController: UIViewController {

    //自定义表达式模式
    struct Student{
        var score = 0, name = ""
        /// pattern: case后面的内容
        /// value: switch 后面的内容
        static func ~= (pattern: Int, value: Student) -> Bool{
            value.score > pattern
        }
        
        static func ~= (pattern: Range<Int>, value: Student) -> Bool{
            pattern.contains(value.score)
        }
        static func ~= (pattern: ClosedRange<Int>, value: Student) -> Bool{
            pattern.contains(value.score)
        }
    }
  
    
    func hasPrefix(_ prefix: String) -> ((String) -> Bool) {
        {
            $0.hasPrefix(prefix)
        }
        //闭包表达式的简写如上
//        return {
//            (str: String) -> Bool in
//            str.hasPrefix(prefix)
//        }
    }
    func isEven(_ i:Int) -> Bool {
        i % 2 == 0
    }
    func isOdd(_ i: Int) -> Bool {
        i % 2 != 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        //可选模式 ，模式匹配，带？表示非空
//        let age: Int? = 101
//        //解包出来非空的值 赋值给x
//        if case let x? = age {
//            print(x)
//        }
//
//        let num: Any =  6
//        switch num {
//        case let num as Int:
//            print(num)
//        default:
//            break
//        }
        
        let number: Any =  6
        switch number {
        case is Int:
            //编译器依然认为number是Any类型
            print("number=== is Int",number)
        case let n as Int: //把结果赋值给n
            print("as Int",n + 1) //as Int 7
        default:
            break
        }
    
        //表达式模式
        let point = (3,0)
        switch point {
        case (0, 0) :
            print("(0,0) is at the origin")
//            break
        case (-2...2,-2...2):
            print("(\(point.0),\(point.1))is near the origin") //(1,2)is near the origin
//            break
        default:
            print("The point is at (\(point.0),\(point.1))")
        }
        
      
        
       
        
        var stu = Student(score: 75, name: "Jack")
        switch stu {
        case 100 :         //必须是已经创建完成的Student 否则模式还是无法匹配
            print(">= 100")
        case 90 :
            print(">= 90")
        case 80..<90:
            print("[80,90)")
        case 60...79:
            print("[60,79]")
        default:break
        }
        if  case 60 = stu {
            print("if case 相当于单个switch case")
        }
        
        // 表达式模式二
        var str = "123456"
        print(str.hasPrefix("123"))
        print(str.hasSuffix("456"))
            
        
        var age = 10
        switch age {
        case isEven: //放的是函数类型
            print("是偶数")
        case isOdd:
            print("是奇数")
        default:
            break
        }
        
        //可以使用where 为模式匹配增加匹配条件
        var data = (10,"Jack")
        switch data {
        case let (age,_) where age > 10 :
            print(data.1,"age> 10")
        case let (age,_) where age > 0 :
            print(data.1,"age> 0")
        default:
            break
        }
        
        var ages = [10,20,44,23,55]
        for age  in ages where age > 30 {
            print(age)
        }
        /**
         注释
         */
        func test(){
            // TODO: 未完成
            // MARK: - 标记
            
            // MARK: 哈哈哈哈
        }
        //条件编译
        //debug 模式
        #if DEBUG
        
        #else
        
        #endif
        
        //Swift 中没有宏定义这么一个说法的
        print("23333")
    }
  

}
