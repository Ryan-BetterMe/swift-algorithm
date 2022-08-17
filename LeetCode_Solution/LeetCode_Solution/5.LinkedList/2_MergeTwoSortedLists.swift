//
//  2_MergeTwoSortedLists.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2022/1/21.
//

import Foundation


func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    let dummy = ListNode.init(-1)

    var p = dummy
    var p1 = list1
    var p2 = list2
    
    while p1 != nil && p2 != nil {
        if p1!.val == p2!.val {
            p.next = ListNode.init(p1!.val)
            
            p1 = p1?.next
        } else if p1!.val > p2!.val {
            p.next = ListNode.init(p2!.val)
            p2 = p2?.next
        } else if p1!.val < p2!.val {
            p.next = ListNode.init(p1!.val)
            p1 = p1?.next
        }
        
        p = p.next!
    }
    
    if p1 != nil {
        p.next = p1
    }
    
    if p2 != nil {
        p.next = p2
    }
    
    return dummy.next
}
