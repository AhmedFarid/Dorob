//
//  itinerariesCell.swift
//  Dorob
//
//  Created by Ahmed farid on 4/1/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit

class itinerarieCell: UITableViewCell {
    
    //    @IBOutlet weak var name: UILabel!
    //    @IBOutlet weak var dece: UILabel!
    //    @IBOutlet weak var meal: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var dece: UILabel!
    @IBOutlet weak var meal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configuerCell(package: Itinerary) {
        name.text = package.title
        dece.text = package.itineraryDescription
        meal.text = "meals \(package.meals ?? "")"
    }
    
    
}
