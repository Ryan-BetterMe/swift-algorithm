//
//  3_ContainerMostWater.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/19.
//
/* 题目描述
 
给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

说明：你不能倾斜容器。

*/

import Foundation

/* 通过双指针法向中间收敛，那么问题来了？为什么这是可行的，总感觉缺少了一些遍历条件？
   这里给出两种解释，第一种是直接解释法：
   1、最宽的边（使用首行 和 未行）是很好的初始条件，因为他的宽度是最长的。它的水的高度是首行和末行中最小边的高度。
   2、所有其它的都没那么宽，那么如果想要容纳更多的水，必须要更高的高度。
   3、首行和末行中不可能使其容纳更多的水，所以短边可以安全地从中被移除！
 
   第二种解释：
   假设a1 <= an 这意味着什么呢？S(1,2)，S(1,3).... S(1,n) <= S(1,n)
   所以可以理解为在第一次遍历中，消除了n - 2种可能性
 
   这个时候左指针指向在2，右指针依然在n, 我们假设a2 > an
   显然的：S(2,n),S(3,n)...S(n-1,n) <= S(2,n)
   所以在第二次遍历中，我们消除了n-3中可能性
 
   我们一直遍历，直到左右指针相遇！
*/
public func maxArea(_ height: [Int]) -> Int {
    var i = 0
    var j = height.count - 1
    var water = 0
    
    while i < j {
        water = max(water, (j - i) * min(height[i], height[j]))
        
        if height[i] <= height[j] {
            i += 1
        } else {
            j -= 1
        }
    }
    
    return water
}
