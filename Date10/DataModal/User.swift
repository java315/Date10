//
//  User.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/25.
//

import Foundation
import UIKit
class User {
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
    
    func follow(user:String) {
        self.followings.append(user)
    }
    
    func fetchFans(users:[String]) {
        self.fans += users
    }
}
