//
//  NewsTableViewController.swift
//  Date10
//
//  Created by zb-nju on 2021/1/24.
//

import UIKit
import os.log

class NewsTableViewController: UITableViewController {
    //MARK: Properties
    var news = [News]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else{
            fatalError("The dequed cell is not an instance of NewsTableViewCell")
        }

        let newsSelected = news[indexPath.row]
        
        if newsSelected.photo == nil{
            cell.CellImageView.isHidden = true
        }
        else{
            cell.CellImageView.image = newsSelected.photo
        }
        
//        cell.CellTextView.text = newsSelected.text
        cell.LikeNumber.text = String(newsSelected.likes)
        
        if newsSelected.userLike{
            cell.LikeButton.imageView!.image = UIImage(named: "like")
        }
        else{
            cell.LikeButton.imageView!.image = UIImage(named: "unlike")
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//        super.prepare(for: segue, sender: sender)
//        switch (segue.identifier ?? "") {
//        case "showDetail":
//            guard let newsDetailViewController = segue.destination as? NewsDetailViewController else {
//                fatalError("Unexpected destination: \(segue.destination)")
//            }
//
//            guard let selectedCell = sender as? NewsTableViewCell else{
//                fatalError("Unexpected sender:\(String(describing: sender))")
//            }
//
//            guard let indexPath = tableView.indexPath(for: selectedCell) else {
//                fatalError("The selected cell is not being displayed by the table")
//            }
//            let selectedNews = news[indexPath.row]
//            newsDetailViewController.news = selectedNews
//
//        case "addNews":
//            os_log("Adding new news", log: OSLog.default, type: .debug)
//        default:
//            fatalError("Unexpected Segue identifier: \(String(describing: segue.identifier))")
//        }
//    }
    
    //MARK: Actions
//    @IBAction func unwindToNewsList(sender: UIStoryboardSegue){
//        if let sourceViewController = sender.source as? AddNewsViewController, let addedNews = sourceViewController.addedNews{
//            let newIndexPath = IndexPath(row: news.count, section: 0)
//            news.append(addedNews)
//            tableView.insertRows(at: [newIndexPath], with: .automatic)
//        }
//        else if let sourceViewController = sender.source as? NewsDetailViewController, let selectedNews = sourceViewController.news, let selectedIndexPath = tableView.indexPathForSelectedRow{
//            news[selectedIndexPath.row] = selectedNews
//            tableView.reloadRows(at: [selectedIndexPath], with: .none)
//        }
//    }

}
