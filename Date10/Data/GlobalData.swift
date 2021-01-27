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
    private var Messages = [Message]()
    private var Communications = [Communication]()
    private var AvatarUrls = [String]()
    private var FoodImageUrls = [String]()
    private init() {
        let defaults = UserDefaults.standard
        let f = defaults.bool(forKey: defaultsKeys.NotFirstLogin)
        if !defaults.bool(forKey: defaultsKeys.NotFirstLogin) {
            self.firstLogin = true
            defaults.set(false, forKey: defaultsKeys.NotFirstLogin)
        }
        else {
            self.firstLogin = false
        }
        
        initAvatarUrls()
        initFoodImageUrls()
        initUsers()
        initFoodComments()
        initCouples()
        initFoods()
        initPosts()
        initSpots()
        initUser()
        
        initMessages()
        initCommunications()
        
    }
    
    private func initUser() {
        self.user = self.Users.first
    }
    
    private func initUsers(){
        for i in 1...Constant.UsersNum {
            Users.append(User(name: "boy"+String(i), npy: "girl"+String(i), birthday: Date(), avatar: randomChoiceImageFromUrls(AvatarUrls), sex: true)!)
            Users.append(User(name: "girl"+String(i), npy: "boy"+String(i), birthday: Date(), avatar: randomChoiceImageFromUrls(AvatarUrls), sex: false)!)
        }
    }
    
    private func initCouples(){
        for i in 1...Constant.UsersNum {
            Couples.append(Couple(boy: "boy"+String(i), girl: "girl"+String(i), startTime: DateUtil.randomDate())!)
        }
    }
    
    private func initFoods(){
        for foodName in Constant.FoodNames {
            var f = Food(name: foodName, address: RandomUtil.randomChoice(Constant.Addresses), shortComment: RandomUtil.randomChoice(Constant.ShortComments))!
            f.addImages(images: randomChoiceImagesFromUrls(FoodImageUrls))
            print(f.images.count)
            f.addComments(comments: getSomeComments())
            Foods.append(f)
            
        }
    }
    
    private func initPosts(){
        for postTitle in Constant.PostTitles {
            var p = Post(poster: "boy1", title: postTitle, content: RandomUtil.randomChoice(Constant.PostContents), isPublic: true, address: RandomUtil.randomChoice(Constant.Addresses), liked: false)!
            p.addImages(images: randomChoiceImagesFromUrls(FoodImageUrls))
            Posts.append(p)
        }
        
        
    }
    
    private func initSpots(){
        for spotName in Constant.SpotNames {
            Spots.append(Spot(name: spotName, address: RandomUtil.randomChoice(Constant.Addresses), shortComment: RandomUtil.randomChoice(Constant.ShortComments))!)
            // 加入图片
            Spots.last?.addImages(images: randomChoiceImagesFromUrls(FoodImageUrls))
            
        }
    }
    
    private func initFoodComments() {
        let max_comment_count = 200
        guard let jsonResult = readJSONFromFile(filename: "comments") as? [[String:Any]] else {
            print("error for food comment json result")
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
            self.FoodComments.append(FoodComment(commenter: commenter, content: content!, price: Float(price!), score: score, liked: false, avatar: randomChoiceImageFromUrls(AvatarUrls))!)
        }
        /*
        for fc in self.FoodComments{
            print(fc.commenter)
        }
         */
    }
    
    private func initAvatarUrls() {
        guard let jsonResult = readJSONFromFile(filename: "avatars") as? [String] else {
            print("error for avatar json result")
            return
        }
        print("avatar urls count \(jsonResult.count)")
        self.AvatarUrls = jsonResult
    }
    
    private func initFoodImageUrls() {
        guard let jsonResult = readJSONFromFile(filename: "food_images") as? [String] else {
            print("error for food image json result")
            return
        }
        print("food image urls count \(jsonResult.count)")
        self.FoodImageUrls = jsonResult
    }
    
    private func randomChoiceImagesFromUrls(_ urls : [String]) -> [UIImage] {
        let count = RandomUtil.randomNumber(1, 3)
        var images = [UIImage]()
        for _ in 1...count {
            if let image = ImageUtil.getWebImage(RandomUtil.randomChoice(urls)) {
                images.append(image)
            }
            else {
                //fatalError("load web image fail")
            }
            
        }
        return images
    }
    
    private func randomChoiceImageFromUrls(_ urls : [String]) -> UIImage {
        let url = RandomUtil.randomChoice(urls)
        if let image = ImageUtil.getWebImage(url) {
            return image
        }
        else{
            return UIImage(named: "user")!
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
                
                print(error)
            }
        } else {
            print("resource not found")
        }
        
        return json
    }
    
    private func initMessages(){
        for _ in 0...40 {
            self.Messages.append(Message(sender: RandomUtil.randomChoice(self.Users).name, content: RandomUtil.randomChoice(Constant.ShortComments), sendTime: DateUtil.randomDate())!)
        }
    }
    
    private func initCommunications() {
        for _ in 0...40 {
            let m = RandomUtil.randomChoice(Messages)
            self.Communications.append(Communication(userA: "boy1", userB: m.sender)!)
            self.Communications.last?.sendMessage(message: m)
        }
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
        if user.sex! {
            for couple in Couples {
                if user.name == couple.boy {
                    return couple
                }
            }
        }
        else {
            for couple in Couples {
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
        return getCouplePosts(cp!)
    }
    
    public func getCouplePosts(_ couple : Couple) -> [Post]{
        var posts : [Post] = []
        posts += getUserPosts(getUser(couple.boy)!)
        posts += getUserPosts(getUser(couple.girl)!)
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
        var comments = [FoodComment]()
        for _ in 1...10 {
            comments.append(RandomUtil.randomChoice(FoodComments))
        }
        return comments
    }
    
    public func getSpots() -> [Spot] {
        return self.Spots
    }
    
    public func getFoods() -> [Food]{
        return self.Foods
    }
    
    public func getFoodComments() -> [FoodComment] {
        return self.FoodComments
    }
    
    public func getAllCommunications() -> [Communication] {
        return self.Communications
    }
}
