//
//  SpotViewController.swift
//  Date10
//
//  Created by zb-nju on 2021/1/27.
//

import UIKit

class SpotViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var spotCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSpots()
        spotCollection.delegate = self
        spotCollection.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    var spots = [Spot]()
    public func loadSpots(){
        
        let globalData = GlobalData.getInstance()
        if globalData.getFirstLogin() {
            self.spots = globalData.getSpots()
        }
        else {
            self.spots = globalData.getSpots()
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
            guard let spotDetailViewController = segue.destination as? SpotDetailViewController else{
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedCell = sender as? SpotCollectionViewCell else{
                fatalError("Unexpected sender:\(String(describing: sender))")
            }
            
            guard let indexPath = spotCollection.indexPath(for: selectedCell) else{
                fatalError("The selected cell is not being displayed by the collection")
            }
            
            let selectedSpot = spots[indexPath.row]
            spotDetailViewController.spot = selectedSpot
    }
}

extension SpotViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = spotCollection.dequeueReusableCell(withReuseIdentifier: "SpotCollectionCell", for: indexPath) as! SpotCollectionViewCell
        let spot = spots[indexPath.row]
        cell.frontImg.image = spot.frontImg
        cell.nameLabel.text = spot.name
        cell.hotValueLabel.text = String(spot.getHotValue())
        cell.scoreLabel.text = String(spot.getScore())
        cell.address.text = spot.address
        cell.shortComment.text = spot.shortComment
        
        return cell
    }
    
    
}
