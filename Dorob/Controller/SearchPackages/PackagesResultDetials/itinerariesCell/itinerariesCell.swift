//
//  itinerariesCell.swift
//  Dorob
//
//  Created by Ahmed farid on 4/1/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit

class itinerariesCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var meals: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configuerCell(package: itineraries) {
        title.text = package.title
    }
    
}
