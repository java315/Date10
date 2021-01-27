//
//  Spot.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/26.
//

import Foundation
import UIKit
class Spot {
    var name : String
    var address : String
    var images = [UIImage]()
    var frontImg : UIImage?
    var hotValue : Int
    var shortComment : String?
    var score : Float
    var comments = [SpotComment]()
    
    init?(name:String, address:String,shortComment:String?){
        guard !name.isEmpty else {
            return nil
        }
        
        guard !address.isEmpty else {
            return nil
        }
        
        self.name = name
        self.address = address
        self.shortComment = shortComment
        self.hotValue = 0
        self.score = 0.0
        
    }
    
    func addImages(images : [UIImage]) {
        if self.images.isEmpty {
            self.frontImg = images.first
        }
        self.images += images
    }
    
    func addImage(image: UIImage) {
        if self.images.isEmpty {
            self.frontImg = image
        }
        self.images.append(image)
    }
    
    func setShortComent(shortComment : String) {
        self.shortComment = shortComment
    }
    
    func getScore() -> Float{
        var totalScore : Float = 0.0
        for comment in comments {
            totalScore += Float(comment.score)
        }
        return totalScore / Float(comments.count)
    }
    
    func getHotValue() -> Int {
        return comments.count
    }
}
