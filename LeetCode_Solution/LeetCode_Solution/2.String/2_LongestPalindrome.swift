//
//  2_LongestPalindrome.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/8/2.
//
/** 最长回文子串
 
 给你一个字符串 s，找到 s 中最长的回文子串。

 示例 1:
 输入：s = "babad"
 输出："bab"
 解释："aba" 同样是符合题意的答案。
 
 示例 2：
 输入：s = "cbbd"
 输出："bb"
 
 示例 3：
 输入：s = "a"
 输出："a"
 
 示例 4：
 输入：s = "ac"
 输出："a"
 */

import Foundation

/// 暴力破解法，这种方法的时间复杂度是O(n^2)
func isPalindrome(_ s: String) -> String {

    guard s.count > 1 else { return s }

    let array = Array(s)
    var maxStr = ""
    
    for i in 0..<s.count {
        for j in i..<s.count {
            let str = Array(array[i...j]).map { "\($0)" }.joined(separator: "")
            
            if judgePalindromeString(str) && str.count > maxStr.count {
                maxStr = str
            }
        }
    }
    return maxStr
}

/// 判断是否为回文字符串
func judgePalindromeString(_ s: String) -> Bool {
    let array = Array(s)
    
    var i = 0
    var j = array.count - 1
    
    while i < j {
        if array[i] != array[j] {
            return false
        } else {
            i += 1
            j -= 1
        }
    }
    
    return true
}

/// 中心字符拓展法
func longestPalindrome2(_ s: String) -> String {
    guard s.count > 1 else { return s }
    
    let array = Array(s)
    var maxStr = "\(array[0])"
    
    for index in 0..<array.count - 1 {
        var odd = ""
        var even = ""
        
         // 奇数：以自己为中心向外拓张
        odd = maxCenterPalindrome(array, index, index)
    
         // 偶数：以自己和下一个元素一起为中心向外拓张
        if index + 1 < array.count && array[index] == array[index + 1] {
            even = maxCenterPalindrome(array, index, index + 1)
        }
        
        let max = odd.count >= even.count ?  odd : even
        
        if maxStr.count < max.count {
            maxStr = max
        }
    }
    
    return maxStr
}

func maxCenterPalindrome(_ s: Array<Character>, _ left: Int, _ right: Int) -> String {
    let count = s.count
    var i = left
    var j = right
    
    while i >= 0 && j <= count - 1 {
        if s[i] == s[j] {
            i -= 1
            j += 1
        } else {
            break
        }
    }
    
    // 这个时候的回文字符串呢？
    return Array(s[(i+1)..<j]).map { "\($0)" }.joined()
}



/// 马拉车算法
