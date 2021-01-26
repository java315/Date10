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
    
    init?(commenter : String, content : String) {
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
    }
}

class PostComment : Comment {
    
}

class FoodComment : Comment {
    var price : Float
    var images = [UIImage]()
    var score : Int
    
    init?(commenter : String, content : String, price : Float, score : Int) {
        self.price = price
        self.score = score
        super.init(commenter:commenter,content:content)
        
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
