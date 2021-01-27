//
//  PostCommentCollectionViewCell.swift
//  Date10
//
//  Created by zb-nju on 2021/1/26.
//

import UIKit

class PostCommentCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var commenterAvatar: UIImageView!
    @IBOutlet weak var commenterNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var likeNumber: UILabel!
    @IBOutlet weak var likeImage: UIImageView!
    
}
