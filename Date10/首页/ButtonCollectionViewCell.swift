//
//  ButtonCollectionViewCell.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/24.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func clickToNavigate(_ sender: UIButton) {
        print("click \(String(describing: label.text))")
    }
}
