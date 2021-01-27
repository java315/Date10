//
//  NewsDetailViewController.swift
//  Date10
//
//  Created by zb-nju on 2021/1/25.
//

import UIKit

class PostDetailViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var posterAvatar: UIImageView!
    @IBOutlet weak var posterName: UILabel!
    @IBOutlet weak var banner: GXBanner!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var likeNumber: UILabel!
    @IBOutlet weak var commentCollection: UICollectionView!
    
    var post:Post!
    var comments = [PostComment]()
    let globalData = GlobalData.getInstance()
    let likeImg = UIImage(named: "like")
    let unlikeImg = UIImage(named: "unlike")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let poster = globalData.getUser(post.poster)!
        posterAvatar.image = poster.avatar
        posterName.text = poster.name
        content.text = post.content
        addressLabel.text = post.address
        postDateLabel.text = DateUtil.ZoneTime(date: post.postDate, dateFormat: "MM-dd HH:mm:ss")
        
        likeImageView.image = post.liked ? likeImg : unlikeImg
        likeNumber.text = String(post.likes)
        
        self.banner.backgroundColor = .gray
        self.banner.autoTimeInterval = 3.0
        self.banner.dataSource = self
        self.banner.delegate = self
        self.banner.register(classCellType: GXBannerCell.self)
        self.banner.reloadData()

        self.commentCollection.delegate = self
        self.commentCollection.dataSource = self
        
        self.comments = post.comments
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PostDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        comments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = commentCollection.dequeueReusableCell(withReuseIdentifier: "PostCommentCell", for: indexPath) as! PostCommentCollectionViewCell
        let comment = comments[indexPath.row]
        let commenter = globalData.getUser(comment.commenter)
        
        cell.commenterAvatar.image = commenter?.avatar
        cell.commenterNameLabel.text = commenter?.name
        cell.dateLabel.text = DateUtil.ZoneTime(date: comment.date, dateFormat: "MM-dd HH:mm:ss")
        cell.content.text = comment.content
        cell.likeImage.image = comment.liked ? likeImg : unlikeImg
        cell.likeNumber.text = String(comment.likes)
        return cell
    }
    
    
}

extension PostDetailViewController: GXBannerDelegate, GXBannerDataSource{
    func numberOfItems() -> Int {
        return post.images.count
    }
    
    func banner(_ banner: GXBanner, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell: GXBannerCell = banner.dequeueReusableCell(for: indexPath)
            cell.contentView.layer.masksToBounds = true
            cell.contentView.layer.cornerRadius = 10
            cell.iconIView.image = post.images[indexPath.row]
            
            return cell
    }
    
    
}
