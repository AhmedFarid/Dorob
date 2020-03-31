//
//  searchGuidDitelesVC.swift
//  Dorob
//
//  Created by Ahmed farid on 3/31/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit

class searchGuidDitelesVC: UIViewController {
    
    var singelItemCity: citiesData?
    var singelItemStates: citiesData?
    var singelItemLang: citiesData?
    var singlItem: GuidesData?
    
    @IBOutlet weak var viewHignt: NSLayoutConstraint!
    @IBOutlet weak var guidImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var priceByDay: UILabel!
    @IBOutlet weak var containView: coustomRoundedButton!
    @IBOutlet weak var descrp: UILabel!
    @IBOutlet weak var favPlaces: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewHignt.constant = self.containView.frame.size.height + 100
    }
    
    
    
    
    func SetUpData() {
        name.text = singlItem?.name
        city.text = singelItemCity?.name
        phone.text = singlItem?.phone
        
        let urlWithoutEncoding = (singlItem?.image)
        let encodedLink = urlWithoutEncoding?.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        guidImage.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            guidImage.kf.setImage(with: url,placeholder: UIImage(named: "placeholder"))
        }
    }
}
