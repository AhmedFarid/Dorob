//
//  searchPackagesResultCell.swift
//  Dorob
//
//  Created by Ahmed farid on 3/31/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit

class searchPackagesResultCell: UICollectionViewCell {
    
    @IBOutlet weak var packgeImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var city: UILabel!
    
    
    func configuerCell(package: packagesData) {
        name.text = package.title
        let urlWithoutEncoding = (package.image)
        let encodedLink = urlWithoutEncoding?.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        packgeImage.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            packgeImage.kf.setImage(with: url,placeholder: UIImage(named: "placeholder"))
        }
    }
    
    
    
}
