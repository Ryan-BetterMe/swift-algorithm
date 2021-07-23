//
//  15_CombinationSum.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/23.
//
// 题目描述：给定一个无重复元素的正整数数组 candidates 和一个正整数 target ，找出 candidates 中所有可以使数字和为目标数 target 的唯一组合。
// candidates 中的数字可以无限制重复被选取。如果至少一个所选数字数量不同，则两种组合是唯一的。
// 对于给定的输入，保证和为 target 的唯一组合数少于 150 个。
//示例 1：
//输入: candidates = [2,3,6,7], target = 7
//输出: [[7],[2,2,3]]
//
//
//示例 2：
//输入: candidates = [2,3,5], target = 8
//输出: [[2,2,2,2],[2,3,3],[3,5]]

import Foundation

/// 解法一：这就是一个排列组合的问题，采用回溯算法即可
/// 但是回溯算法不可避免的会造成时间复杂度过大
public func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let length = candidates.count
    
    guard length > 0 else { return [] }
    
    var result = [[Int]]()
    
    func recursion(path: [Int], startIndex: Int) {
        let sum = path.reduce(0) { $0 + $1 }
        if sum == target {
            result.append(path)
            return
        }
        if sum > target {
            return
        }
        
        // 这里每次都需要创建新的数组来保存
        for index in startIndex...candidates.count - 1 {
            var temp = path
            temp.append(candidates[index])
            
            recursion(path: temp, startIndex: index)
        }
    }
    
    recursion(path: [], startIndex: 0)
    
    return result
}

/// 方法二：方法都一样，都是回溯算法，但是不同的是，这里使用了一个数组来保存路径！
public func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    
    var current = [Int]()
    func recursion(path: inout [Int], _ start: Int, _ reminder: Int) {
        if reminder == 0 {
            let temp = path
            result.append(temp)
            return
        }
        
        if reminder < 0 {
            return
        }
        
        for index in start...candidates.count - 1 {
            path.append(candidates[index])
            recursion(path: &path, index, reminder - candidates[index])
            path.removeLast()
        }
    }
    
    recursion(path: &current, 0, target)
    
    return result
}



