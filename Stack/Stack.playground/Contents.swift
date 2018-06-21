//: Playground - noun: a place where people can play

// 栈是先进后出的，关键是添加和移除的顺序
/*
 图示：先进入的元素，反而后出栈
----------
|1 2 3 4 5 <-      5入栈
----------

----------
|1 2 3 4 5 ->      5出栈
----------

 时间复杂度: 注意，在这里直接将元素添加到了Array的lastElement,如果插入到Array的首位，这样的开销是昂贵的，为O(n) 因为数组中的每一位元素都要向后偏移一位；但是如果直接加在数组的尾部的话，无论数组尺寸如何,开销为O(1)

 每次调用函数的时候，CPU都会将返回地址放在堆栈上。 当函数结束时，CPU使用该返回地址跳回到调用者。 这就是为什么如果你调用了太多的函数 - 例如在一个永不结束的递归函数中 - 当CPU堆栈空间不足时，你会得到所谓的“堆栈溢出”。
 */

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








