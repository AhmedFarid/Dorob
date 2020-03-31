//
//  searchGuidVC.swift
//  Dorob
//
//  Created by Ahmed farid on 3/10/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit

class searchGuidVC: UIViewController {
    
    var hide:Bool = true
    
    @IBOutlet weak var lange: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var viewHight: NSLayoutConstraint!
    @IBOutlet weak var dataView: coustomRoundedButton!
    
    var singelItemCity: citiesData?
    var singelItemStates: citiesData?
    var singelItemLang: citiesData?
    var singelItem: citiesData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll.delegate = self
        city.delegate = self
        country.delegate = self
        lange.delegate = self
        imageText()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewHight.constant = self.view.frame.size.height + 20
    }
    
    
    func imageText() {
        if let myImage = UIImage(named: "noun_Location_2017554"){
            city.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        
        if let myImage = UIImage(named: "noun_Location_2017554"){
            country.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        
        if let myImage = UIImage(named: "002---Global-Language"){
            lange.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }
    
    
    
    @IBAction func searchBTN(_ sender: Any) {
        let vc = searchResultsVC(nibName: "searchResultsVC", bundle: nil)
        vc.singelItemCity = singelItemCity
        vc.singelItemLang = singelItemLang
        vc.singelItemStates = singelItemStates
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
}

extension searchGuidVC: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        if(velocity.y>0) {
            //Code will work without the animation block.I am using animation block incase if you want to set any delay to it.
            UIView.animate(withDuration: 1.0, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(true, animated: true)
                self.hide = false
            }, completion: nil)
            
        } else {
            UIView.animate(withDuration: 1.0, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(false, animated: true)
                self.hide = true
            }, completion: nil)
        }
    }
}

extension searchGuidVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.view.endEditing(true)
        if textField == country {
            let vc = serachFormVC(nibName: "serachFormVC", bundle: nil)
            vc.delegate = self
            vc.url = URLs.cities
            self.present(vc,animated: true)
        }else if textField == city{
            if country.text == "" {
                print("select country frist")
            }else {
            let vc = serachFormVC(nibName: "serachFormVC", bundle: nil)
            vc.delegate = self
            vc.url = URLs.states
            vc.cityId = singelItem?.id ?? 0
            self.present(vc,animated: true)
            }
        }else if textField == lange {
            let vc = serachFormVC(nibName: "serachFormVC", bundle: nil)
            vc.delegate = self
            vc.url = URLs.languages
            self.present(vc,animated: true)
        }
        
    }
}

extension searchGuidVC: searchDeleget{
    func selectedAdrees(city: citiesData,Url: String) {
        singelItem = city
        if Url == URLs.cities {
            singelItemCity = city
            self.country.text = singelItem?.name ?? ""
            self.city.text = ""
        }else if Url == URLs.states {
            singelItemStates = city
            self.city.text = singelItem?.name ?? ""
        }else if Url == URLs.languages {
            singelItemLang = city
            self.lange.text = singelItem?.name ?? ""
        }
    }
}

