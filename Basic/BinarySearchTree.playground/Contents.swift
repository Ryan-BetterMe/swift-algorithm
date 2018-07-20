//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport

var str = "Hello, playground"

let view = UIView.init()
view.tag = 1000
let view01 = UIView.init()
view01.tag = 1001
let view02 = UIButton.init(type: .custom)
view02.tag = 1002
let view03 = UIView.init()
view03.tag = 1003
let view04 = UIView.init()
view04.tag = 1004
let view05 = UIButton.init(type: .custom)
view05.tag = 1005
let view06 = UIView.init()
view06.tag = 1006
let view07 = UIView.init()
view07.tag = 1007
let view08 = UIButton.init(type: .custom)
view08.tag = 1008
let view09 = UIView.init()
view09.tag = 1009

view.addSubview(view01)
view.addSubview(view02)
view01.addSubview(view03)
view03.addSubview(view04)
view01.addSubview(view05)
view02.addSubview(view06)
view02.addSubview(view07)
view04.addSubview(view08)
view04.addSubview(view09)

extension Array {
    // 队列的操作
    mutating func dequeue() -> Element? {
        return self.popLast()
    }
    
    mutating func enqueue(element: Element) {
        self.insert(element, at: 0)
    }
    
    // 栈的操作
    mutating func pop() -> Element? {
        return self.popLast()
    }
    
    mutating func push(element: Element) {
        return self.append(element)
    }
}

/*
    #2
 # 1    #4
    #3     #5
 
 */
// <1> 需求：遍历当前视图上的所有的子View
// 分析：这里虽然是查找子视图，但是我们可以将其和二叉树这个数据结构对应起来，但是要注意的是这里并不能完全使用二叉树，为什么？
//      因为一个父视图上可能有多个子视图，所以这里应该使用的是多叉树的数据结构
// 总结：既然是查找树，就必须了解什么是深度优先，什么是广度优先？二叉树的深度优先的遍历通常采用的是栈的数据结构，广度优先通常采用的是队列的数据结构
//     深度优先：对每一个可能的分支路径深入直到不能深入为止！二叉树的深度优先又可分为先序（根左右），中序（左根右），后序（左右根）
//     广度优先：在树的结构中又叫可以称为做层次遍历，从上往下对每一层依次遍历，访问一层就进入下一层，直到没有节点为止

// 1. 广度优先搜索算法的非递归实现
func searchAllSubviewsInView(bottomView: UIView) {
    
    var currentNode: UIView? = bottomView
    var tempNode: UIView?
    var queue: Array<UIView> = []
    
    // 每一层都输出一个换行符
    var currentLevelCount = 0
    var nextLevelCount = 0
    
    // 使用了队列的数据结构
    queue.enqueue(element: currentNode!)
    currentLevelCount = 1
    
    while queue.isEmpty == false {
        
        tempNode = queue.dequeue()
        
        currentLevelCount -= 1
        
        
        print(tempNode!.tag)
        currentNode = tempNode
        
        for index in 0..<currentNode!.subviews.count {
            queue.enqueue(element: currentNode!.subviews[index])
            nextLevelCount += 1
        }
        
        // 注意：必然是一层一层地将
        if currentLevelCount == 0 {
            currentLevelCount = nextLevelCount
            nextLevelCount = 0
            print("\n")
        }
    }
}

searchAllSubviewsInView(bottomView: view)

// 2.深度优先搜素算法的非递归实现
func searchAllSubviewsPreorder(botttomView: UIView) {
    var currentNode: UIView? = botttomView
    var tempNode: UIView?
    var stack: Array<UIView> = []
    // 使用了栈的数据结构
    stack.push(element: currentNode!)
    
    while stack.isEmpty == false {
        tempNode = stack.pop()
        
        print(tempNode!.tag)
        
        currentNode = tempNode
        
        currentNode!.subviews.reversed().forEach {
            stack.push(element: $0)
        }
    }
}

print("----------------------------")
searchAllSubviewsPreorder(botttomView: view)

// <2> 简介：二叉树：二叉树是一个有根树，并且每一个节点最多有两个子节点。
//      二叉搜索树是一种特殊的二叉树，这个树是“有序”的，如果左子树不为空，则左子树上所有的节点值都小于根       节点的值，若右子树不为空，则都大于它根节点的值，且左右子树也是二叉排序树。
// 概念： 树的高度：这是根节点和叶节点之间连接数的最大数量就是树的高度
//       节点的深度：每一个节点和根节点的连线的数量就是这个节点的深度！！！

