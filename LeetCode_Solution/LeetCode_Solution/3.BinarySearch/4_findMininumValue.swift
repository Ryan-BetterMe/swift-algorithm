//
//  4_findMininumValue.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/12/10.
//

import Foundation

// 通过二分法寻找旋转数组的最小值
func findMin(_ nums: [Int]) -> Int {
    // 这里的核心就是left和right
    // 也就是说我的比较其实是以left或者right为锚点的！！！
    // 左侧的顺序是不确定的，但是右侧肯定是升序，所以这里我以右侧作为锚点！！
    
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        let mid = (left + right)/2
        
        if nums[mid] == nums[right] {
            
            return nums[mid]
            
        } else if nums[mid] > nums[right] {
            
            left = mid + 1
            
        } else if nums[mid] < nums[right] {
            
            right = mid
        }
    }
    return nums[left]
}
