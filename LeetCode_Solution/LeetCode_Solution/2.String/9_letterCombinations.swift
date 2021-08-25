//
//  9_letterCombinations.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/8/25.
//
/* 电话号码的字母组合
 
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。

 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。

 示例 1：

 输入：digits = "23"
 输出：["ad","ae","af","bd","be","bf","cd","ce","cf"]
 示例 2：

 输入：digits = ""
 输出：[]
 */


import Foundation

func letterCombinations(_ digits: String) -> [String] {
    guard digits.count > 0 else { return [] }
    
    var result =  [""]
    
    // 保存的map映射关系
    let map: [Character: String] = ["2": "abc",
                                    "3": "def",
                                    "4": "ghi",
                                    "5": "jkl",
                                    "6": "mno",
                                    "7": "qprs",
                                    "8": "tuv",
                                    "9": "wxyz"
                                   ]
    
    for digit in digits {
        // 数字对应的字符串 如 “abc”
        if let letters = map[digit] {
            // 使用中间字符数组，同时移除所有元素
            let temp = result
            result.removeAll()
            
            // 遍历原数组
            for str in temp {
                // 遍历接下来字符串中的每一个字符
                for letter in letters {
                    result.append(str+String(letter))
                }
            }
        }
    }
    return result
}
