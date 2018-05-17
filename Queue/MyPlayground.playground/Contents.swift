//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 队列： 遵从的是先进先出的原则，先进入队列的元素后出队列
/**
      ---------
   -> 5 4 3 2 1 ->
      ---------
 */
public struct Queue<T> {
  fileprivate var array = [T]()
  
  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  public var count: Int {
    return array.count
  }
  
  // 使用append是将元素加入到数组的尾部
  public mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  public mutating func dequeue() -> T? {
    if array.isEmpty { return nil }
    else { return array.removeFirst() }
  }
  
  public var font: T? {
    return array.first
  }
}

var queue = Queue(array: ["like", "love", "life"])
print(queue)

queue.enqueue("jack")
print(queue)

queue.enqueue("monika")
print(queue)

queue.dequeue()
queue.dequeue()

print(queue)

queue.count

queue.isEmpty
