//
//  2_Search2DMatrix.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/12/10.
//
/*
 编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：

 每行中的整数从左到右按升序排列。
 每行的第一个整数大于前一行的最后一个整数。

 示例 1：
 输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
 输出：true
 */

import Foundation

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    // 无非就是两次二分查找，先定位哪一行，再定位那一列
    let column = matrix.map { $0.first! }
    
    var left1 = 0
    var right1 = column.count - 1
    
    while left1 <= right1 {
        let mid = (left1 + right1)/2
        
        if column[mid] == target {
            return true
        } else if column[mid] > target {
            right1 = mid - 1
        } else if column[mid] < target {
            left1 = mid + 1
        }
    }
    
    // 检查出界情况: 这个地方很重要！
    if right1 < 0 { return false }
    
    // 1 5 9 10 找2
    // 此时定位的行就是right!
    let row = matrix[right1]
    
    var left2 = 0
    var right2 = row.count - 1
    
    while left2 <= right2 {
        let mid = (left2 + right2)/2
        
        if row[mid] == target {
            return true
        } else if row[mid] > target {
            right2 = mid - 1
        } else if row[mid] < target {
            left2 = mid + 1
        }
    }
    
    return false
}
