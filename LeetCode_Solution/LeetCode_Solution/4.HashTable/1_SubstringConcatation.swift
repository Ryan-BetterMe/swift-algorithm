//
//  1_SubstringConcatation.swift
//  LeetCode_Solution
//
//  Created by Ryan on 2022/1/6.
//

import Foundation


let a = "123"

let b = Set(a)

let dic: [Set<Character>: [Int]] = [:]

// 问题是将同字母不同序列的添加到一个数组中：
func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dic: [String: [String]] = [:]
    
    for str in strs {
        let key = str.sorted().reduce("") {
            "\($0)" + "\($1)"
        }
        
        if dic.keys.contains(key) {
            dic[key] = dic[key]! + [str]
        } else {
            dic[key] = [str]
        }
    }
    return Array(dic.values)
}

struct Message<T> {
    let str: String
    let cloure: (Data) -> T
    
    init(string: String, parse:@escaping (Any) -> T) {
        self.str = string
        self.cloure = { data in
            let result = try? JSONSerialization.jsonObject(with: data, options: [])
            return parse(result!)
        }
    }
}


func testMessage() {
    let message = Message<Int>.init(string: "") { pam in
        
        let a = 2
        
        let c = 3 + a
        
        return 1
    }
}
