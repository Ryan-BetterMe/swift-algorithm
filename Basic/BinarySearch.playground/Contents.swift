//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"

// 1.swift内建的查找
let numbers = [11, 22, 44, 590, 19]
numbers.index(of: 44)

// 2.内建查找是一个线性的查找(一个个对比)
func linearSearch<T: Equatable>(from array: [T], search value: T) -> Int? {
    // 遍历方式01：
    for (index, element) in array.enumerated() {
        if element == value {
            return index
        }
    }
    // 遍历方式02：
    for index in 0..<array.count {
        if array[index] == value {
            return index
        }
    }
    return nil
}

linearSearch(from: numbers, search: 590)

// 3.二分查找的搜索时间复杂度为O(lgn),不过二分查找只适合有序的数组
func binarySearch<T: Comparable>(from array: [T], search key: T, start: Int, end: Int) -> Int? {
    
    guard end >= start else { return nil }
    
    let mid: Int = start + Int((end - start)/2)
    // 传入的mid一定要自增
    if key > array[mid] {
        return binarySearch(from: array, search: key, start: mid + 1, end: end)
    } else if key < array[mid]{
        return binarySearch(from: array, search: key, start: start, end: mid - 1)
    } else {
        return mid
    }
}

let numbersTest = [1, 3, 5, 6, 7, 10, 50, 90, 1099, 1344, 1900, 2100]

binarySearch(from: numbersTest, search: 10, start: 0, end: numbersTest.count - 1)
binarySearch(from: numbersTest, search: 90, start: 0, end: numbersTest.count - 1)
binarySearch(from: numbersTest, search: 2100, start: 0, end: numbersTest.count - 1)

// 4. 使用range更方便
func binarySearch<T: Comparable>(_ array: [T], key: T, range: Range<Int>) -> Int? {
    // upperBound总是比数组的last index多一
    guard range.upperBound > range.lowerBound else { return nil }
    
    let mid = range.lowerBound + (range.upperBound  - range.lowerBound) / 2
    
    if key == array[mid] {
        return mid
    } else if key > array[mid] {
        return binarySearch(array, key: key, range: (mid + 1) ..< range.upperBound)
    } else if key < array[mid] {
        return binarySearch(array, key: key, range: range.lowerBound ..< mid)
    }
    
    return nil
}

binarySearch(numbersTest, key: 2100, range: 0..<numbersTest.count)

// 5. 将递归转化为循环
func binarySearch<T: Comparable>(array: [T], key: T) -> Int? {
    // 注意递归的时候，什么发生了变化，就将什么转化为循环
    var upperBound = array.count
    var lowerBound = 0
    
    var index: Int? = nil
    
    while lowerBound < upperBound {
        let mid = lowerBound + (upperBound - lowerBound)/2
        if array[mid] == key {
            index = mid
            break
        } else if array[mid] > key {
            upperBound = mid
        } else if array[mid] < key {
            lowerBound = mid + 1
        }
    }

    return index
}

binarySearch(array: numbersTest, key: 2100)
binarySearch(array: numbersTest, key: 1)
binarySearch(array: numbersTest, key: 1099)
