//
//  11_FindFirstAndLast.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/21.
//
/*  题目描述：
//  给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
    如果数组中不存在目标值 target，返回 [-1, -1]。
 
    进阶：你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？
*/

import Foundation

// 解题思路：直接通过查找target所在的index，然后通过中间向两边拓展，找到边界即可！
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    let length = nums.count
    
    guard length > 0 else { return [-1, -1] }
    
    var left = 0
    var right = length - 1
    
    while left <= right {
        let mid = (left + right)/2
        
        if target == nums[mid] {
            var start = mid
            var end = mid
            
            while end < length - 1 && nums[end] == nums[end + 1] {
                end += 1
            }
            while start > 0 && nums[start] == nums[start - 1] {
                start -= 1
            }
            
            return [start, end]
        }
        
        if (target > nums[mid]) {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return [-1, -1]
}
