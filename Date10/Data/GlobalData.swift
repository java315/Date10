//
//  GlobalData.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/26.
//

import Foundation
import UIKit

class GlobalData {
    static let globalData : GlobalData = GlobalData()
    struct defaultsKeys {
        static let NotFirstLogin = "NotFirstLogin"
    }
    
    private var firstLogin : Bool = false
    private var Users : [User] = []
    private var Couples = [Couple]()
    private var Foods = [Food]()
    private var Spots = [Spot]()
    private var Posts = [Post]()
    private var user : User?
    private var FoodComments = [FoodComment]()
    private init() {
        let defaults = UserDefaults.standard
        let f = defaults.bool(forKey: defaultsKeys.NotFirstLogin)
        print("flag:",f)
        if !defaults.bool(forKey: defaultsKeys.NotFirstLogin) {
            self.firstLogin = true
            defaults.set(false, forKey: defaultsKeys.NotFirstLogin)
        }
        else {
            self.firstLogin = false
        }
        
        initUsers()
        initCouples()
        initFoods()
        initPosts()
        initSpots()
        initUser()
    }
    
    private func initUser() {
        self.user = self.Users.first
    }
    
    private func initUsers(){
        for i in 1...Constant.UsersNum {
            Users.append(User(name: "boy"+String(i), npy: "girl"+String(i), birthday: Date(), avatar: UIImage(), sex: true)!)
            Users.append(User(name: "girl"+String(i), npy: "boy"+String(i), birthday: Date(), avatar: UIImage(), sex: true)!)
        }
    }
    
    private func initCouples(){
        for i in 1...Constant.UsersNum {
            Couples.append(Couple(boy: "boy"+String(i), girl: "girl"+String(i), startTime: DateUtil.randomDate())!)
        }
    }
    
    private func initFoods(){
        for foodName in Constant.FoodNames {
            Foods.append(Food(name: foodName, address: RandomUtil.randomChoice(Constant.Addresses), shortComment: RandomUtil.randomChoice(Constant.ShortComments))!)
        }
    }
    
    private func initPosts(){
        for postTitle in Constant.PostTitles {
            Posts.append(Post(poster: "boy1", title: postTitle, content: RandomUtil.randomChoice(Constant.PostContents), isPublic: true, address: RandomUtil.randomChoice(Constant.Addresses), liked: false)!)
        }
        print(self.Posts.count)
        
    }
    
    private func initSpots(){
        for spotName in Constant.SpotNames {
            Spots.append(Spot(name: spotName, address: RandomUtil.randomChoice(Constant.Addresses), shortComment: RandomUtil.randomChoice(Constant.ShortComments))!)
            // 加入图片
            
        }
    }
    
    private func initFoodComments() {
        let max_comment_count = 200
        guard let jsonResult = readJSONFromFile(filename: "comment_data.json") as? [[String:Any]] else {
            return
        }
        for i in 0...max_comment_count {
            let r = jsonResult[i]
            let content = r["content"] as? String
            let commenter = (r["commenter"] as? String)!
            let avatarUrl = r["avatarUrl"] as? String
            let price = r["price"] as? Int
            let likes = r["likes"] as? Int
            let date = r["date"] as? String
            let readCnt = r["readCnt"] as? Int
            let score = (r["score"] as? Int)!
            self.FoodComments.append(FoodComment(commenter: commenter, content: content!, price: Float(price!), score: score, liked: false)!)
        }
    }
    
    func readJSONFromFile(filename: String) -> Any? {
        var json : Any?
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl,options: .mappedIfSafe)
                json = try? JSONSerialization.jsonObject(with: data)
            } catch {
                
            }
        }
        return json
    }
    
    public func getFirstLogin() -> Bool {
        print(self.firstLogin)
        return self.firstLogin
    }
    
    static public func getInstance() -> GlobalData {
        return self.globalData
    }
    
    public func getUser(_ name : String) -> User? {
        for user in Users {
            if user.name == name {
                return user
            }
        }
        return nil
    }
    
    public func getCouple(_ user : User) -> Couple? {
        for couple in Couples {
            if user.sex! {
                if user.name == couple.boy {
                    return couple
                }
            }
            else {
                if user.name == couple.girl {
                    return couple
                }
            }
        }
        return nil
    }
    
    public func getCouplePosts(_ user : User) -> [Post]? {
        let cp = getCouple(user)
        guard cp != nil else {
            return nil
        }
        
        var posts : [Post] = []
        posts += getUserPosts(getUser(cp!.boy)!)
        posts += getUserPosts(getUser(cp!.girl)!)
        // 不确定是日期升序还是降序
        posts.sort(){DateUtil.compareDate(date1: $0.postDate, date2: $1.postDate) > 0}
        return posts
    }
    
    public func getUserPosts(_ user : User) -> [Post] {
        var posts : [Post] = []
        for post in Posts {
            if post.poster == user.name {
                posts.append(post)
            }
        }
        return posts
    }
    
    public func getAllPosts() -> [Post]{
        return self.Posts
    }
    
    public func getCurrentUser() -> User? {
        return self.user
    }
    
    public func getSomeComments() -> [FoodComment] {
        return self.FoodComments
    }
    
    public func getSpots() -> [Spot] {
        return self.Spots
    }
}
