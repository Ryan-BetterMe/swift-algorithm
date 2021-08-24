//
//  main.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/17.
//

import Foundation

print("Hello, World!")

print("two sum: \(twoSum([1,1,1,15], 2))")

print("max area: \(maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]))")

print("three sum: \(threeSum([-1,0,1,0]))")

print("closest sum: \(threeSumClosest([-1,2,1,-4], 1))")

var array: [[Character]] = [["5","3",".",".","7",".",".",".","."],
             ["6",".",".","1","9","5",".",".","."],
             [".","9","8",".",".",".",".","6","."],
             ["8",".",".",".","6",".",".",".","3"],
             ["4",".",".","8",".","3",".",".","1"],
             ["7",".",".",".","2",".",".",".","6"],
             [".","6",".",".",".",".","2","8","."],
             [".",".",".","4","1","9",".",".","5"],
             [".",".",".",".","8",".",".","7","9"]]
solveSudoku(&array)


print(isMatch("aa", "a"))

print(intToRoman(1936))
