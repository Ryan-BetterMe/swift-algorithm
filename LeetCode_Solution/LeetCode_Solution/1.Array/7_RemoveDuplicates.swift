//
//  7_RemoveDuplicates.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/19.
//
// 题目描述：
// 给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。

// 不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

import Foundation

// 时间复杂度O(n), 空间复杂度O(1)
public func removeDuplicates(_ nums: inout [Int]) -> Int {
    // 1、count使用了三次，所以这里初始化
    let length = nums.count
    
    guard length > 1 else { return length }
    
    // 2、keep表示一开始只能确认开始一个元素是必定保存的 即 首元素
    var keep = 1
    for i in 1..<length {
        // 3、如果有一个元素不和前一个元素重复，那么K值 + 1；同时赋值第K个元素
        if (nums[i] != nums[i-1]) {
            nums[keep] = nums[i]
            keep += 1
        }
    }
    
    // 4、移除后续所有未保存的元素
    nums.removeLast(length - keep)
    
    return keep
}
