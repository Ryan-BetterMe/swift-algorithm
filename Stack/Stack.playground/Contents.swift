//: Playground - noun: a place where people can play

// 栈是先进后出的，关键是添加和移除的顺序
// 所以可以使用数组来实现栈，添加的时候将元素添加到数组首部 移除的移除也移除数组的首部的元素

import Foundation

public struct Stack<T> {
  fileprivate var array = [T]()
  
  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  public var count: Int {
    return array.count
  }
  
  public mutating func push(_ element: T) {
    array.append(element)
  }
  
  public mutating func pop() {
    array.popLast()
  }
  
  public var top: T? {
    return array.last
  }
  
}

var stack = Stack(array: ["John", "Jack", "Lance"])

stack.push("oop")

stack.push("pop")

stack.push("mvc")

stack.count

stack.top

stack.pop()

stack.pop()

stack.pop()


