//
//  splachCell.swift
//  Dorob
//
//  Created by Ahmed farid on 3/10/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit

class splachCell: UICollectionViewCell {

     @IBOutlet weak var imageView: UIImageView!
       @IBOutlet weak var Desc: UILabel!
       @IBOutlet weak var loginACtion: coustomRoundedButton!
       @IBOutlet weak var createAcount: coustomRoundedButton!
       
       
       var login: (()->())?
       var register: (()->())?
       var image: UIImage! {
           didSet {
               imageView.image = image
           }
       }
       
       var label: String! {
           didSet {
               Desc.text = label
           }
       }
       
       @IBAction func loginAction(_ sender: Any) {
           login?()
       }
       
       @IBAction func createAcoubtAction(_ sender: Any) {
           register?()
       }
}
