//
//  Post.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/25.
//

import Foundation
import UIKit
class Post {
    var postId : Int?
    var title : String
    var content : String
    var poster : String
    var likes : Int
    var images = [UIImage]()
    var isPublic : Bool
    var address : String
    var postDate : Date
    var comments = [PostComment]()
    var frontImg:UIImage?
    var liked : Bool
    init?(poster:String,title:String,content:String,isPublic:Bool,address : String, liked : Bool?) {
        guard !poster.isEmpty else {
            return nil
        }
        guard !title.isEmpty else {
            return nil
        }
        guard !content.isEmpty else {
            return nil
        }
        self.poster = poster
        self.content = content
        self.postDate = Date()
        self.isPublic = isPublic
        self.address = address
        self.likes = 0
        self.title = title
        self.liked = liked ?? false
    }
    
    func addImages(images:[UIImage]){
        if self.images.isEmpty {
            frontImg = images.first
        }
        self.images += images
    }
    
    func addImage(image:UIImage) {
        if self.images.isEmpty {
            frontImg = image
        }
        self.images.append(image)
    }
    
    public func like(){
        if !liked {
            liked = true
            likes += 1
        }
    }
    
}
