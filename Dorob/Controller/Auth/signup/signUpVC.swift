//
//  signUpVC.swift
//  Dorob
//
//  Created by Ahmed farid on 3/10/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit

class signUpVC: UIViewController {

    @IBOutlet weak var viewHight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewHight.constant = self.view.frame.size.height + 50
    }
    
    @IBAction func signUpBTN(_ sender: Any) {
        let vc = homeVC(nibName: "homeVC", bundle: nil)
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
}
