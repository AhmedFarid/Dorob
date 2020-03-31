//
//  searchResultsCell.swift
//  Dorob
//
//  Created by Ahmed farid on 3/30/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit
import Kingfisher

class searchResultsCell: UITableViewCell {

    @IBOutlet weak var guidImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    
    override var frame: CGRect {
      get {
          return super.frame
      }
      set (newFrame) {
          var frame =  newFrame
          frame.origin.y += 4
          frame.size.height -= 2 * 5
          super.frame = frame
      }
    }
    
    
    func configuerCell(guide: GuidesData) {
        name.text = guide.name
        phone.text = guide.phone
        let urlWithoutEncoding = (guide.image)
        let encodedLink = urlWithoutEncoding?.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        guidImage.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            guidImage.kf.setImage(with: url,placeholder: UIImage(named: "placeholder"))
        }
    }
    
    
    
}
