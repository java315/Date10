//
//  GXBannerTestCell.swift
//  GXBannerSample
//
//  Created by Gin on 2020/7/24.
//  Copyright © 2020 gin. All rights reserved.
//

import UIKit

class GXBannerCell: UICollectionViewCell {
    
    lazy var iconIView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .none
        return iv
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.iconIView.frame = self.bounds
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.iconIView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
