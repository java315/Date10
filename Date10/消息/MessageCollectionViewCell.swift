//
//  MessageCollectionViewCell.swift
//  Date10
//
//  Created by zb-nju on 2021/1/25.
//

import UIKit

class MessageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var senderAvatar: UIImageView!
    @IBOutlet weak var senderName: UILabel!
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
