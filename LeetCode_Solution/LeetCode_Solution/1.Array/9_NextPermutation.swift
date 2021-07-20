//
//  9_NextPermutation.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/20.
//
// 题目描述：
// 实现获取 下一个排列 的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。
// 如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。
// 必须 原地 修改，只允许使用额外常数空间。

import Foundation

// 最坏时间复杂度是O(n) + O（n） + O(n) = O(3n) 其实就是O（n）
func nextPermutation(_ nums: inout [Int]) {
    let length = nums.count
    
    guard length > 1 else { return }
    
    var k = length - 1
    
    // 1、第一层循环，获取第一个小于可变化元素 index 为（k-1）
    while (k - 1) >= 0 {
        if nums[k] > nums[k - 1] {
            var n = length - 1
            
            // 2、第二层循环，查询到具体的可以和 k - 1个元素互换饿
            while n >= k {
                if nums[n] <= nums[k - 1] {
                    n -= 1
                } else {
                    // 交换
                    nums[k - 1] = nums[k - 1] + nums[n]
                    nums[n] = nums[k - 1] - nums[n]
                    nums[k - 1] = nums[k - 1] - nums[n]
                    break
                }
            }
            break
        }
        
        k = k - 1
    }
    
    // 4、交换 K + 1 .... length - 1 的顺序
    var i = k
    
    var j = length - 1
    
    while i < j {
        let temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
        
        i += 1
        j -= 1
    }
}

