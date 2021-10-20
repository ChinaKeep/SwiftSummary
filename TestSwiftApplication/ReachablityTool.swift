//
//  ReachablityTool.swift
//  TestSwiftApplication
//
//  Created by Keep on 2021/6/30.
//

import UIKit
import Reachability
import CoreTelephony

var reachability : Reachability = Reachability()!
var ClientNetType: Int = 0

class ReachablityTool: NSObject {

    static func setUpReachability()
       {
           //declare this property where it won't go out of scope relative to your listener
           DispatchQueue.main.async {
               reachability.whenReachable = { reachability in
               if reachability.connection == .wifi {
                print("Reachable via WiFi")
                ClientNetType = 5
               } else {
                print("Reachable via Cellular") // cellular  蜂窝网（移动网络）
                let info = CTTelephonyNetworkInfo()
                let currentStatus = info.currentRadioAccessTechnology
                if #available(iOS 14.1, *) {
                    switch currentStatus {
                    case CTRadioAccessTechnologyGPRS,
                         CTRadioAccessTechnologyEdge,
                         CTRadioAccessTechnologyCDMA1x:
                        print("2G")
                        ClientNetType = 2
                    case CTRadioAccessTechnologyHSDPA,
                         CTRadioAccessTechnologyHSUPA,
                         CTRadioAccessTechnologyCDMAEVDORev0,
                         CTRadioAccessTechnologyCDMAEVDORevA,
                         CTRadioAccessTechnologyCDMAEVDORevA,
                         CTRadioAccessTechnologyWCDMA,
                         CTRadioAccessTechnologyeHRPD:
                        print("3G")
                        ClientNetType = 3
                    case CTRadioAccessTechnologyLTE:
                        print("4G")
                        ClientNetType = 4
                    case CTRadioAccessTechnologyNRNSA,CTRadioAccessTechnologyNR:
                        print("5G")
                        ClientNetType = 7
                    default:
                        print("0G")
                    }
                } else {
                    switch currentStatus {
                    case CTRadioAccessTechnologyGPRS,
                         CTRadioAccessTechnologyEdge,
                         CTRadioAccessTechnologyCDMA1x:
                        print("2G")
                        ClientNetType = 2
                    case CTRadioAccessTechnologyHSDPA,
                         CTRadioAccessTechnologyHSUPA,
                         CTRadioAccessTechnologyCDMAEVDORev0,
                         CTRadioAccessTechnologyCDMAEVDORevA,
                         CTRadioAccessTechnologyCDMAEVDORevA,
                         CTRadioAccessTechnologyWCDMA,
                         CTRadioAccessTechnologyeHRPD:
                        print("3G")
                        ClientNetType = 3
                    case CTRadioAccessTechnologyLTE:
                        print("4G")
                        ClientNetType = 4
                    default:
                        print("0G")
                    }
                }
               }
           }
            reachability.whenUnreachable = { _ in
               print("Not reachable")
                ClientNetType = 1
           }

           do {
               try reachability.startNotifier()
           } catch {
               print("Unable to start notifier")
           }

           }
       }
   
   
}
