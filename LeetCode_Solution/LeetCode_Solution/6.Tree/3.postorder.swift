
// 后序遍历
// 1
//   2
// 3  4
// 后序遍历的结果为：3 4 2 1
// 自下而上的遍历
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init(value: Int, left: TreeNode?, right: TreeNode?) {
        self.val = value
        self.left = left
        self.right = right
    }
}

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    if root == nil { return [] }

    return postorderTraversal(root?.left) + postorderTraversal(root?.right) + [root!.val]
}

// 后序遍历的迭代
// 1
//    2
// 3     4
func postorderTraversal1(_ root: TreeNode?) -> [Int] {
    if root == nil { return [] }

    var nodes: [TreeNode] = []
    var result: [Int] = []
    var p: TreeNode? = root
    // result的变化: 本来是左 右 中 ，加入的时候中 右 左（但是是逆序）
    /* 
    1  ->
    2 1 ->
    4 2 1 ->
    2 4 2 1 
    */
    while !nodes.isEmpty || !p {
        if p != nil {
            nodes.append(p!)
            result.insert(p!.val, at:0)
            p = p?.right
        } else {
            p = nodes.removeLast()
            p = p?.left
        }
    }

    return result
}