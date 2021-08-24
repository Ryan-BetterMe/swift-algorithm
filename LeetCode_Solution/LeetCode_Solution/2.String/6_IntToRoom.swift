//
//  6_IntToRoom.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/8/24.
//
/*
 
 罗马数字包含以下七种字符： I， V， X， L，C，D 和 M。

 字符          数值
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。

 通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：

 I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
 X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
 C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
 给你一个整数，将其转为罗马数字。
 
 示例 1:

 输入: num = 3
 输出: "III"
 示例 2:

 输入: num = 4
 输出: "IV"
 
 */

import Foundation

// 方法一：此方法计算每一个数字转化为罗马字符的结果，然后凭拼接起来
func intToRoman(_ num: Int) -> String {
     let strArray = Array("\(num)")
     var numDic: [Int: Int] = [:]
     var result: [String] = []

     for (i, value) in Array(strArray.reversed()).enumerated() {
         numDic[i] = Int("\(value)") ?? 0
     }

     // 千
     if let throunds = numDic[3] {
         result.append(translateSingle(param: throunds, one: "M", five: "", ten: ""))
     }

     // 百
     if let hundreds = numDic[2] {
         result.append(translateSingle(param: hundreds, one: "C", five: "D", ten: "M"))
     }

     // 十
     if let ten = numDic[1] {
         result.append(translateSingle(param: ten, one: "X", five: "L", ten: "C"))
     }

     // 个
     if let ten = numDic[0] {
         result.append(translateSingle(param: ten, one: "I", five: "V", ten: "X"))
     }
     return result.joined(separator: "")
 }

 // 每一位数都转化为相应的罗马文字
 func translateSingle(param: Int, one: String, five: String, ten: String) -> String {
     var result: [String] = []
     if param == 9 {
         result.append("\(one)\(ten)")
     }

     if param < 9 && param >= 5 {
         result.append(five)
         for _ in 0..<param - 5 {
             result.append(one)
         }
     }

     if param == 4 {
         result.append("\(one)\(five)")
     }

     if param < 4 {
         for _ in 0..<param {
             result.append(one)
         }
     }
    
     return result.joined(separator: "")
 }

/// 方法二：暴力枚举法
/// 当看到这个方法之后，就会发现这个问题是有多么煞笔了
func intToRoman2(_ num: Int) -> String {
    
    let m = ["", "M", "MM", "MMM"]
    let c = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
    let x = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
    let i = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
    
    return m[num/1000] + c[(num%1000)/100] + x[(num%100)/10] + i[num%10]
}
