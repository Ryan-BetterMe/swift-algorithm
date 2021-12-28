//
//  3_SearchRotatedSortedArray.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/12/10.
//

import Foundation

// 哪有这种二分法啊？？拜托，一定要看好！
func search(_ nums: [Int], _ target: Int) -> Bool {
    // 1、先找到哪个地方断开的
    var center = 0

    var i = 1
    while i < nums.count {
        if nums[i] >= nums[i-1] {
            center = i
            i += 1
        } else {
            break
        }
    }

    // 2、将其分开两段，然后再分别寻找
    var left = 0
    var right = nums.count - 1

    if target == nums[center] {
        return true
    } else if target > nums[center] {
        return false
    } else if target < nums[center] {
        if target >= nums[0] {
            right = center
        } else {
            left = center + 1
        }
    }

    // 3、确定了分段之后，开始寻找
    while left <= right {
        let mid = (left + right)/2

        if target == nums[mid] {
            return true
        } else if target > nums[mid] {
            left = mid + 1
        } else if target < nums[mid] {
            right = mid - 1
        }
    }

    return false
}

// 在一个已经旋转好且已经分段的数组中寻找target值
func search222(_ nums: [Int], _ target: Int) -> Bool {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        var mid = (left + right)/2
        
        if nums[mid] == target {
            return true
        }
        
        // 和第一种题目有区别的在于有可能有重复元素，特别是收尾都重复的情况
        while (left < mid && nums[left] == nums[mid]) {
            left = left + 1
        }
        
        /*这种题目说白了就是寻找锚点：
        
        因为旋转到左侧来了，所以我们以左侧left为锚点，
        那么就有两种情况：
        第一种：left - mid 区间已经排序了
        第二种：left - mid 区间没有排序
        */
        
        // 前半段没有旋转
        if nums[mid] >= nums[left] {
            if target < nums[mid] && target >= nums[left] {
                right = mid - 1
            } else {
                left = mid + 1
            }
            
        // 后半段没有旋转
        } else {
            if target > nums[mid] && target <= nums[right] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }
    
    return false
}
