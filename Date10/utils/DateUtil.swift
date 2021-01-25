//
//  DateUtil.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/25.
//

import Foundation
class DateUtil {
    static var FullDateFormat = "YYY-MM-dd HH:mm:ss"
    static var FullTimeFormat = "HH:mm:ss"
    // 获取当前系统时间（String类型的GMT时间）
    static func currentTime(dateFormat : String?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat ?? FullDateFormat
        return dateFormatter.string(from: Date())
    }
    
    // 获取当前系统时区时间（String类型）
    static func currentZoneTime(dateFormat : String?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat ?? FullDateFormat
        var now = Date()
        let zone = NSTimeZone.system
        let interval = zone.secondsFromGMT()
        now.addTimeInterval(TimeInterval(interval))
        return dateFormatter.string(from: now)
    }
    
    // 将Date转换为时区时间（String）
    static func ZoneTime(date: Date, dateFormat : String?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat ?? FullDateFormat
        let zone = NSTimeZone.system
        let interval = zone.secondsFromGMT()
        let now = date.addingTimeInterval(TimeInterval(interval))
        return dateFormatter.string(from: now)
    }
    
    // 日期之间的比较
    static func compareDate(date1:Date,date2:Date) -> Int {
        let result = date1.compare(date2)
        switch result {
        case .orderedDescending: // date1 < date2
            return 1
        case .orderedSame:       // date1 == date2
            return 0
        case .orderedAscending:  // date1 > date2
            return -1
        }
    }
    
    // 计算两个日期相差的天数
    static func countDays(startDate:Date,endDate:Date) -> Int{
        let c = Calendar.current.dateComponents([.day], from: startDate, to: endDate)
        return c.day ?? -1
    }
    
    
}
