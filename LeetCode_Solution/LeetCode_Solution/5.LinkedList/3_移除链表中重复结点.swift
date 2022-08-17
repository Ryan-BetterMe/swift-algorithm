//
//  3_移除链表中重复结点.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2022/7/28.
//

import Foundation

// 移除链表中的重复结点，要全部移除，不留遗憾
// 1->1->2->3 变成 2 -> 3
// 遍历一遍，把节点都存储在数组中
// [1,2,3,3,4,4,5]
func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var first = head
    var second = first?.next
    
    var array: [ListNode] = []
    
    while second != nil && first != nil {
        if first!.val == second!.val {
            second = second?.next
        } else {
            first = second
            second = second?.next
            
            if let v1 = first?.val,
               let v2 = second?.val,
               v1 != v2 {
                array.append(first!)
            }
        }
    }
    
    if first != nil {
        array.append(first!)
    }
    
    if array.count == 0 {
        return nil
    } else {
        for i in 0..<array.count {
            if i + 1 < array.count {
                array[i].next = array[i+1]
            }
        }
        
        array.last?.next = nil
        
        return array.first
    }
}
