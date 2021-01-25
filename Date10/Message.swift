//
//  Message.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/24.
//

import Foundation
import UIKit
import os.log
class Message : NSObject,NSCoding {
    var sender : String
    var content : String
    var sendTime : Date?
    
    struct PropertyKey {
        static let sender = "sender"
        static let content = "content"
        static let sendTime = "sendTime"
        
    }
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("message")
    
    init?(sender:String,content:String,sendTime:Date?) {
        guard !sender.isEmpty else {
            return nil
        }
        
        guard !content.isEmpty else {
            return nil
        }
        
        self.content = content
        self.sender = sender
        self.sendTime = sendTime
    }
    
    
    func encode(with coder: NSCoder) {
        coder.encode(sender,forKey: PropertyKey.sender)
        coder.encode(content,forKey: PropertyKey.content)
        coder.encode(sendTime,forKey: PropertyKey.sendTime)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let sender = aDecoder.decodeObject(forKey: PropertyKey.sender) as? String else {
            os_log("Unable to decode the sender for a Product object", log:OSLog.default,type:.debug)
            return nil
        }
        let sendTime = aDecoder.decodeObject(forKey: PropertyKey.sendTime) as? Date
        
        guard let content = aDecoder.decodeObject(forKey: PropertyKey.content) as? String else {
            return nil
        }
        self.init(sender:sender,content:content,sendTime:sendTime)
    }
    
    
    
}
