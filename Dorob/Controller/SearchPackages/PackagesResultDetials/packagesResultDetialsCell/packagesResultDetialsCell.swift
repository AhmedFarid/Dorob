//
//  packagesResultDetialsCell.swift
//  Dorob
//
//  Created by Ahmed farid on 4/1/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit

class packagesResultDetialsCell: UICollectionViewCell {

    @IBOutlet weak var packageImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configuerCell(package: PackgeImage) {
        let urlWithoutEncoding = (package.image)
           let encodedLink = urlWithoutEncoding?.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
           let encodedURL = NSURL(string: encodedLink!)! as URL
           packageImage.kf.indicatorType = .activity
           if let url = URL(string: "\(encodedURL)") {
               packageImage.kf.setImage(with: url,placeholder: UIImage(named: "placeholder"))
           }
       }

}

//packgeImages
