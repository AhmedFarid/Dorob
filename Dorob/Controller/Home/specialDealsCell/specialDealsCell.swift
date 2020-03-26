//
//  specialDealsCell.swift
//  Dorob
//
//  Created by Ahmed farid on 3/11/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit

class specialDealsCell: UICollectionViewCell {

    @IBOutlet weak var roundedIMage: UIImageView!
    @IBOutlet weak var roundedView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        roundedView.layer.cornerRadius = 8
        roundedIMage.layer.cornerRadius = 8
    }

}
