//: Playground - noun: a place where people can play

import Foundation

var str = "Hello, playground"

// 队列： 遵从的是先进先出的原则，先进入队列的元素后出队列
/**
      ---------
   -> 5 4 3 2 1 ->
      ---------
 */

/// 实现方法一
/// 入队列的操作是一个时间复杂度为O(1)的操作，因为在Swift中数组尾部都存在着内存空间，所以每次都可以添加上
/// 出队列的操作时间复杂度为O(n)，因为出队列需要移除首位元素，移除首位元素的时候，其余的元素都会向前移动一位！！！
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
queue.array

queue.enqueue("jack")
queue.array

queue.enqueue("monika")
queue.array

queue.dequeue()
queue.dequeue()

queue.array

queue.count

queue.isEmpty

/* 一个更有效的Queue
 主要观点: 解决出队列时的效率问题即可，那么如何解决呢？
 before： [ xxx, "Steve", "Tim", "Grace", xxx, xxx ]
 after：  [ xxx, xxx, "Tim", "Grace", xxx, xxx ]
 无论什么时候移除我们都不进行元素的偏移，仅仅是将元素位置为空；然后定期将前面的空位进行清理
 trim:    [ "Tim", "Grace", xxx, xxx, xxx, xxx ]
 清理的操作事件复杂度为O(n), 但是清理也只是在偶尔才会出现，所以平均事件复杂度依旧为O(1)
 
 ** 这里要注意这里可以说是使用了空间复杂度来换取时间复杂度，节约了时间但是牺牲了空间
 */
public struct NewQueue<T> {
  fileprivate var array = [T?]()
  fileprivate var head = 0      // 表示的是缓存指针指向的位置
  
  public var isEmpty: Bool {
    return count == 0
  }
  
  public var count: Int {
    return array.count - head
  }
  
  public mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  public mutating func dequeue() -> T? {
    guard head < array.count, let element = array[head] else { return nil }
    
    array[head] = nil
    head += 1
    
    let percentage = Double(head) / Double(array.count)
    if array.count > 50 && percentage >= 0.25 {
      array.removeFirst(head)  // 移除前面head个元素
      head = 0
    }
    
    return element
  }
  
  public var font: T? {
    if isEmpty {
      return nil
    }  else {
      return array[head]
    }
  }
}

print("-----------------------------------------------")

var q = NewQueue<String>()

q.enqueue("dog")
q.enqueue("cat")
q.enqueue("tiger")
q.enqueue("job")
q.enqueue("like")
q.enqueue("animation")

q.array

q.dequeue()
q.dequeue()
q.dequeue()

q.array

q.count

q.array.reverse() // 其实就是将数组翻转  时间复杂度为O(n)

