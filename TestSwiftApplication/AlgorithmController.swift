
//
//  AlgorithmController.swift
//  2021-05-Swift
//
//  Created by 随风流年 on 2021/6/10.
//  Copyright © 2021 Keep. All rights reserved.
//

import UIKit

class AlgorithmController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = "基础算法"
   
        var nums = [10,1,2,9,19,5,3,8,13,17]
        bubbleSortMethod(&nums)
    
        print("选择排序")
        let oringeList = [10,1,2,9,-1,7,19,5,-9,3,8,13,17]
        let afterList = selectionSortMethod(oringeList)
        print(oringeList)
        print("======")
        print(afterList)
        
        print("斐波那契数列")
        print(fib(29))
        
    }
    /// Mark -- 冒泡
    func bubbleSortMethod(_ nums: inout [Int]) {
        var icount = 0 //记录外层循环次数
        var jcount = 0 //记录内层循环交换次数
        let n = nums.count
        for i in 0..<n {
            icount += 1
            for j in 0..<(n-1-i) {
                jcount += 1
                if nums[j] > nums[j+1] {
                    nums.swapAt(j, j+1)
                    print(nums)
                }
            }
        }
        print("外层交换次数:\(icount)","交换次数:\(jcount)")
    }
    ///pragram mark --- 选择排序 ---
    /**
     选择排序（Selection sort)是一种简单直观的排序算法
     工作原理： 第一次从待排序的数据元素中选出最小（或最大）的一个元素，存放在序列的起始位置
     然后再从剩余的未排序元素中寻找最小（大）元素，然后放到已排序的序列的末尾。
     以此类推，知道全部待排序的数据元素的个数为0
     选择排序是不稳定的排序方法
     */
    func selectionSortMethod(_ nums:[Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        var array = nums
        var minIndex: Int
        for i  in 0..<array.count - 1 {
            minIndex = i
            for j  in i + 1 ..< array.count {
                if array[j] < array[minIndex] {
                    minIndex = j
                }
            }
            if i != minIndex {
                array.swapAt(i, minIndex)
            }
        }
        return array
    }
    //斐波那契数列
    func fib(_ number: Int) -> Int {
        guard number > 1 else {
            return number
        }
        return fib(number - 1) + fib(number - 2)
    }
    /**
     假设用方法f(n)来求取总共有多少种跳法？？
     n为台阶总数。那么5层台阶的跳法就是f(5),
     第一次跳，可能跳1层或者2层,那么f(5) = 1 + f(4)或者2+f(3);
     第二次跳，可能跳1层或者2层，那么f(4) = 1 + f(3)或者2+f(2);
     f(3) = 1 + f(2)或者 2 + f(1);
     f(2) = 1 + f(1) 或者2 + f(0);
     f(1) = 1 + f(0);
     当台阶数 n = 0时，总共跳法 f(0) = 0
     f(5) = 1 +
     
     */
}













