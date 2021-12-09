//
//  12_ImplementStrStr.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/8/28.
//
/*
 
 实现 strStr() 函数。

 给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串出现的第一个位置（下标从 0 开始）。如果不存在，则返回  -1 。

 说明：
 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与 C 语言的 strstr() 以及 Java 的 indexOf() 定义相符。

 示例 1
 输入：haystack = "hello", needle = "ll"
 输出：2
 
 示例 2:
 输入：haystack = "aaaaa", needle = "bba"
 输出：-1
 
 示例 3：
 输入：haystack = "", needle = ""
 输出：0
 */


import Foundation

func strStr(_ haystack: String, _ needle: String) -> Int {
    guard needle.count > 0 else { return 0 }
    
    guard haystack.count >= needle.count else { return -1 }
    
    let stackArray = Array(haystack)
    let needleArray = Array(needle)
    
    var left = 0
    
    while left <= stackArray.count - needle.count {
        let tempLeft = left
        
        for (index, element) in needleArray.enumerated() {
            if element != stackArray[left + index] {
                left = left + 1
                break
            }
        }
        
        if tempLeft == left {
            return left
        }
    }
    
    return -1
}

// KMP算法！！！
func strStr02(_ haystack: String, _ needle: String) -> Int {
    guard needle.count > 0 else { return 0 }
    
    guard haystack.count >= needle.count else { return -1 }
    
    
    let next = createNext(needle)
    
    var j = 0
    
    /// aaabaaabbbabaa
    /// 0123456789
    ///    babb
    ///   -1 0 0 1
    let a = Array(haystack)
    let b = Array(needle)
    let m = b.count
    
    for i in 0..<a.count {
        // babc
        // babd
        // -1001
        while j > 0 && a[i] != b[j] {
            j = next[j]
        }
        
        if a[i] == b[j] {
            j = j + 1
        }
        
        if j == m {
            return i - m + 1
        }
    }
    
    return -1
}

func createNext(_ pattern: String) -> [Int] {
    let strArray = Array(pattern)
    var nextArray = Array(repeating: 0, count: strArray.count)
    
    nextArray[0] = 0
    var length = 0
    var i = 1   // 因为第一个值为0，所以这里直接从模式字符串第一位开始
    let n = strArray.count
    
    while (i < n) {
        if (strArray[i] == strArray[length]) {
            length += 1
            nextArray[i] = length
            i += 1
        } else {
            if length > 0 {
                length = nextArray[length - 1]
            } else {
                nextArray[i] = length
                i += 1
            }
        }
    }
    
    nextArray.removeLast()
    nextArray.insert(-1, at:0)
    
    return nextArray
}
 
func createNextArray2(_ patternStr: String) -> [Int] {
    let pattern = Array(patternStr)
    
    var next = Array(repeating:0, count:pattern.count)
    
    var len = 0  // 当前字符串的前后最长子串的长度
    
    // abbac
    // 0001
    for i in 1..<pattern.count {
        while len > 0 && pattern[i] != pattern[len] {
            len = next[len-1]
        }
        
        if pattern[i] == pattern[len] {
            len += 1
            next[i] = len
        }
    }
    
    next.removeLast()
    next.insert(-1, at: 0)
    
    return next
}
