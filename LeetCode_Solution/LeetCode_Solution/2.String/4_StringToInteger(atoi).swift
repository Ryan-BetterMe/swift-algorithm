//
//  4_StringToInteger(atoi).swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/8/17.
//
/*
 请你来实现一个 myAtoi(string s) 函数，使其能将字符串转换成一个 32 位有符号整数（类似 C/C++ 中的 atoi 函数）。
 
 函数 myAtoi(string s) 的算法如下：

 读入字符串并丢弃无用的前导空格
 检查下一个字符（假设还未到字符末尾）为正还是负号，读取该字符（如果有）。 确定最终结果是负数还是正数。 如果两者都不存在，则假定结果为正。
 读入下一个字符，直到到达下一个非数字字符或到达输入的结尾。字符串的其余部分将被忽略。
 将前面步骤读入的这些数字转换为整数（即，"123" -> 123， "0032" -> 32）。如果没有读入数字，则整数为 0 。必要时更改符号（从步骤 2 开始）。
 如果整数数超过 32 位有符号整数范围 [−231,  231 − 1] ，需要截断这个整数，使其保持在这个范围内。具体来说，小于 −231 的整数应该被固定为 −231 ，大于 231 − 1 的整数应该被固定为 231 − 1 。
 返回整数作为最终结果。
 注意：

 本题中的空白字符只包括空格字符 ' ' 。
 除前导空格或数字后的其余字符串外，请勿忽略 任何其他字符。
  
 示例 3：

 输入：s = "4193 with words"
 输出：4193
 解释：
 第 1 步："4193 with words"（当前没有读入字符，因为没有前导空格）
          ^
 第 2 步："4193 with words"（当前没有读入字符，因为这里不存在 '-' 或者 '+'）
          ^
 第 3 步："4193 with words"（读入 "4193"；由于下一个字符不是一个数字，所以读入停止）
              ^
 解析得到整数 4193 。
 由于 "4193" 在范围 [-231, 231 - 1] 内，最终结果为 4193 。
 */

import Foundation

// 这道题直接使用的暴力破解法
// 关键是需要考虑到各种极限的情况，不然就会错误很多
// 错误记录：1、作为参数的数组搞混了
//         2、要考虑到极限情况，不能直接Int(resultStr),因为resultStr最大有200个字符，这里需要做一个位数的比较
//         3、要考虑到哪里需要continue循环，哪里要break循环
//         4、要考虑到0开头的情况，注意筛选
func myAtoi(_ s: String) -> Int {
    let strArray = Array(s)
    var resultStr = ""
    
    let numsArray = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    var isBeginNumInput: Bool = false
    
    for i in 0..<strArray.count {
        // 1、移除空格
        if strArray[i] == " " {
            if isBeginNumInput {
                break
            } else {
                continue
            }
        }
        
        // 2、判断符号
        if strArray[i] == "-" || strArray[i] == "+" {
            if isBeginNumInput {
                break
            } else {
                resultStr += "\(strArray[i])"
                isBeginNumInput = true
                continue
            }
        }
        
        isBeginNumInput = true
        
        // 3、得到数字
        if numsArray.contains("\(strArray[i])") {
            if resultStr.count == 0 && strArray[i] == "0" {
                continue
            }
            
            if resultStr.count == 1 && strArray[i] == "0" {
                let first = strArray.first!
                if first == "-" || first == "+" {
                    continue
                }
            }
            
            resultStr += "\(strArray[i])"
        } else {
            break
        }
    }
    
    var result = 0
    let max = 1<<31
    
    if resultStr.count > String("\(-max)").count {
        if resultStr.first! == "-" {
            result = -max
        } else {
            result = max - 1
        }
        
    } else {
        result = Int(resultStr) ?? 0
        
        if result > max - 1 {
            result = max - 1
        }
        if result < -max {
            result = -max
        }
    }
    
    return result
}

// 也是使用遍历，不过不是那种粗暴的方法
// 并不是先得到一个最大数的字符串，而是读取一个数字字符就变换相应的base
func myAtoi2(_ s: String) -> Int {
    // 符号
    var sign = 1

    // 最终的数字结果
    var base = 0
    
    // 初始遍历项
    var i = 0
    
    let paramsArray = Array(s)
    
    while i < paramsArray.count && paramsArray[i] == " " { i += 1 }
    
    if i < paramsArray.count && (paramsArray[i] == "-" || paramsArray[i] == "+") {
        sign = paramsArray[i] == "-" ? -1 : 1
         i += 1
    }
    
    while i < paramsArray.count && paramsArray[i] >= "0" && paramsArray[i] <= "9" {
        base = 10 * base + Int("\(paramsArray[i])")!
        
        i += 1
        
        // 注意符号：是从[-(1<<32) - 1, 1<<32]
        if base > INT32_MAX {
            if sign == -1 {
                base = Int(INT32_MAX) + 1
            } else {
                base = Int(INT32_MAX)
            }
            break
        }
    }
    
    return base * sign
}
