//
//  2_MedianOfSortedArray.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/17.
//
//  题目描述：
//
//  给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。
//
//  示例 1： 输入：nums1 = [1,3], nums2 = [2] 输出：2.00000 解释：合并数组 = [1,2,3] ，中位数 2
//
//  示例 2： 输入：nums1 = [1,2], nums2 = [3,4] 输出：2.50000 解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5
//
//  示例 3： 输入：nums1 = [0,0], nums2 = [0,0] 输出：0.00000

import Foundation

///  解法一：使用归并的方式，合并两个有序数组，得到一个大的有序数组。大的有序数组的中间位置的元素，即为中位数。
///
///  时间复杂度 O(m + n)   空间复杂度 O(m + n)
///
///  以下是第一种解法的实现
///
///  解法二：不需要合并，只需要找到中位数就可以了。已知两个数组长度，所以已知中位数的下标。维护两个指针，初始时指向两个数组的初始位置，
///        每次将指针指向的值小的后移一位（如果一个指针已经到达数组末尾，则只需要移动另一个数组的指针），直到到达中位数的位置。
///
///  时间复杂度为 O(m + n)  空间复杂度O(1)
public func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var mergedArray: [Int] = []
    
    var a = 0, b = 0
    
    while (a < nums1.count && b < nums2.count) {
        if nums1[a] <= nums2[b] {
            mergedArray.append(nums1[a])
            a += 1
        } else {
            mergedArray.append(nums2[b])
            b += 1
        }
    }
    
    for index in a..<nums1.count {
        mergedArray.append(nums1[index])
    }
    
    for index in b..<nums2.count {
        mergedArray.append(nums2[index])
    }
    
    // 求中位数 【0 1 2 3 4】
    if mergedArray.count == 0 {
        return 0.0
    }
    
    if mergedArray.count == 1 {
        return Double(mergedArray[0])
    }
    
    let centerIndex = mergedArray.count / 2
    if centerIndex * 2 == mergedArray.count {
        return Double(mergedArray[centerIndex] + mergedArray[centerIndex - 1]) / 2.0
    } else {
        return Double(mergedArray[centerIndex])
    }
}

/* 那么如何达到O(log(min(m, n)))呢? 一般对于时间复杂度有log要求的都需要二分查找
 想一想题目是求中位数，其实就是求第K小数的一种特殊情况，使用二分法，一半一半的排除K值
  - 如果总长度为偶数：那么需要找到第 N / 2 小的元素，第N / 2 + 1 小的元素
  - 如果中长度为奇数：那么需要找到第 N / 2  + 1小的元素

  那个K等于多少呢？ 奇数和偶数都适用
  trick：不管是奇数和偶数中位数都等于 第(n + m + 1) / 2个元素 和 第(n + m + 2)/2 个元素 除以二

  如果一个数组A 【1， 2， 5， 6】数组B【3， 4，7， 8】
  我们既然要求第K小的数，这里又需要log的时间复杂度，所以呢，我们使用二分法求，先求第k/2个最小的数即可
  【第一步】比较A[k/2 - 1] 和 B[k/2 - 1]的值的大小，如果A[k/2 - 1] <= B[k/2 - 1] 所以，排除A[0]到A[k/2-1]个元素
   为什么可以这样排除呢？
   我们来看看A[k/2 - 1]最大是第几个元素呢？最大无非就是B[0]...B[k/2 - 2] A[0]...A[k/2-1] 那么A[k/2-1]是k/2 + k/2 - 1 = k - 1 也就是说我排除的元素也只可能是第K-1小的元素
 
   【第二步] 已经排除了k/2个元素，那么只需要在剩下的数组中找第(k - k/2)小的元素即可
 
   那么这个递归的基准条件是什么呢？
   1、当最小数组个数为0，那么只需要找large[k-1]即可
   2、当k=1的时候，比较A【0】和B【0】最小值即可
 */

public func findMedianSortedArrays2(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let n = nums1.count
    let m = nums2.count
    
    let left = (n + m + 1)/2
    let right = (n + m + 2)/2
    
//    return Double(getKthElement(nums1, nums2, left) + getKthElement(nums1, nums2, right)) / 2.0
    
    return Double(getKthElementWithoutNewArray(nums1, 0, nums2, 0, left) + getKthElementWithoutNewArray(nums1, 0, nums2, 0, right)) / 2.0
}

/// 获取第K小的元素
func getKthElement(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
    let length1 = nums1.count
    let length2 = nums2.count
    
    if length1 > length2 {
        return getKthElement(nums2, nums1, k)
    }
    
    if length1 == 0 {
        return nums2[k - 1]
    }
    
    if k == 1 {
        return min(nums1[0], nums2[0])
    }
    
    let elementOne: Int
    let last: Int
    if (k/2 - 1) < length1 {
        elementOne = nums1[k/2 - 1]
        last = k/2 - 1
    } else {
        elementOne = nums1[length1 - 1]
        last = length1 - 1
    }
    
    let elementTwo = nums2[k/2 - 1]
    
    var temp1 = nums1
    var temp2 = nums2
    if elementOne <= elementTwo {
        temp1.removeSubrange(0...last)
        return getKthElement(temp1, temp2, k - (last + 1))
    } else {
        temp2.removeSubrange(0...k/2-1)
        return getKthElement(temp1, temp2, k - (k/2))
    }
}

func getKthElementWithoutNewArray(_ nums1: [Int], _ start1: Int, _ nums2: [Int], _ start2: Int, _ k: Int) -> Int {
    let length1 = nums1.count - start1
    
    let length2 = nums2.count - start2
    
    if length1 > length2 {
        return getKthElementWithoutNewArray(nums2, start2, nums1, start1, k)
    }
    
    if length1 == 0 {
        return nums2[start2 + k - 1]
    }
    
    if k == 1 {
        return min(nums1[start1], nums2[start2])
    }
    
    // 开始计算了
    let elementOne: Int
    var last: Int
    
    if k/2 < length1 {
        elementOne = nums1[start1 + k/2 - 1]
        last = start1 + k/2 - 1
    } else {
        elementOne = nums1[nums1.count - 1]
        last = nums1.count - 1
    }

    let elementTwo = nums2[start2 + k/2 - 1]
    
    if elementOne <= elementTwo {
        return getKthElementWithoutNewArray(nums1, last + 1, nums2, start2, k - (last - start1 + 1))
    } else {
        return getKthElementWithoutNewArray(nums1, start1, nums2, start2 + k/2, k - (k/2))
    }
}
