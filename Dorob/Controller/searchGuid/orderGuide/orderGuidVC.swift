//
//  orderGuidVC.swift
//  Dorob
//
//  Created by Ahmed farid on 3/31/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class orderGuidVC: UIViewController, NVActivityIndicatorViewable  {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var decratibonTV: UITextView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    
    var singlItem: GuidesData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decratibonTV.layer.cornerRadius = 8
        decratibonTV.layer.borderWidth = 1
        decratibonTV.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        decratibonTV.delegate = self
        decratibonTV.text = "Message"
        decratibonTV.textColor = UIColor.lightGray
        
    }
    
    
    @IBAction func continueBTN(_ sender: Any) {
        startAnimating(CGSize(width: 45, height: 45), message: "Loading",type: .ballSpinFadeLoader, color: .yellow, textColor: .white)
        searchGuideApi.orderGuid(guide_id: singlItem?.id ?? 0, email: email.text ?? "", name: name.text ?? "", phone: phone.text ?? "", message: decratibonTV.text ?? ""){ (error, success, message) in
            if success {
                if message?.success == true {
                    print("xxx")
                    self.stopAnimating()
                }
            }else {
                //self.showAlert(title: "Favorite", message: addTofav?.data ?? "")
                self.stopAnimating()
            }
        }
        
    }
    
}

extension orderGuidVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Message"
            textView.textColor = UIColor.lightGray
        }
    }
}
