//
//  5_FineMininumValue2.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/12/10.
//

import Foundation

func findMinWithDuplicated(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        let mid = (left + right)/2
        
        while left < mid  && nums[left] == nums[mid] {
            left = left + 1
        }
        
        /// 这里一定要注意：比如说[2, 0, 1, 1, 1]
        /// 所以说当nums[mid] == nums[right]的时候，情况是很多样的！
        if nums[mid] == nums[right] {
            if nums[left] < nums[mid] {
                right = mid - 1
            } else {
                left = left + 1
            }
        } else if nums[mid] > nums[right] {
            left = mid + 1
        } else if nums[mid] < nums[right] {
            right = mid
        }
    }
    
    return nums[left]
}
