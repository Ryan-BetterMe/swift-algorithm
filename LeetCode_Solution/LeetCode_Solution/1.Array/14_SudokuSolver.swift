//
//  14_SudokuSolver.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/22.
//
/*  题目描述：
 编写一个程序，通过填充空格来解决数独问题。

 数独的解法需 遵循如下规则：

 数字 1-9 在每一行只能出现一次。
 数字 1-9 在每一列只能出现一次。
 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。（请参考示例图）
 数独部分空格内已填入了数字，空白格用 '.' 表示。
 */

import Foundation

// 这里使用的回溯法，对于这种时间复杂度，有一个最坏的情况，这里的最坏的情况就是O(9^M) 这是完全穷举的最快情况
public func solveSudoku(_ board: inout [[Character]]) {
    
}

// 如果是需要找到所有答案，也就是说如果需要全部遍历一遍的话，那么这里无须返回值,让它跑完
// 可是这里其实是只需要一个可行的解就可以了，那么就需要返回BOOL类型，通过Bool类型来判断
func backtrack(_ board: inout [[Character]], _ row: Int, _ column: Int) -> Bool {
    // 1、每一行遍历完了，切换到下一行
    if column == 9 {
        return backtrack(&board, row + 1, 0)
    }
    
    // 2、所有行遍历完了，这个时候必有一个结果
    if row == 9 {
        return true
    }
    
    // 3、对每一个位置都进行穷举
    for i in row..<9 {
        for j in column..<9 {
            
            // 4、如果有预设：那么+1列
            if board[i][j] != "." { return backtrack(&board, i, j + 1)}
            
            let chars: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
            
            // 5、如果没有预设：那么枚举看所有值是否满足
            for value in chars {
                
                if !isValid(&board, i, j, value) { continue }
                
                board[i][j] = value
                
                // 6、如果找到可行解，直接返回
                if backtrack(&board, i, j + 1) {
                    return true
                }
                
                board[i][j] = "."
            }
            
            // 6、都满足不了，说明此路不通，向前回溯即可
            return false
        }
    }
    return false
}

func isValid(_ board: inout [[Character]], _ row: Int, _ column: Int, _ char: Character) -> Bool {
    for i in 0..<9 {
        if board[i][column] == char || board[row][i] == char || board[row/3 * 3 + i/3][column/3 * 3 + i%3] == char {
            return false
        }
    }
    
    return true
}


