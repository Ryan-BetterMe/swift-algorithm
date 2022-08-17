//
//  1.inOrder.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2022/8/15.
//

import Foundation

// 中序遍历，使用栈来迭代

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(value: Int, leftNode: TreeNode?, rightNode: TreeNode?) {
        self.val = value
        self.left = leftNode
        self.right = rightNode
    }
}

class Solution {
    // 方法一：采用递归的方式来前序遍历二叉树
    func preorderTraversal1(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }

        return [root!.val] + preorderTraversal1(root?.left) + preorderTraversal1(root?.right)
    }

    // 方法二：采用迭代的方式来前序遍历二叉树
    // 可以说是利用了会溯的思维方式
    func preorderTraversal2(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }

        // 1、栈：用来承载tree的元素
        var nodes: [TreeNode] = []
        // 2、数组：用来承载返回的结果
        var result: [Int] = []
        var p = root // 当前的指针

        while nodes.count != 0 || p != nil {
            if p != nil {
                result.append(p!.val)
                nodes.append(p!)
                p = p.left
            } else {
                p = nodes.removeLast()
                p = p.right
            }
        }
        return result
    }
}

