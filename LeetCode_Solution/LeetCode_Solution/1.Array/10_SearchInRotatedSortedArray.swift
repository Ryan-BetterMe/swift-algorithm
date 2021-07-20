//
//  10_SearchInRotatedSortedArray.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/20.
//
/*
 题目描述：搜索旋转排序数组
 整数数组 nums 按升序排列，数组中的值 互不相同 。

 在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 在下标 3 处经旋转后可能变为 [4,5,6,7,0,1,2] 。

 给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的下标，否则返回 -1 。


 输入：nums = [4,5,6,7,0,1,2], target = 0
 输出：4

 输入：nums = [4,5,6,7,0,1,2], target = 3
 输出：-1
 */

import Foundation

/* 既然是O（logn）肯定需要使用二分法
   解法1：一个很有意思的思路，先根据和nums[0] 和 target的关系来判断是左端还是右端
   例如 target = 5, 目标值在左半段，因此在 [4, 5, 6, 7, inf, inf, inf] 这个有序数组里找就行了；
   例如 target = 1, 目标值在右半段，因此在 [-inf, -inf, -inf, -inf, 0, 1, 2] 这个有序数组里找就行了。
 
   这样就将它转化为正常的二分查找了。靠，太巧妙了！
 */

public func search(_ nums: [Int], _ target: Int) -> Int {
    var array = nums
    var start = 0
    var end = array.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        if (array[mid] == target) { return mid }
        
        // 1、目标值在左边半段
        if target >= array[0] {
            // 但是mid在右半段，那么这个时候将mid的值改为max
            if (array[mid] < array[0]) {
                array[mid] = Int.max
            }
        // 2、目标值在右边半段
        } else {
            // 但是mid在左半段，那么这个时候将mid的值改为min
            if (array[mid] >= array[0]) {
                array[mid] = Int.min
            }
        }
        
        // 3、正常的二分查找了！
        if (array[mid] > target) {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return -1
}

/// 方法二：直接对数组进行二分查找，只是需要进行条件判断！
/// 先根据 nums[mid] 与 nums[left] 的关系判断 mid 是在左段还是右段，接下来再判断 target 是在 mid 的左边还是右边，从而来调整左右边界 lo 和 hi。
public func search2(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let mid = (left + right)/2
        
        if nums[mid] == target { return mid }
        
        // 先根据 nums[mid] 与 nums[lo] 的关系判断 mid 是在左段还是右段
        // 要注意：其实这里主要防备的就是左右两段存在的情况，否则就是有序的单端，就是常规的二分法即可
        // 1、若两段：必左段
        if nums[mid] >= nums[left] {
            if (target >= nums[left] && target < nums[mid]) {
                right = mid - 1
            } else {
                left = mid + 1
            }
        // 2、若两段：必右端
        } else {
            if (target <= nums[right] && target > nums[mid]) {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }
    return -1
}



