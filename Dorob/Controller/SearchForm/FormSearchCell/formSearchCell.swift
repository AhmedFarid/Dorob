//
//  formSearchCell.swift
//  Dorob
//
//  Created by Ahmed farid on 3/26/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit

class formSearchCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var imageNamed: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

      func configureCell(city: citiesData){
            cityName.text = city.name
    }
    
}
