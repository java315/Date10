//
//  User.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/25.
//

import Foundation
import UIKit
import os.log
class User : NSObject, NSCoding{
    var name : String
    var npy : String?
    var fans = [String]()
    var followings = [String]()
    var birthday : Date?
    var avatar : UIImage?
    var sex : Bool?
    init(name:String) {
        self.name = name
    }
    
    init?(name:String,npy:String?,birthday:Date?,avatar:UIImage?,sex:Bool?){
        guard !name.isEmpty else {
            return nil
        }
        
        self.name = name
        self.npy = npy
        self.birthday = birthday
        self.avatar = avatar
        self.sex = sex
    }
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("user")
    
    required convenience init?(coder: NSCoder) {
        guard let name = coder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a User object", log:OSLog.default,type:.debug)
            return nil
        }
        let npy = coder.decodeObject(forKey: PropertyKey.npy) as? String
        let birthday = coder.decodeObject(forKey: PropertyKey.birthday) as? Date
        let sex = coder.decodeObject(forKey: PropertyKey.sex) as? Bool
        let avatar = coder.decodeObject(forKey: PropertyKey.avatar) as? UIImage
        self.init(name:name,npy:npy,birthday:birthday, avatar: avatar,sex:sex)
    }
    
    func follow(user:String) {
        self.followings.append(user)
    }
    
    func fetchFans(users:[String]) {
        self.fans += users
    }
    
    struct PropertyKey {
        static let name = "name"
        static let npy = "npy"
        static let fans = "fans"
        static let sex = "sex"
        static let birthday = "birthday"
        static let avatar = "avatar"
        static let follwings = "follwings"
        
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name,forKey:PropertyKey.name)
        coder.encode(npy,forKey:PropertyKey.npy)
        coder.encode(sex,forKey: PropertyKey.sex)
        coder.encode(birthday,forKey: PropertyKey.birthday)
        coder.encode(fans,forKey: PropertyKey.fans)
        coder.encode(followings,forKey: PropertyKey.follwings)
        coder.encode(avatar,forKey: PropertyKey.avatar)
        
    }
    
    
    
    
}
