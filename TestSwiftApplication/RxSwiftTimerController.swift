//
//  RxSwiftTimerController.swift
//  TestSwiftApplication
//
//  Created by 随风流年 on 2021/6/23.
//

import UIKit

class RxSwiftTimerController: UIViewController {
    var timer = Timer()
    var gcdTimer: DispatchSourceTimer?
    var cadTimer: CADisplayLink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        //GCD timer Use
//      gcdTimerUse()
        cadDisplaylinkUse()
    }
    
    //MARK: --- timer ---
    func timerUse() {
        timer = Timer.init(timeInterval: 1, repeats: true, block: { (timer) in
            print("timer")
        })
        timer.fire()
    }
    
    //MARK: ---gcd timer ---
    func gcdTimerUse()  {
        gcdTimer = DispatchSource.makeTimerSource()
//        gcdTimer?.schedule(deadline: DispatchTime.now() )
        gcdTimer?.schedule(deadline: DispatchTime.now(), repeating: DispatchTimeInterval.seconds(1))
        gcdTimer?.setEventHandler(handler: {
            print("hello gcd timer")
        })
        gcdTimer?.resume()
    }
    //MARK: --- CADisplayLink 的使用 ---
    func cadDisplaylinkUse() {
        cadTimer = CADisplayLink.init(target: self, selector: #selector(timerFire))
        cadTimer?.preferredFramesPerSecond = 1
        cadTimer?.add(to: RunLoop.current, forMode: .default)
    }
    @objc func timerFire(){
        print("cadTimer")
    }
}
