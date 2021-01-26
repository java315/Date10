//
//  RandomUtil.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/26.
//

import Foundation
class RandomUtil {
    static func randomChoice<T>(_ array : [T]) -> T {
        let count = array.count
        return array[Int(arc4random_uniform(UInt32(count)))]
    }
    
    // return [start,end)
    static func randomNumber(_ start:Int, _ end:Int) -> Int {
        return Int(arc4random_uniform(UInt32(end-start))) + start
    }
}
