//
//  FoodDetailViewController.swift
//  Date10
//
//  Created by zb-nju on 2021/1/27.
//

import UIKit

class FoodDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var banner: GXBanner!
    @IBOutlet weak var commentCollection: UICollectionView!
    
    var food: Food!
    var images = [UIImage]()
    var comments = [FoodComment]()
    let globalData = GlobalData.getInstance()
    let likeImg = UIImage(named: "like")
    let unlikeImg = UIImage(named: "unlike")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.images = food.images
        self.comments = food.comments
        self.nameLabel.text = food.name
        self.commentCollection.delegate = self
        self.commentCollection.dataSource = self
        
        self.banner.backgroundColor = .gray
        self.banner.autoTimeInterval = 3.0
        self.banner.dataSource = self
        self.banner.delegate = self
        self.banner.register(classCellType: GXBannerCell.self)
        self.banner.reloadData()
    }

}

extension FoodDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = commentCollection.dequeueReusableCell(withReuseIdentifier: "FoodCommentCell", for: indexPath) as! FoodDetailCommentCollectionViewCell
        let comment = comments[indexPath.row]
        let commenter = globalData.getUser(comment.commenter)
        
        cell.commenterAvatar.image = commenter?.avatar
        cell.nameLabel.text = commenter?.name
        cell.dateLabel.text = DateUtil.ZoneTime(date: comment.date, dateFormat: "MM-dd HH:mm:ss")
        cell.content.text = comment.content
        cell.likeImg.image = comment.liked ? likeImg : unlikeImg
        cell.likeNumber.text = String(comment.likes)
        return cell
    }
}

extension FoodDetailViewController: GXBannerDelegate, GXBannerDataSource{
    func numberOfItems() -> Int {
        return images.count
    }
    
    func banner(_ banner: GXBanner, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell: GXBannerCell = banner.dequeueReusableCell(for: indexPath)
            cell.contentView.layer.masksToBounds = true
            cell.contentView.layer.cornerRadius = 10
            cell.iconIView.image = images[indexPath.row]
            
            return cell
    }
    
    
}
