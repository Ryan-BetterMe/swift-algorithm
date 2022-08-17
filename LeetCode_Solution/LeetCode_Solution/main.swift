//
//  main.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2021/7/17.
//

import Foundation

//print("Hello, World!")
//
//print("two sum: \(twoSum([1,1,1,15], 2))")
//
//print("max area: \(maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]))")
//
//print("three sum: \(threeSum([-1,0,1,0]))")
//
//print("closest sum: \(threeSumClosest([-1,2,1,-4], 1))")
//
//var array: [[Character]] = [["5","3",".",".","7",".",".",".","."],
//             ["6",".",".","1","9","5",".",".","."],
//             [".","9","8",".",".",".",".","6","."],
//             ["8",".",".",".","6",".",".",".","3"],
//             ["4",".",".","8",".","3",".",".","1"],
//             ["7",".",".",".","2",".",".",".","6"],
//             [".","6",".",".",".",".","2","8","."],
//             [".",".",".","4","1","9",".",".","5"],
//             [".",".",".",".","8",".",".","7","9"]]
//solveSudoku(&array)
//
//
//print(isMatch("aa", "a"))
//
//print(intToRoman(1936))
//
//let str = "1"
//
//print(MemoryLayout.size(ofValue: str))
//
//print(strStr("hello", "ll"))
//
//print(createNextArray2("bababa"))
//
//print(strStr02("aabbcc", "bcc"))
//
//
//print(findMinWithDuplicated([2, 0, 1, 1, 1]))

//print(findSubstring("barfoofoobarthefoobarman", ["bar","foo","the"]))


//groupAnagrams(["eat","tea","tan","ate","nat","bat"])
//
//let l1 = ListNode.init(2)
//l1.next = ListNode.init(4)
//l1.next = ListNode.init(3)
//
//let l2 = ListNode.init(5)
//l2.next = ListNode.init(6)
//l2.next = ListNode.init(4)
//
//addTwoNumbers(l1, l2)

let l1 = ListNode.init(1)
l1.next = ListNode(1)
l1.next?.next = ListNode(3)


let result = deleteDuplicates(l1)
print(result)
