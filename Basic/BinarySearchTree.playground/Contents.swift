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
    mutating func dequeue() -> Element? {
        return self.popLast()
    }
    
    mutating func enqueue(element: Element) {
        self.insert(element, at: 0)
    }
}

/*
    #2
 # 1    #4
    #3     #5
 
 */
// 遍历所有的子view：这里使用的不是二叉树而是多叉树，多叉树使用的是深度优先遍历和广度优先遍历
// 广度优先遍历是分层搜索的过程，一层层的查找
func searchAllSubviewsInView(bottomView: UIView) {
    
    var currentNode: UIView? = bottomView
    var tempNode: UIView?
    var queue: Array<UIView> = []
    
    queue.enqueue(element: currentNode!)
    
    
    while queue.isEmpty == false {
        tempNode = queue.dequeue()
        
        currentNode = tempNode
        
        for index in 0..<currentNode!.subviews.count {
            queue.enqueue(element: currentNode!.subviews[index])
        }
    }
}

searchAllSubviewsInView(bottomView: view)

