//
//  1_AddTwoNumbers.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2022/1/21.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
       let list = ListNode.init(-1)
       var p = list
       
       var p1 = l1
       var p2 = l2
       
       var leading = 0
       
       while (p1 != nil && p2 != nil) {
           var sum = p1!.val + p2!.val
           
           
           var value = (leading + sum)%10
           
           leading = (leading + sum)/10
           
           p1 = p1!.next
           p2 = p2!.next
           
           p.next = ListNode.init(value)
           p = (p.next)!
           
           NSLog("value = \(value)")
       }
       
       while p1 != nil {
           var sum = p1!.val
           var value = (leading + sum)%10
           
           leading = (leading + sum)/10
           
           p1 = p1!.next
           
           p.next = ListNode.init(value)
           p = (p.next)!
       }
       
       while p2 != nil {
           var sum = p2!.val
           var value = (leading + sum)%10
           leading = (leading + sum)/10
           
           p2 = p2!.next
           
           p.next = ListNode.init(value)
           p = (p.next)!
       }
    
    if leading != 0 {
        p.next = ListNode.init(leading)
    }
       return list.next
   }
