//
//  FoodViewController.swift
//  Date10
//
//  Created by zb-nju on 2021/1/27.
//

import UIKit

class FoodViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var foodCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFoods()
        foodCollection.delegate = self
        foodCollection.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    var foods = [Food]()
    public func loadFoods(){
        let globalData = GlobalData.getInstance()
        if globalData.getFirstLogin() {
            self.foods = globalData.getFoods()
        }
        else {
            self.foods = globalData.getFoods()
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
            guard let foodDetailViewController = segue.destination as? FoodDetailViewController else{
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedCell = sender as? FoodCollectionViewCell else{
                fatalError("Unexpected sender:\(String(describing: sender))")
            }
            
            guard let indexPath = foodCollection.indexPath(for: selectedCell) else{
                fatalError("The selected cell is not being displayed by the collection")
            }
            
            let selectedFood = foods[indexPath.row]
            foodDetailViewController.food = selectedFood
    }
    
}

extension FoodViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = foodCollection.dequeueReusableCell(withReuseIdentifier: "FoodCollectionCell", for: indexPath) as! SpotCollectionViewCell
        let food = foods[indexPath.row]
        cell.frontImg.image = food.frontImg
        cell.nameLabel.text = food.name
        cell.scoreLabel.text = String(food.getScore())
        cell.address.text = food.address
        cell.shortComment.text = food.shortComment
        
        return cell
    }
    
    
}
