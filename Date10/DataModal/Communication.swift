//
//  Communication.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/24.
//

import Foundation
import os.log
class Communication : NSObject, NSCoding{
    func encode(with coder: NSCoder) {
        coder.encode(users,forKey: PropertyKey.users)
        coder.encode(messages, forKey: PropertyKey.messages)
    }
    
    private var messages = [Message]()
    private var users = [String]()
    struct PropertyKey {
        static let users = "users"
        static let messages = "messages"
        
    }
    
    static let DocumentsDirectory = FileManager().urls(for:.documentDirectory,in:.userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("communication")
    
    init?(userA:String,userB:String){
        guard !userA.isEmpty else {
            return nil
        }
        
        guard !userB.isEmpty else {
            return nil
        }
        
        self.users.append(userA)
        self.users.append(userB)
    }
    
    init?(users:[String] , messages: [Message]){
        self.users += users
        self.messages += messages
    }
    
    public func sendMessage(message : Message) {
        messages.append(message)
    }
    
    public func getLeastMessage() -> Message? {
        return messages.last
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let users = aDecoder.decodeObject(forKey: PropertyKey.users) as? [String] else {
            os_log("Unable to decode the users for a Communication object", log:OSLog.default,type:.debug)
            return nil
        }
        guard let messages = aDecoder.decodeObject(forKey: PropertyKey.messages) as? [Message] else {
            os_log("Unable to decode the users for a Communication object", log:OSLog.default,type:.default)
            return nil
        }
        self.init(users:users,messages:messages)
    }
    
}
