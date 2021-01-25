//
//  Couple.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/25.
//

import Foundation

class Couple {
    var boy : String
    var girl : String
    var startTime : Date
    var sweetValue : Int
    
    init?(boy:String,girl:String,startTime:Date?){
        guard !boy.isEmpty else {
            return nil
        }
        
        guard !girl.isEmpty else {
            return nil
        }
        
        self.boy = boy
        self.girl = girl
        self.startTime = startTime ?? Date()
        self.sweetValue = 0
    }
    
    func getCountDays() -> Int {
        return DateUtil.countDays(startDate: startTime, endDate: Date())
    }
    
}
