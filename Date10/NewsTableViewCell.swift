//
//  NewsTableViewCell.swift
//  Date10
//
//  Created by zb-nju on 2021/1/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var CellImageView: UIImageView!
    @IBOutlet weak var LikeNumber: UILabel!
    @IBOutlet weak var LikeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
