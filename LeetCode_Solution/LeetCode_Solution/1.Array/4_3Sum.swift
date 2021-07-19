//
//  4_3Sum.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/19.
//
//  题目描述：
/*  给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。
    注意：答案中不可以包含重复的三元组。

    示例 1：
    输入：nums = [-1,0,1,2,-1,-4]
    输出：[[-1,-1,2],[-1,0,1]]
 
    示例 2：
    输入：nums = []
    输出：[]
 
    示例 3：
    输入：nums = [0]
    输出：[]
*/

import Foundation

/*
因为结果是有序的，所以这里我们可以使用排序后的数组
要计算三数之和其实一层迭代之后只需要计算两数之和即可。
即 let target = -value 两数之和等于target 由于数组有序，所以这里可以采用双指针的方法求和！
 
但是要注意：因为不允许结果重复的，所以三个元素，每一轮开始或者结束时，每一个元素都需要一直迭代到不一样的元素为止！
*/

public func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 3 else { return [] }
    
    var result: [[Int]] = []
    
    let param = nums.sorted()
    
    // [-1,0,1,0] -> [-1 0 0 1 2 2 2]
    for (index, value) in param.enumerated() {
        if index > 0 && value == param[index-1] {
            continue
        }
        
        let target = -value
        var i = index + 1
        var j = param.count - 1
        
        while i < j {
            if param[i] + param[j] == target {
                result.append([value, param[i], param[j]])
                i += 1
                j -= 1
                
                while (i < j && param[i] == param[i-1]) { i += 1 }
                while (i < j && param[j] == param[j+1]) { j -= 1 }
                continue
            }
            
            if param[i] + param[j] < target {
                i += 1
            }
            
            if param[i] + param[j] > target {
                j -= 1
            }
        }
    }
    return result
}
