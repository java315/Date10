//
//  SpotDetailViewController.swift
//  Date10
//
//  Created by zb-nju on 2021/1/27.
//

import UIKit

class SpotDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var banner: GXBanner!
    @IBOutlet weak var commentCollection: UICollectionView!
    
    var spot: Spot!
    var image = [UIImage]()
    var comments = [SpotComment]()
    let globalData = GlobalData.getInstance()
    let likeImg = UIImage(named: "like")
    let unlikeImg = UIImage(named: "unlike")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.image = spot.images
        self.comments = spot.comments
        self.nameLabel.text = spot.name
        self.commentCollection.delegate = self
        self.commentCollection.dataSource = self
    }

}

extension SpotDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = commentCollection.dequeueReusableCell(withReuseIdentifier: "SpotCommentCell", for: indexPath) as! SpotDetailCommentCollectionViewCell
        let comment = comments[indexPath.row]
        let commenter = globalData.getUser(comment.commenter)
        
        cell.commenterAvatar.image = commenter?.avatar
        cell.commenterName.text = commenter?.name
        cell.date.text = DateUtil.ZoneTime(date: comment.date, dateFormat: "MM-dd HH:mm:ss")
        cell.content.text = comment.content
        cell.likeImg.image = comment.liked ? likeImg : unlikeImg
        cell.likeNumber.text = String(comment.likes)
        return cell
    }
}
