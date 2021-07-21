//
//  13_ValidSudoku.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/21.
//
/*  问题题解：有效的数组
 请你判断一个 9x9 的数独是否有效。只需要 根据以下规则 ，验证已经填入的数字是否有效即可。
 1、数字 1-9 在每一行只能出现一次。
 2、数字 1-9 在每一列只能出现一次。
 3、数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。（请参考示例图）
 4、数独部分空格内已填入了数字，空白格用 '.' 表示。

 注意：

 一个有效的数独（部分已被填充）不一定是可解的。
 只需要根据以上规则，验证已经填入的数字是否有效即可。
 
 */


import Foundation

/* 解法：如何判断有没有解呢？
   只需要一个数在所在的行中未出现过，列未出现过，box里未出现过即可！
 
   第一种解法使用hashset即可
   将遍历过的每一个元素都存储在hashset中，这样的话可以很轻易的进行筛选和比较
 */
func isValidSudoku(_ board: [[Character]]) -> Bool {
    var boardSet = Set<String>()
    
    for i in 0..<9 {
        for j in 0..<9 {
            let char = board[i][j]
            
            if char == "." { continue }
            
            let row = "\(char) in row \(i)"
            let column = "\(char) in column \(j)"
            let box = "\(char) in box \(i/3 * 3 + j/3)"
            
            
            if !boardSet.insert(row).inserted
            || !boardSet.insert(column).inserted
            || !boardSet.insert(box).inserted {
                return false
            }
        }
    }
    
    return true
}

/// 解法二：直接使用二元数组来做比较即可！
/// 使用二维数组保存每一行，每一列，以及每个小方块中出现的值
func isValidSudoku2(_ board: [[Character]]) -> Bool {
    var row:[[Character]] = Array<[Character]>.init(repeating: [], count: 9)
    var column:[[Character]] = Array<[Character]>.init(repeating: [], count: 9)
    var box:[[Character]] = Array<[Character]>.init(repeating: [], count: 9)
    
    for i in 0..<9 {
        for j in 0..<9 {
            let char = board[i][j]
            if char == "." { continue }
            
            if row[i].contains(char) {
                return false
            } else {
                row[i].append(char)
            }
            
            if column[j].contains(char) {
                return false
            } else {
                column[j].append(char)
            }

            if box[i/3 * 3 + j/3].contains(char) {
                return false
            } else {
                box[i/3 * 3 + j/3].append(char)
            }
        }
    }
    return true
}
