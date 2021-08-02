//
//  StringCommon.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/26.
//
/*
 给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。
 
 示例 1:
 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 
 示例 2:
 输入: s = "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 
 示例 3:
 输入: s = "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 
 示例 4:
 输入: s = ""
 输出: 0
 */

import Foundation

// 在swift中这种方式并不是很快的，原因在于String类型的移除和新增都是耗时操作，所以可以使用字典来代替
public func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.count > 0 else { return 0 }
    
    // 记录当前最长数量
    var maxCount = 0
    
    // 保存当前的字符串，即窗口
    var currentString = ""
    
    for char in s {
        // 1.当窗口包含重复字符时，从第一个开始移除 -> 缩小窗口
        while currentString.contains(char) {
            currentString.removeFirst()
        }
        
        // 2.当窗口不包含字符时，直接添加 -> 增加窗口
        currentString.append(char)
        if currentString.count > maxCount {
            maxCount = currentString.count
        }
    }
    
    return maxCount
}

/// 相比于第一种方式，这里我使用字典来代替字符串的操作
public func lengthOfLongestSubstring2(_ s: String) -> Int {
    guard s.count > 0 else { return 0 }
    
    // 最大长度
    var maxCount = 0
    // 记录end character
    var current: [Character: Int] = [:]
    // 窗口左指针
    var start = 0
    
    for (index, char) in s.enumerated() {
        // 如果发现了重复字符，那么移动左指针到已存在字符的右侧
        if let value = current[char], value >= start {
            start = value + 1
        }
        
        // 窗口右指针
        current[char] = index
        
        maxCount = (index - start + 1) > maxCount ? (index - start + 1) : maxCount
    }
    
    return maxCount
}

