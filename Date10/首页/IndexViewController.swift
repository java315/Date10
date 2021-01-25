//
//  IndexViewController.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/24.
//

import UIKit

class IndexViewController: UIViewController {
    var news = ["java","swift","js","ios","java","swift","js","ios","java"]
    @IBOutlet weak var buttonCollection: UICollectionView!
    @IBOutlet weak var newsCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newsCollection.delegate = self
        newsCollection.dataSource = self
        buttonCollection.delegate = self
        buttonCollection.dataSource = self
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
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = buttonCollection.dequeueReusableCell(withReuseIdentifier: "ButtonCollectionViewCell", for: indexPath) as! ButtonCollectionViewCell
        cell.label.text = news[indexPath.row]
        return cell
    }
    
    
}
