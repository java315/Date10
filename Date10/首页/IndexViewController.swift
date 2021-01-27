//
//  IndexViewController.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/24.
//

import UIKit

class IndexViewController: UIViewController {
    var button = ["美食","景点"]
    let likeImg = UIImage(named: "like")
    let unlikeImg = UIImage(named: "unlike")
    @IBOutlet weak var buttonCollection: UICollectionView!
    @IBOutlet weak var postCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPosts()
        postCollection.delegate = self
        postCollection.dataSource = self
        buttonCollection.delegate = self
        buttonCollection.dataSource = self
    }
    
    var posts : [Post] = []
    private func loadPosts(){
        let globalData = GlobalData.getInstance()
        if globalData.getFirstLogin() {
            self.posts = globalData.getAllPosts()
        }
        else {
            self.posts = globalData.getAllPosts()
            //self.posts = NSKeyedUnarchiver.unarchivedObject(withFile : Post.ArchiveURL.path) as? [Post]
        }
        
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
            
            guard let selectedCell = sender as? IndexPostCollectionViewCell else{
                fatalError("Unexpected sender:\(String(describing: sender))")
            }
            
            guard let indexPath = postCollection.indexPath(for: selectedCell) else{
                fatalError("The selected cell is not being displayed by the collection")
            }
            
            let selectedPost = posts[indexPath.row]
            postDetailViewController.post = selectedPost
    }
    

}

extension IndexViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(collectionView)
        switch collectionView.restorationIdentifier! {
            case "ButtonCollection":
                return button.count
            case "PostCollection":
                print(posts.count)
                return posts.count
            default:
                return 0
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.restorationIdentifier! {
            case "ButtonCollection":
                let cell = buttonCollection.dequeueReusableCell(withReuseIdentifier: "ButtonCollectionViewCell", for: indexPath) as! ButtonCollectionViewCell
                cell.buttonClickedDelegate = self
                cell.label.text = button[indexPath.row]
                return cell
            case "PostCollection":
                let cell = postCollection.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as! IndexPostCollectionViewCell
                let post = posts[indexPath.row]
                cell.frontImg.image = post.frontImg
                cell.title.text = post.title
                cell.likeImg.image = post.liked ? likeImg : unlikeImg
                cell.likeNumber.text = String(post.likes)
                return cell
            default:
                fatalError()
        }
    }
}

extension IndexViewController: ButtonClickedDelegate{
    func buttonClicked(_ clickedButton: String) {
        switch clickedButton {
        case "美食":
            let newVC = self.storyboard?.instantiateViewController(withIdentifier: "FoodViewController")
            self.navigationController?.pushViewController(newVC!, animated: true)
        case "景点":
            let newVC = self.storyboard?.instantiateViewController(withIdentifier: "SpotViewController")
            self.navigationController?.pushViewController(newVC!, animated: true)
        default:
            return
        }
    }
}
