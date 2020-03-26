//
//  loginVC.swift
//  Dorob
//
//  Created by Ahmed farid on 3/10/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit

class loginVC: UIViewController {

    @IBOutlet weak var viewHight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewHight.constant = self.view.frame.size.height + 50
    }


   
}
