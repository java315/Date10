//
//  IndexViewController.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/24.
//

import UIKit

class IndexViewController: UIViewController {
    var news = ["美食","景点","js","ios","java","swift","js","ios","java"]
    @IBOutlet weak var buttonCollection: UICollectionView!
    @IBOutlet weak var newsCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newsCollection.delegate = self
        newsCollection.dataSource = self
        buttonCollection.delegate = self
        buttonCollection.dataSource = self
        loadPosts()
    }
    
    var posts : [Post] = []
    private func loadPosts(){
        let globalData = GlobalData.getInstance()
        if globalData.getFirstLogin() {
            self.posts = globalData.getAllPosts()
        }
        else {
            //self.posts = NSKeyedUnarchiver.unarchivedObject(withFile : Post.ArchiveURL.path) as? [Post]
        }
        
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

//extension IndexViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = newsTable.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as! NewsTableViewCell
//        print(self.news[indexPath.row])
//        cell.textLabel?.text = self.news[indexPath.row]
//        return cell
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(self.news.count)
//        return self.news.count
//    }
//
//}

extension IndexViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = buttonCollection.dequeueReusableCell(withReuseIdentifier: "ButtonCollectionViewCell", for: indexPath) as! ButtonCollectionViewCell
        cell.buttonClickedDelegate = self
        cell.label.text = posts[indexPath.row].title
        
        return cell
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
