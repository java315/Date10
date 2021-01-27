//
//  WeViewController.swift
//  Date10
//
//  Created by zb-nju on 2021/1/25.
//

import UIKit

class WeViewController: UIViewController {
    @IBOutlet weak var boyAvatar: UIImageView!
    @IBOutlet weak var boyName: UILabel!
    @IBOutlet weak var girlAvatar: UIImageView!
    @IBOutlet weak var girlName: UILabel!
    @IBOutlet weak var togetherTimeLabel: UILabel!
    @IBOutlet weak var sweetValueLabel: UILabel!
    @IBOutlet weak var couplePostCollection: UICollectionView!
    
    var couple: Couple!
    var couplePosts = [Post]()
    let globalData = GlobalData.getInstance()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        couple = globalData.getCouple(globalData.getCurrentUser()!)
        couplePosts = globalData.getCouplePosts(couple)
        
        let boy = globalData.getUser(couple.boy)
        boyAvatar.image = boy?.avatar
        boyName.text = boy?.name
        let girl = globalData.getUser(couple.girl)
        girlAvatar.image = girl?.avatar
        girlName.text = girl?.name
        
        togetherTimeLabel.text = "在一起\(DateUtil.countDays(startDate: couple.startTime,endDate: Date()))啦！"
        sweetValueLabel.text = "我们的甜蜜度为\(couple.sweetValue)"
        
        couplePostCollection.delegate = self
        couplePostCollection.dataSource = self
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
            guard let postDetailViewController = segue.destination as? PostDetailViewController else{
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedCell = sender as? WePostCollectionViewCell else{
                fatalError("Unexpected sender:\(String(describing: sender))")
            }
            
            guard let indexPath = couplePostCollection.indexPath(for: selectedCell) else{
                fatalError("The selected cell is not being displayed by the collection")
            }
            
            let selectedPost = couplePosts[indexPath.row]
            postDetailViewController.post = selectedPost
    }


}

extension WeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return couplePosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = couplePostCollection.dequeueReusableCell(withReuseIdentifier: "WePostCollectionCell", for: indexPath) as! WePostCollectionViewCell
        let post = couplePosts[indexPath.row]
        let poster = globalData.getUser(post.poster)
        cell.frontImg.image = post.frontImg
        cell.posterName.text = poster?.name
        cell.posterAvatar.image = poster?.avatar
        cell.title.text = post.title
        
        return cell
    }
    
    
}
