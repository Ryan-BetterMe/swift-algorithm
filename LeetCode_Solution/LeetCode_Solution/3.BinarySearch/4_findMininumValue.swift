//
//  4_findMininumValue.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/12/10.
//

import Foundation

func findMin(_ nums: [Int]) -> Int {
    // 1、找到转折点
    var center = 0
    var i = 1
    
    while i < nums.count {
        if nums[i] >= nums[i-1] {
            i += 1
        } else {
            center = i
            break
        }
    }
    
    // 2、找到最小值
    return nums[center]
}
