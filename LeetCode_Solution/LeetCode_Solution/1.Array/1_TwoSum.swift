//
//  1_TwoSum.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/19.
//
/*
给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target的那两个整数，并返回它们的数组下标。

你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

你可以按任意顺序返回答案。

示例1： 输入：nums = [2,7,11,15], target = 9 输出：[0,1] 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。

示例 2： 输入：nums = [3,2,4], target = 6 输出：[1,2]

进阶：你能想出一个时间复杂度小于O(n²)的算法吗？
 */
import Foundation

/// 解法：使用hash-map这种数据结构，将value作为key，index作为value保存到字典中，通过比较新的差值是否在字典中，倒查相应的index值！
public func twoSum(_ nums:[Int], _ taget: Int) -> [Int] {
    var map = [Int: Int]()
    
    for (index, value) in nums.enumerated() {
        let offset = taget - value
        
        if map.keys.contains(offset) {
            return [map[offset]!, index]
        }
        map[value] = index
    }
    return []
}
