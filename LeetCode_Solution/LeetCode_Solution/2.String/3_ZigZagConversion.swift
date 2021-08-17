//
//  3_ZigZagConversion.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/8/17.
//
/* Z字形变换
 
 将一个给定字符串 s 根据给定的行数 numRows ，以从上往下、从左到右进行 Z 字形排列。

 比如输入字符串为 "PAYPALISHIRING" 行数为 3 时，排列如下：

 P   A   H   N
 A P L S I I G
 Y   I   R
 之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："PAHNAPLSIIGYIR"。

 请你实现这个将字符串进行指定行数变换的函数：

 string convert(string s, int numRows);
  

 示例 1：

 输入：s = "PAYPALISHIRING", numRows = 3
 输出："PAHNAPLSIIGYIR"
 示例 2：
 输入：s = "PAYPALISHIRING", numRows = 4
 输出："PINALSIGYAHRPI"
 解释：
 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 
 */

import Foundation

// 不整那些花里胡哨的，直接遍历元素一个一个添加
func convert(_ s: String, _ numRows: Int) -> String {
        guard s.count > 1 && numRows > 1 else { return s }
        
        // 根据行数添加空数组
        var totalArray: [[Character]] = []
        
        for _ in 0..<numRows {
            let array = [Character]()
            totalArray.append(array)
        }
        
        let length = s.count
        let strArray = Array(s)
        var index = 0
        
        //  *     *     *
        //  *  #  *   # *
        //  * #   *  #  *
        //  *     *     *
        // 遍历所有的字符：每次下来再上去就是一个循环
        while index < length {
            //  垂直向下遍历：从第0行到第n-1行，依次添加元素
            for i in stride(from: 0, through: numRows-1, by: 1) {
                if index < length {
                    totalArray[i].append(strArray[index])
                    index += 1
                } else {
                    break
                }
            }
            
            // 斜向上遍历: 从第n-2行到第1行，依次添加元素
            for i in stride(from: numRows-2, through: 1, by: -1) {
                if index < length {
                    totalArray[i].append(strArray[index])
                    index += 1
                } else {
                    break
                }
            }
            
        }
        
        var result: [Character] = []
        
        for i in 0..<numRows {
            result.append(contentsOf: totalArray[i])
        }
        
        return result.map { "\($0)" }.joined()
    }

/// 方法二：以及是使用遍历的方法，不过这一次更加swift
/// 此方法 60ms
/// 注意，注意，注意：在做这道题的过程中，发现如果直接计算字符串的长度是一个耗时操作！它比计算数组的长度要重的多
func convert2(_ s: String, _ numRows: Int) -> String {
    let count = s.count
    
    guard count > 1 && numRows > 1 else { return s }
    
    let strArray = Array(s)
    var result: [String] = Array(repeating: "",
                      count: numRows)
    var row = 0
    var isGoingDown = true
    
    var i = 0
    
     while i < count {
        result[row] += "\(strArray[i])"
        
        row += isGoingDown ? 1 : -1
        
        if row == 0 {
            isGoingDown = true
        }  else if row == numRows - 1 {
            isGoingDown = false
        }
         
        i += 1
    }
    
    return result.joined()
}
