//
//  RotationLinerController.swift
//  TestSwiftApplication
//
//  Created by Keep on 2022/5/24.
//

import UIKit

class RotationLinerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        //添加旋转30度
        redLayer.add(createAnimation(keyPath: "transform.rotation.z", toValue: Double.pi/6), forKey: nil)
        //平移动画
        redLayer.add(createBasicAnimation(fromValue: CGPoint(x: 0, y: 150), toValue: CGPoint(x: 300, y: 350), timingFunction: CAMediaTimingFunctionName.linear), forKey: "linear")
        
        
    }
    private lazy var tipView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var redLayer: CALayer = {
        let layer =  self.createLayer(position: CGPoint(x: 125, y: 100), backgroundColor: UIColor.red)
        return layer
    }()

}


extension RotationLinerController : CAAnimationDelegate{
    fileprivate func createLayer(position: CGPoint,backgroundColor: UIColor) -> CALayer{
        let layer = CALayer()
        layer.position = position
        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = backgroundColor.cgColor
        self.view.layer.addSublayer(layer)
        return layer
    }
    //旋转动画
    fileprivate func createAnimation(keyPath: String, toValue: CGFloat) -> CABasicAnimation {
        let scaleAni = CABasicAnimation()
        scaleAni.keyPath = keyPath
        scaleAni.toValue = toValue
        scaleAni.duration = 2
        scaleAni.repeatCount = Float(CGFloat.greatestFiniteMagnitude)
//        scaleAni.repeatCount = 1
        //动画后保持最终的状态
        scaleAni.isRemovedOnCompletion = false
        scaleAni.fillMode = .forwards
        return scaleAni
    }
    
    //创建Label
    fileprivate func creatLabel (title: String, frame: CGRect) -> (){
      let label = UILabel()
        label.text = title
        label.frame = frame
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 12)
        self.view.addSubview(label)
    }
    //创建平移动画
    fileprivate func createBasicAnimation (fromValue: CGPoint, toValue: CGPoint, timingFunction: CAMediaTimingFunctionName) -> CABasicAnimation {
        //创建动画对象
        let basicAni = CABasicAnimation()
        //设置动画属性
        basicAni.keyPath = "position"
        //设置动画的起始位置。也就是动画从哪里到哪里
        basicAni.fromValue = fromValue
        //动画结束后，layer所在的位置
        basicAni.toValue = toValue
        //动画持续时间
        basicAni.duration = 5;
        //动画重复次数
        basicAni.repeatCount = Float(CGFloat.greatestFiniteMagnitude)
        //xcode8.0之后需要遵守代理协议
        basicAni.delegate = self;
        basicAni.timingFunction = CAMediaTimingFunction.init(name: timingFunction)
        //动画维持结束后的状态,如果不加这两句代码，动画运行结束后会恢复最初的动画状态
        basicAni.isRemovedOnCompletion = false;
        basicAni.fillMode = .forwards;
        
        return basicAni;
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("动画停止了")
    }
}