// 一个普通的树的结构：
public class TreeNode<T> {
    public var value: T
    public weak var parent: TreeNode?
    public var children = [TreeNode<T>]()
    
    init(value: T) {
        self.value = value
    }
    
    func addChild(_ node: TreeNode<T>) {
        self.children.append(node)
        node.parent = self
    }
}

extension TreeNode: CustomStringConvertible {
    //输出分层的信息
    public var description: String {
        var s = "\(value)"
        if !children.isEmpty {
            s += " {" + children.map { $0.description }.joined(separator: ",") + "}"
        }
        return s
    }
}

extension TreeNode where T: Equatable {
    func search(a: T) -> TreeNode? {
        if self.value == a {
            return self
        }
        for child in self.children {
            // 确认找到了才return
            // 直接return child.search(a: a)的话，第一次循环刚开始就return了
            if let found = child.search(a: a) {
                  return found
            }
        }
        
        return nil
    }
}


let tree = TreeNode<String>(value: "beverages")

let hotNode = TreeNode<String>(value: "hot")
let coldNode = TreeNode<String>(value: "cold")

let teaNode = TreeNode<String>(value: "tea")
let coffeeNode = TreeNode<String>(value: "coffee")
let chocolateNode = TreeNode<String>(value: "cocoa")

let blackTeaNode = TreeNode<String>(value: "black")
let greenTeaNode = TreeNode<String>(value: "green")
let chaiTeaNode = TreeNode<String>(value: "chai")

let sodaNode = TreeNode<String>(value: "soda")
let milkNode = TreeNode<String>(value: "milk")

let gingerAleNode = TreeNode<String>(value: "ginger ale")
let bitterLemonNode = TreeNode<String>(value: "bitter lemon")

tree.addChild(hotNode)
tree.addChild(coldNode)

hotNode.addChild(teaNode)
hotNode.addChild(coffeeNode)
hotNode.addChild(chocolateNode)

coldNode.addChild(sodaNode)
coldNode.addChild(milkNode)

teaNode.addChild(blackTeaNode)
teaNode.addChild(greenTeaNode)
teaNode.addChild(chaiTeaNode)

sodaNode.addChild(gingerAleNode)
sodaNode.addChild(bitterLemonNode)

print(tree.description)

teaNode.parent
teaNode.parent!.parent


tree.search(a: "hot")
tree.search(a: "green")


// <3> binary search tree
// 二叉查找树
public class BinarySearchTree<T: Comparable> {
    
    var age = 20
    
    
    private(set) public var value: T
    private(set) public weak var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    init(_ value: T) {
        self.value = value
    }
    
    fileprivate var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChild: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
}

extension BinarySearchTree {
    /// 插入节点的方法
    public func insert(_ value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value)
            } else {
                let node = BinarySearchTree.init(value)
                self.left = node
                node.parent = self
            }
        } else {
            if let right = right {
                right.insert(value)
            } else {
                let node = BinarySearchTree.init(value)
                self.right = node
                node.parent = self
            }
        }
    }
    /// 以一个数组的形式插入
    convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(array.first!)
        
        for index in 1..<array.count {
            insert(array[index])
        }
    }

}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        
        if let left = left {
            s += "(\(left.description)) <- "
        }
        
        s += "\(value)"
        
        if let right = right {
            s += " -> (\(right.description))"
        }
        
        return s
    }
}


extension BinarySearchTree {
    /// 通过递归来方式来找二叉查找树中的元素
    func search(value: T) -> BinarySearchTree? {
        if value > self.value {
            return right?.search(value: value)
        } else if value < self.value {
            return left?.search(value: value)
        } else {
            return self
        }
    }
    
    /// 非递归查找
    func searchWithLoop(value: T) -> BinarySearchTree? {
        var currentNode: BinarySearchTree? = self
        
        while currentNode != nil {
            
            let node = currentNode!
            
            if value > node.value {
                currentNode = node.right
                
            } else if value < node.value {
                currentNode = node.left
                
            } else {
                return currentNode
            }
            
            print(currentNode?.value)
        }
        
        return nil
    }
    
    /// 二叉树的遍历方法
    
    public func traversaInOrder(process: (T) -> Void) {
        // 中序
        left?.traversaInOrder(process: process)
        process(value)
        right?.traversaInOrder(process: process)
    }
    
    public func traversaPreOrder(process: (T) -> Void) {
        // 先序
        process(value)
        left?.traversaPreOrder(process: process)
        right?.traversaPreOrder(process: process)
    }
    
