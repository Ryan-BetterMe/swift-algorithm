//
//  7_RoomToInt.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/8/24.
//
/* 罗马数字转整数
 
 罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。

 字符          数值
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。

 通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：

 I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
 X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
 C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
 给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。

  

 示例 1:

 输入: "III"
 输出: 3
 
 */

import Foundation

// 采用枚举的方法，大力出奇迹，但是因为会有大量的字符串替换所以会比较慢
func romanToInt(_ s: String) -> Int {
    // IV 4 IX 9 XL 40 XC 90 CD 400 CM 900
    let dic: [String: Int] = ["CM": 900, "CD": 400, "XC": 90, "XL": 40, "IX": 9, "IV": 4]
    var temp = s
    var result = 0
    
    if temp.contains("CM") {
        result += dic["CM"] ?? 0
        temp = temp.replacingOccurrences(of:"CM", with:"")
    }
    
    if temp.contains("CD") {
        result += dic["CD"] ?? 0
        temp = temp.replacingOccurrences(of:"CD", with:"")
    }
    
    if temp.contains("XC") {
        result += dic["XC"] ?? 0
        temp = temp.replacingOccurrences(of:"XC", with:"")
    }
    
    if temp.contains("XL") {
        result += dic["XL"] ?? 0
        temp = temp.replacingOccurrences(of:"XL", with:"")
    }
    
    if temp.contains("IX") {
        result += dic["IX"] ?? 0
        temp = temp.replacingOccurrences(of:"IX", with:"")
    }
    
    if temp.contains("IV") {
        result += dic["IV"] ?? 0
        temp = temp.replacingOccurrences(of:"IV", with:"")
    }
    
    let array = Array(temp)
    
    for value in array {
        if value == "M" {
            result += 1000
        }
        
        if value == "D" {
            result += 500
        }
        
        if value == "C" {
            result += 100
        }
        
        if value == "L" {
            result += 50
        }
        
        if value == "X" {
            result += 10
        }
        
        if value == "V" {
            result += 5
        }
        
        if value == "I" {
            result += 1
        }
    }
    
    return result
}


// 这一道题非常简单，如果后面一个代表的比前面一个要大，那么直接相减即可
// 解法：从后向前遍历即可！！！
func romanToInt2(_ s: String) -> Int {
    let dic: [Character: Int] = ["I": 1, "V": 5,"X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    let array = Array(s)
    
    var result = 0
    var previous = 0
    
    // 简写的运算符会加大运算的时间
    for i in stride(from: array.count-1, through:0, by:-1) {
        let value = dic[array[i]]!
        
        if value >= previous {
            result = result + value
        } else {
            result = result - value
        }
        previous = value
    }
    
    return result
}
