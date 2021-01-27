//
//  ButtonCollectionViewCell.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/24.
//

import UIKit

public protocol ButtonClickedDelegate: class{
    func buttonClicked(_ clickedButton: String)
}

class ButtonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var label: UILabel!
    public weak var buttonClickedDelegate: ButtonClickedDelegate?
    
    @IBAction func clickToNavigate(_ sender: UIButton) {
        print(label.text!)
        buttonClickedDelegate?.buttonClicked(label.text!)
    }
}
