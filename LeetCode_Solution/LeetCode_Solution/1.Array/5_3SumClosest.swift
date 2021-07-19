//
//  5_3SumClosest.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/19.
//
/* 题目描述
 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
 
 示例：

 输入：nums = [-1,2,1,-4], target = 1
 输出：2
 解释：与 target 最接近的和是 2 (-1 + 2 + 1 = 2)
 */
import Foundation

/// 解法：直接双层遍历完
/// 给定一个初始值result  进行第一次遍历
/// 在第二次遍历的过程中，使用双指针全部遍历完！最后返回result即可
public func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count >= 3 else { return 0 }
    
    let param = nums.sorted()
    
    var result = nums[0] + nums[1] + nums[2]
    
    for (index, value) in param.enumerated() {
        var i = index + 1
        var j = param.count - 1
        
        while i < j {
            let temp = param[i] + param[j] + value
            
            if abs(temp - target) < abs(result - target) {
                result = temp
            }
            
            if temp > target {
                j -= 1
            }
            if temp <= target {
                i += 1
            }
        }
    }
    return result
}
