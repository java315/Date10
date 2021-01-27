//
//  MeViewController.swift
//  Date10
//
//  Created by zb-nju on 2021/1/26.
//

import UIKit

class MeViewController: UIViewController {
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var npyLabel: UILabel!
    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        user = GlobalData.getInstance().getCurrentUser()
        userAvatar.image = UIImage(named: "user")
        userName.text = user?.name
        npyLabel.text = user?.npy
        // Do any additional setup after loading the view.
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
