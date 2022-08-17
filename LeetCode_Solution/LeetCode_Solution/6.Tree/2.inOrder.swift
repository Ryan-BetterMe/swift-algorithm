
// 中序遍历
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

// 采用的是递归的方式
func inorderTraversal1(_ root: TreeNode?) -> [Int] {
    if root == nil { return [] }

    return inorderTraversal1(root?.left) + [root!.val] + inorderTraversal1(root?.right)
}

func inorderTraversal2(_ root: TreeNode?) -> [Int] {
    if root == nil { return [] }

    var nodes: [TreeNode] = []
    var result: [Int] = []
    var p: TreeNode? = root

    while p != nil || nodes.count != 0 {
        if p != nil {
            nodes.append(p!)
            p = p?.left
        } else {
            p = nodes.removeLast()
            result.append(p!.val)
            p = p?.right
        }
    }

    return result
}
