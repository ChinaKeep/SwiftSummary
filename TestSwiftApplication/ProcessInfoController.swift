//
//  ProcessInfoController.swift
//  TestSwiftApplication
//
//  Created by Keep on 2021/6/24.
//

import UIKit

class ProcessInfoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // 创建系统进程信息对象
        let processInfo: ProcessInfo = ProcessInfo.processInfo
        //返回当前进程参数
        // 以 NString 对象数组的形式返回当前进程的参数
        let processArguments: NSArray = processInfo.arguments as NSArray
        print("processArguments:\(processArguments)")
        //ProcessInfoController.swift_19_viewDidLoad(): processArguments:(
//        "/Users/keep/Library/Developer/CoreSimulator/Devices/630510ED-81B0-423A-A7EC-9CA6106FA256/data/Containers/Bundle/Application/9D161CB0-3211-471E-A4A5-C29744A5C703/TestSwiftApplication.app/TestSwiftApplication"
//    )
        // 返回当前的环境变量
        let processEnvironment:NSDictionary = processInfo.environment as NSDictionary
               
           // 返回进程标识符
           let processId:Int32 = processInfo.processIdentifier
               
           // 返回进程数量
           let processCount:Int = processInfo.processorCount
               
           // 返回活动的进程数量
           let activeProcessCount:Int = processInfo.activeProcessorCount
               
           // 返回正在执行的进程名称
           let processName:String = processInfo.processName
               
           // 生成单值临时文件名
           /*
               每次调用这个方法时，都返回不同的单值字符串，可以用这个字符串生成单值临时文件名
           */
           let uniqueString:String = processInfo.globallyUniqueString
        
        // 返回主机系统的名称
            let hostName:String = processInfo.hostName
                
            // 返回操作系统的版本号
        let osVerson:OperatingSystemVersion = processInfo.operatingSystemVersion
                
            let majorVersion:Int = osVerson.majorVersion
            let minorVersion:Int = osVerson.minorVersion
            let patchVersion:Int = osVerson.patchVersion
                
            // 返回操作系统名称
            let osName:String = processInfo.operatingSystemVersionString
                
            // 设置当前进程名称
            /*
                应当谨慎的使用这个方法因为关于进程名称存在一些假设
            */
            processInfo.processName = "test"
                
            // 判断系统版本是否高于某个版本
        let opsVession:OperatingSystemVersion = OperatingSystemVersion(majorVersion: 10,
                                                                               minorVersion: 10,
                                                                               patchVersion: 4)
                
        let bl:Bool = processInfo.isOperatingSystemAtLeast(opsVession)
                
            // 返回系统运行时间
        let timeInterval:TimeInterval = processInfo.systemUptime
        
    }
    


}
