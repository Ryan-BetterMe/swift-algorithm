//
//  3_SearchRotatedSortedArray.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/12/10.
//

import Foundation

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
