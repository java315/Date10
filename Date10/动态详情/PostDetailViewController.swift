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
    var post:Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.banner.backgroundColor = .gray
        self.banner.autoTimeInterval = 3.0
        self.banner.dataSource = self
        self.banner.delegate = self
        self.banner.register(classCellType: GXBannerCell.self)
        self.banner.reloadData()

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

extension PostDetailViewController: GXBannerDelegate, GXBannerDataSource{
    func numberOfItems() -> Int {
        3
    }
    
    func banner(_ banner: GXBanner, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell: GXBannerCell = banner.dequeueReusableCell(for: indexPath)
            cell.contentView.layer.masksToBounds = true
            cell.contentView.layer.cornerRadius = 10
            cell.iconIView.image = UIImage(named: String(format: "banner%d.jpeg", indexPath.row))
            
            return cell
    }
    
    
}
