//
//  Food.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/25.
//

import Foundation
import  UIKit
class Food {
    var name : String
    var score : Float
    var averagePrice : Float
    var address : String?
    var shortComment : String?
    private var frontImg : UIImage?
    private var images = [UIImage]()
    private var comments = [FoodComment]()
    
    init?(name:String) {
        guard !name.isEmpty else {
            return nil
        }
        self.name = name
        self.score = 0.0
        self.averagePrice = 0.0
    }
    
    init?(name:String, address:String?, shortComment:String?){
        guard !name.isEmpty else {
            return nil
        }
        self.name = name
        self.score = 0.0
        self.averagePrice = 0.0
        self.address = address
        self.shortComment = shortComment
        
    }
    func addComment(comment : FoodComment) {
        self.comments.append(comment)
        
    }
    func getCommentsCount() -> Int {
        return self.comments.count
    }
    
    func getScore() -> Float{
        var totalScore : Float = 0.0
        for comment in comments {
            totalScore += Float(comment.score)
        }
        return totalScore / Float(comments.count)
    }
    
    func getAveragePrice() -> Float {
        var totalPrice : Float = 0.0
        for comment in comments {
            totalPrice += Float(comment.price)
        }
        return totalPrice / Float(comments.count)
    }
    
}
