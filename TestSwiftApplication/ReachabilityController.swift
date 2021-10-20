//
//  ReachabilityController.swift
//  TestSwiftApplication
//
//  Created by Keep on 2021/6/30.
//

import UIKit
import Reachability
import CoreTelephony

class ReachabilityController: UIViewController {
    var reachability : Reachability = Reachability()!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
//        var netTypeString =  getNetType()
        
//        getNetworkType()
        ReachablityTool.setUpReachability()
  
//        print(netTypeString)
    }
//    func getNetworkType() {
//        do {
//            try reachability = Reachability()
//        }catch{
//            print("错误")
//        }
//        reachability.whenReachable = {
//            reachability in
//           //调用网络检查环境的方法，判断当前设备的网络环境
//                DispatchQueue.main.async{
//                //获得网络状态后，返回主线程进行响应
//                if self.reachability.connection == .wifi
//                {
//                    print("wifi上网")
//                }
//                else
//                {
//                    print("4g或者是3g的")
//                }
//            }
//       }
//        //接下来处理网络未连接的情况
//        reachability.whenUnreachable = {
//            reachability in
//            DispatchQueue.main.async {
//                print("未连接")
//            }
//        }
//        do {
//            try reachability.startNotifier()
//        }catch{
//            print("没有连接")
//        }
//    }
//    func getNetType()  -> Int{
//        var ClientNetType:Int = 0
////        let reachability: Reachability!
//        do {
//            try reachability = Reachability()
//        } catch  {
//            print("错误了")
//        }
//        reachability.whenUnreachable = { _ in
//            DispatchQueue.main.async {
//                print("Not reachable")
//                ClientNetType = 1
//            }
//        }
//
//        reachability.whenReachable = { reachability in
//            DispatchQueue.main.async {
//                if reachability.connection == .wifi {
//                    print("Reachable via WiFi")
//                    ClientNetType = 5
//                } else {
//                    print("Reachable via Cellular") // cellular  蜂窝网（移动网络）
//                    let info = CTTelephonyNetworkInfo()
//                    let currentStatus = info.currentRadioAccessTechnology
//                    if #available(iOS 14.1, *) {
//                        switch currentStatus {
//                        case CTRadioAccessTechnologyGPRS,
//                             CTRadioAccessTechnologyEdge,
//                             CTRadioAccessTechnologyCDMA1x:
//                            print("2G")
//                            ClientNetType = 2
//                        case CTRadioAccessTechnologyHSDPA,
//                             CTRadioAccessTechnologyHSUPA,
//                             CTRadioAccessTechnologyCDMAEVDORev0,
//                             CTRadioAccessTechnologyCDMAEVDORevA,
//                             CTRadioAccessTechnologyCDMAEVDORevA,
//                             CTRadioAccessTechnologyWCDMA,
//                             CTRadioAccessTechnologyeHRPD:
//                            print("3G")
//                            ClientNetType = 3
//                        case CTRadioAccessTechnologyLTE:
//                            print("4G")
//                            ClientNetType = 4
//                        case CTRadioAccessTechnologyNRNSA,CTRadioAccessTechnologyNR:
//                            print("5G")
//                            ClientNetType = 7
//                        default:
//                            print("0G")
//                        }
//                    } else {
//                        switch currentStatus {
//                        case CTRadioAccessTechnologyGPRS,
//                             CTRadioAccessTechnologyEdge,
//                             CTRadioAccessTechnologyCDMA1x:
//                            print("2G")
//                            ClientNetType = 2
//                        case CTRadioAccessTechnologyHSDPA,
//                             CTRadioAccessTechnologyHSUPA,
//                             CTRadioAccessTechnologyCDMAEVDORev0,
//                             CTRadioAccessTechnologyCDMAEVDORevA,
//                             CTRadioAccessTechnologyCDMAEVDORevA,
//                             CTRadioAccessTechnologyWCDMA,
//                             CTRadioAccessTechnologyeHRPD:
//                            print("3G")
//                            ClientNetType = 3
//                        case CTRadioAccessTechnologyLTE:
//                            print("4G")
//                            ClientNetType = 4
//                        default:
//                            print("0G")
//                        }
//                    }
//                }
//            }
//        }
//
//        do {
//            try reachability.startNotifier()
//        } catch {
//            print("Unable to start notifier")
//        }
//        return  ClientNetType
//    }
    
    
    //declare this property at top of your file, so the scope will remain.

//    var reachability = Reachability()!

}


