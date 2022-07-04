//
//  BarrageController.swift
//  TestSwiftApplication
//
//  Created by Keep on 2022/4/5.
//

import UIKit

class BarrageController: UIViewController{
    var sourceArray:Array = Array<String>()
    var barrageView: BarrageView = BarrageView()
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        barrageView = BarrageView(frame: CGRect.zero)
        barrageView.backgroundColor = UIColor.green
        view.addSubview(barrageView)
        
        barrageView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalToSuperview()
        }

        /// 启动定时器
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(getData),
                                     userInfo: nil,
                                     repeats: true)
        
//        var arr = ["4","5","6"]
//        let wrongArr = ["4","5"]
//        arr = arr.filter { !wrongArr.contains($0) }
//        print(arr)
        sourceArray = ["我爱你","平行线","呵呵哈哈哈","不可能呢","张胜男","李四","王五","陈六子"]
    }
    
    @objc func  getData(){
        //更新数据
        var subArray = sourceArray.sample(size: 3, noRepeat: false) ?? ["2022年04月06日21:18:51"];
        print("\(String(describing: subArray))")
        barrageView.dataArray = subArray
        sourceArray =  sourceArray.filter { !subArray.contains($0) }
        print("sourceArray:\(sourceArray)")
//        sourceArray =  Array(Set(sourceArray).subtracting(subArray))

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //退出时清空定时器
        timer?.invalidate()
    }
}



extension Array {
    /// 从数组中返回一个随机元素
    public var sample: Element? {
        //如果数组为空，则返回nil
        guard count > 0 else { return nil }
        let randomIndex = Int(arc4random_uniform(UInt32(count)))
        return self[randomIndex]
    }
     
    /// 从数组中从返回指定个数的元素
    ///
    /// - Parameters:
    ///   - size: 希望返回的元素个数
    ///   - noRepeat: 返回的元素是否不可以重复（默认为false，可以重复）
    public func sample(size: Int, noRepeat: Bool = false) -> [Element]? {
        //如果数组为空，则返回nil
        guard !isEmpty else { return nil }
         
        var sampleElements: [Element] = []
         
        //返回的元素可以重复的情况
        if !noRepeat {
            for _ in 0..<size {
                sampleElements.append(sample!)
            }
        }
        //返回的元素不可以重复的情况
        else{
            //先复制一个新数组
            var copy = self.map { $0 }
            for _ in 0..<size {
                //当元素不能重复时，最多只能返回原数组个数的元素
                if copy.isEmpty { break }
                let randomIndex = Int(arc4random_uniform(UInt32(copy.count)))
                let element = copy[randomIndex]
                sampleElements.append(element)
                //每取出一个元素则将其从复制出来的新数组中移除
                copy.remove(at: randomIndex)
            }
        }
        
        return sampleElements
    }
}
