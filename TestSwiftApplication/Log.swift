//
//  Log.swift
//  TestSwiftApplication
//
//  Created by apple on 2021/6/18.
//

import Foundation

func log(_ msg: String) {
    #if DEBUG
    print(msg)
    #endif
}

func test() {
    print(#file,#line,#function)
}


func print<T>(_ msg: T,file: NSString = #file,line:Int = #line,fn:String = #function) {
    #if DEBUG
    let prefix = "\(file.lastPathComponent)_\(line)_\(fn):"
    print(prefix,msg)
    #endif
}


