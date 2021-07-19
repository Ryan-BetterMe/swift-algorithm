//
//  6_4Sum.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/19.
//
/*
 题目描述：
 给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。
 
 注意：答案中不包含重复的四元组

 示例 1:
 输入：nums = [1,0,-1,0,-2,2], target = 0
 输出：[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 
 */

import Foundation

public func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    guard nums.count >= 4 else { return [] }
    
    var result = [[Int]]()
    let sortedArray = nums.sorted()
    
    // 1、不重复的第一个元素
    for index in 0..<sortedArray.count-3 {
        if index > 0 && sortedArray[index] == sortedArray[index-1] {
            continue
        }
        
        // 2、计算剩下的三个数的和的值为Offset
        let offset1 = target - sortedArray[index]
        
        // 3、不重复的第二个元素
        for i in (index+1)..<sortedArray.count-2 {
            if i > index + 1 && sortedArray[i] == sortedArray[i - 1] {
                continue
            }
            
            // 4、计算剩下的两个数的和的值为Offset
            let offset2 = offset1 - sortedArray[i]
            var j = i + 1
            var k = sortedArray.count - 1
            
            // 5、使用双指针法，计算两个数的和
            while j < k {
                let sum = sortedArray[j] + sortedArray[k]
                
                // 6、确保第三个元素，和第四个元素不重复
                if sum == offset2 {
                    result.append([sortedArray[index], sortedArray[i], sortedArray[j], sortedArray[k]])
                    
                    j += 1
                    k -= 1
                    
                    while j < k && sortedArray[j] == sortedArray[j-1] {
                        j += 1
                    }
                    while j < k && sortedArray[k] == sortedArray[k+1] {
                        k -= 1
                    }
                }
                
                if sum > offset2 {
                    k -= 1
                }
                
                if sum < offset2 {
                    j += 1
                }
            }
        }
    }
    return result
}
