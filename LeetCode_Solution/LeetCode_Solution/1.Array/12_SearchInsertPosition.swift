//
//  12_SearchInsertPosition.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/21.
//
/* 题目描述：
 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

 请必须使用时间复杂度为 O(log n) 的算法。
 */

import Foundation

// 简单的二分查找，没什么困难的
// 主要问题在于最后的边界情况需要处理！！！
public func searchInsert(_ nums:[Int], _ target: Int) -> Int {
    let length = nums.count
    
    guard length > 0 else { return 0 }
    
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let mid = (left + right)/2
        
        if target == nums[mid] {
            return mid
        }
        
        if target < nums[mid] {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    if left > right {
        return left
    } else {
        return right < 0 ? 0 : right
    }
}