    public func traversaPostOrder(process: (T) -> Void) {
        // 后序
        left?.traversaPostOrder(process: process)
        right?.traversaPostOrder(process: process)
        process(value)
    }
    
    
}

let myTree = BinarySearchTree.init(array: [7, 2, 5, 10, 9, 1])

myTree.search(value: 1)
myTree.searchWithLoop(value: 1)

myTree.traversaPostOrder {
    print($0)
}
myTree.traversaInOrder {
    print($0)
}
myTree.traversaPreOrder {
    print($0)
}

extension BinarySearchTree {
    /// reconnect(相当于剔除了self，将node放在了改位置上)
    private func reconnectParentTo(node: BinarySearchTree?) {
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
        
        parent = nil
        left = nil
        right = nil
    }
    
    /// 找到该节点下最小的节点（说白了就是左节点）
    public func minumNode() -> BinarySearchTree? {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    
    /// 找到该节点下最大的节点(说白了就是右节点)
    public func maxnumNode() -> BinarySearchTree? {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    
    public func remove() -> BinarySearchTree? {
        let replaceMent: BinarySearchTree?
        
        if let right = right {
            replaceMent = self.maxnumNode()
        } else if let left = left {
            replaceMent = self.minumNode()
        } else {
            replaceMent = nil
        }
        
        replaceMent?.reconnectParentTo(node: nil)
        
        replaceMent?.right = right
        replaceMent?.left = left
        right?.parent = replaceMent
        left?.parent = replaceMent
        
        reconnectParentTo(node: replaceMent)
    
        return replaceMent
    }
    
    /// 高度是多少
    public func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    /// 深度是多少(距离根的长度)
    public func depth() -> Int {
        var node = self
        
        var deep = 0
        while let root = node.parent {
            node = root
            deep += 1
        }
        return deep
    }
    
    /// 考虑一个情况：如果在左节点的叶子节点插入一个比root节点还大的数，就不是二叉树了，所以这种情况如何判断呢？
    public func isBST(minValue minValue: T, maxValue: T) -> Bool {
        if value < minValue || value > maxValue { return false }
        let leftBST = left?.isBST(minValue: minValue, maxValue: value) ?? true
        let rightBST = right?.isBST(minValue: value, maxValue: maxValue) ?? true
        return leftBST && rightBST
    }
}


if let nodel = myTree.search(value: 1) {
    myTree.isBST(minValue: Int.min, maxValue: Int.max)
    nodel.insert(100)
    myTree.search(value: 100)
    myTree.isBST(minValue: Int.min, maxValue: Int.max)
}

myTree.left?.remove()

/* 究极火云邪神模式：枚举
 
 */
public enum BinarySearchTreeEnum<T: Comparable> {
    case Empty
    case Leaf(T)
    // 添加了indirect表明它可以拥有BinarySearchTreeEnum，没有它就无法实现递归
    indirect case Node(BinarySearchTreeEnum, T, BinarySearchTreeEnum)
    
    public var count: Int {
        switch self {
        case .Empty:
            return 0
        case .Leaf:
            return 1
        case let .Node(left, _, right):
            return left.count + 1 + right.count
        }
    }
    
    public var height: Int {
        switch self {
        case .Empty:
            return -1
        case .Leaf:
            return 0
        case let .Node(left, _, right):
            return 1 + max(left.height, right.height)
        }
    }
    
    // 插入数据
    public func insert(_ newValue: T) -> BinarySearchTreeEnum {
        switch self {
        case .Empty:
            return .Leaf(newValue)
        case .Leaf(let value):
            if newValue > value {
                return .Node(.Empty, value, .Leaf(newValue))
            } else {
                return .Node(.Leaf(newValue), value, .Empty)
            }
        case .Node(let left, let value, let right):
            if newValue > value {
                return .Node(left, value, right.insert(newValue))
            } else {
                return .Node(left.insert(newValue), value, right)
            }
        }
    }
}

var tree2 = BinarySearchTreeEnum.Leaf(7)
tree2 = tree2.insert(2)
tree2 = tree2.insert(5)
tree2 = tree2.insert(10)
tree2 = tree2.insert(9)
tree2 = tree2.insert(1)

extension BinarySearchTreeEnum: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .Empty:
            return "."
        case .Leaf(let value):
            return "\(value)"
        case .Node(let left, let value, let right):
            return "(\(left.debugDescription)) <- \(value) -> (\(right.debugDescription))"
        }
    }
}






