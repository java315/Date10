//
//  Comment.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/25.
//

import Foundation
import UIKit
class Comment {
    var commenter : String
    var content : String
    var date : Date
    var likes : Int
    var liked : Bool
    var avatar : UIImage
    init?(commenter : String, content : String, liked : Bool?) {
        guard !commenter.isEmpty else {
            return nil
        }
        
        guard !content.isEmpty else {
            return nil
        }
        
        self.content = content
        self.commenter = commenter
        self.date = Date()
        self.likes = 0
        self.liked = liked ?? false
        self.avatar = UIImage(named: "user")!
    }
    
    init?(commenter : String, content : String, liked : Bool?, avatar:UIImage?) {
        guard !commenter.isEmpty else {
            return nil
        }
        
        guard !content.isEmpty else {
            return nil
        }
        
        self.content = content
        self.commenter = commenter
        self.date = Date()
        self.likes = 0
        self.liked = liked ?? false
        self.avatar = avatar ?? UIImage(named: "user")!
    }
    
    public func like(){
        if !liked {
            likes += 1
            liked = true
        }
    }
    

}

class PostComment : Comment {
    
}

class FoodComment : Comment {
    var price : Float
    var images = [UIImage]()
    var score : Int
    
    init?(commenter : String, content : String, price : Float, score : Int, liked : Bool?) {
        self.price = price
        self.score = score
        super.init(commenter:commenter,content:content,liked: liked)
        
    }
    
    init?(commenter : String, content : String, price : Float, score : Int, liked : Bool?,avatar : UIImage?) {
        self.price = price
        self.score = score
        super.init(commenter:commenter,content:content,liked: liked, avatar: avatar)
        
    }
    
    func addImage(image:UIImage){
        images.append(image)
    }
    
    func addImages(images:[UIImage]) {
        self.images += images
    }
}


class SpotComment : FoodComment {
    
}
