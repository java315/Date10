//
//  NewsDetailViewController.swift
//  Date10
//
//  Created by zb-nju on 2021/1/25.
//

import UIKit

class NewsDetailViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeNumber: UILabel!
    @IBOutlet weak var textView: UITextView!
    var news:News!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = news.photo
        
        likeButton.setImage(UIImage(named: "like"), for: .selected)
        likeButton.setImage(UIImage(named: "unlike"), for: .normal)
        
        textView.text = news.text
        likeNumber.text = String(news.likes)
    }
    
    @IBAction func like(_ sender: Any) {
        news.userLike = !news.userLike
        if news.userLike{
            news.likes += 1
        
        }
        else{
            news.likes -= 1
        }
        likeNumber.text = String(news.likes)
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
