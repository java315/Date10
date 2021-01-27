//
//  MessageViewController.swift
//  Date10
//
//  Created by zb-nju on 2021/1/25.
//

import UIKit

class MessageViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var messageCollection: UICollectionView!
    var communications = [Communication]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCommunications()
        messageCollection.delegate = self
        messageCollection.dataSource = self
        
    }
    
    private func loadCommunications() {
        let globalData = GlobalData.getInstance()
        self.communications += globalData.getAllCommunications()
        print("communication count \(communications.count)")
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

extension MessageViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return communications.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = messageCollection.dequeueReusableCell(withReuseIdentifier: "MessageCollectionViewCell", for: indexPath) as! MessageCollectionViewCell
        let m = communications[indexPath.row].getLeastMessage()
        cell.message.text = m?.content
        cell.time.text = DateUtil.ZoneTime(date: (m?.sendTime)!, dateFormat: DateUtil.FullTimeFormat)
        cell.senderName.text = m?.sender
        cell.senderAvatar.image = UIImage(named: "user")
        print(cell.message.text)
        return cell
    }
    
    
}
