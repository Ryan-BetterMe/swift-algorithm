//
//  8_RemoveElement.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/19.
//
//  题目描述：
//  给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。
//
//  不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。
//
//  元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。

import Foundation

/// 通过一个参数记录下保存的移除重复元素后的新数组！
public func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    let length = nums.count
    
    // 要注意处理长度为1的情况！
    guard length > 0 else { return length }
    
    var keep = 0
    
    for i in 0..<length {
        if nums[i] != val {
            nums[keep] = nums[i]
            keep += 1
        }
    }
    
    nums.removeLast(length - keep)
    return keep
}


