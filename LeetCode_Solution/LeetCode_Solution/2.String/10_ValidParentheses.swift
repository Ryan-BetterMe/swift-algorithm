//
//  10_ValidParentheses.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/8/25.
//
/* 有效的括号
 
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。

 示例 1：

 输入：s = "()"
 输出：true
 示例 2：

 输入：s = "()[]{}"
 输出：true
 */

import Foundation

// 我的解题思路
// 1.将左括号推入栈
// 2.如果有一个右括号就和栈尾元素相比，如果相同，则移除
// 3.最后看栈元素的个数，如果是空的，就说明一一匹配了
func isValid(_ s: String) -> Bool {
    guard s.count%2 == 0 else { return false }

    var stack: [Character] = []

    let map: [Character: Character] = ["}": "{",
                                       "]": "[",
                                       ")": "("]

    for element in s {
        if element == "(" || element == "[" || element == "{" {
            stack.append(element)
            continue
        }
        
        let value = map[element]

        if let last = stack.last, last == value {
            stack.removeLast()
        } else {
            return false
        }
    }

    if stack.count == 0 {
        return true
    } else {
        return false
    }
}


// 这一种方法是非常容易看懂的
func isValid2(_ s: String) -> Bool {
    var stack: [Character] = []
    
    for element in s {
        switch element {
        case "(":
            stack.append(element)
        case "[":
            stack.append(element)
        case "{":
            stack.append(element)
        case ")":
            if stack.isEmpty || stack.popLast() != "(" {
                return false
            }
        case "]":
            if stack.isEmpty || stack.popLast() != "[" {
                return false
            }
        case "}":
            if stack.isEmpty || stack.popLast() != "{" {
                return false
            }
        default:
            break
        }
    }
    
    return stack.isEmpty
}
