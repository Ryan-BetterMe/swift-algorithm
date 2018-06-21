//: Playground - noun: a place where people can play
import Foundation
/* 插入排序法
 1、从第一个元素开始，该元素被认为是已经排好序了
 2、取出下一个元素，在已经排序的元素序列中从后往前扫描
 3、如果该元素（已排序）大于新元素，将该元素移到下一位
 4、重复步骤3，直到已排序的元素小于或者等于新元素的位置
 5、将新元素插入到该位置
 6、重复步骤2~5
 如：
 [| 8, 3, 5, 4, 6 ]
 [ 8 | 3, 5, 4, 6 ]
 [ 3, 8 | 5, 4, 6 ]
 [ 3, 5, 8 | 4, 6 ]
 [ 3, 4, 5, 8 | 6 ]
 [ 3, 4, 5, 6, 8 |]
 
 最好情况的时间复杂度O(n)
 最坏情况的时间复杂度O(n^2)
 */

// method 01 : 自己写的
func insertionSort01(_ array: [Int]) -> [Int] {
  var a = array                                           // 1
  // 每次排序的起始位置都是已排序数组的最后一位
  for x in 0..<a.count-1 {                                // 2
    var y = x
    while y >= 0 && y < a.count - 1 && a[y] > a[y + 1] {  // 3
      a.swapAt(y, y + 1)
      y = y - 1
    }
  }
  return a
}

print("----------------insertionSort01------------------")
var array = [1, 5, 7, 0, 9, 4, 2]
insertionSort01(array)

// swift algorithm
func insertionSort02(_ array: [Int]) -> [Int] {
  var temp = array

  // 每一次的起始位置都是待排序元素
  for x in 1..<temp.count {
    var y = x
    while y >= 1 && temp[y] < temp[y - 1] {
      temp.swapAt(y, y - 1)
      y -= 1
    }
  }
  return temp
}
print("----------------insertionSort02------------------")
var array02 = [0, 2, 4, 2, 9, 1, 4]
insertionSort02(array02)

/// swift无需交换元素 可以提高一点速度, 通过将元素的位置向右移动
/*
 [ 3, 5, 8, 4 | 6 ]   remember 4
            *
 
 [ 3, 5, 8, 8 | 6 ]   shift 8 to the right
         --->
 
 [ 3, 5, 5, 8 | 6 ]   shift 5 to the right
      --->
 
 [ 3, 4, 5, 8 | 6 ]   copy 4 into place
      *
 */
func insertionSort03(_ array: [Int]) -> [Int] {
  var a = array
  
  for x in 1..<a.count {
    var y = x
    let temp = a[y]
    while y >= 1 && temp < a[y - 1] {
      a[y] = a[y - 1]
      y -= 1
    }
    a[y] = temp
  }
  return a
}

print("----------------insertionSort03------------------")
var array03 = [1, 2, 3, 2, 8, 2, 4]
insertionSort03(array03)

