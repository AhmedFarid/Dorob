//
//  searchPackagesVC.swift
//  Dorob
//
//  Created by Ahmed farid on 3/11/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit

class searchPackagesVC: UIViewController {
    
    
    var hide:Bool = true
    
    @IBOutlet weak var priceRage: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var cateGoury: UITextField!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var viewHight: NSLayoutConstraint!
    @IBOutlet weak var dataView: coustomRoundedButton!
    
    var singelItem: citiesData?
    var priceRange = ["Below 500$","500$ - 1000$","1000$ - 1500$","Above 1500$"]
    var priceID = 0
    var singelItemCity: citiesData?
    var singelItemCategory: citiesData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll.delegate = self
        city.delegate = self
        cateGoury.delegate = self
        createPriceRangePiker()
        imageText()
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewHight.constant = self.view.frame.size.height + 20
    }
   
    func createPriceRangePiker(){
        let PriceRange = UIPickerView()
        PriceRange.delegate = self
        PriceRange.dataSource = self
        PriceRange.tag = 0
        priceRage.inputView = PriceRange
        PriceRange.reloadAllComponents()
    }
   
    func imageText() {
        if let myImage = UIImage(named: "noun_Location_2017554"){
            city.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        
        if let myImage = UIImage(named: "indian-tent"){
            cateGoury.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        
        if let myImage = UIImage(named: "price"){
            priceRage.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }
    
    
    @IBAction func seaarchBTN(_ sender: Any) {
        let vc = searchPackagesResultVC(nibName: "searchPackagesResultVC", bundle: nil)
        vc.singelItemCity = singelItemCity
        vc.singelItemCategory = singelItemCategory
        vc.priceID = priceID
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
}
 
extension searchPackagesVC: UIScrollViewDelegate {
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


extension searchPackagesVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.view.endEditing(true)
        if textField == city {
            let vc = serachFormVC(nibName: "serachFormVC", bundle: nil)
            vc.delegate = self
            vc.url = URLs.cities
            self.present(vc,animated: true)
        }else {
            let vc = serachFormVC(nibName: "serachFormVC", bundle: nil)
            vc.delegate = self
            vc.url = URLs.categories
            self.present(vc,animated: true)
        }
        
    }
}

extension searchPackagesVC: searchDeleget{
    func selectedAdrees(city: citiesData,Url: String) {
        singelItem = city
        if Url == URLs.cities {
            self.city.text = singelItem?.name ?? ""
            singelItemCity = singelItem
        }else if Url == URLs.categories {
            self.cateGoury.text = singelItem?.name ?? ""
            singelItemCategory = singelItem
        }
    }
}

extension searchPackagesVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return priceRange.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return priceRange[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        priceRage.text = priceRange[row]
        if priceRange[row] == "Below 500$"{
            priceID = 1
            print(priceID)
        }else if priceRange[row] == "500$ - 1000$" {
            priceID = 2
            print(priceID)
        }else if priceRange[row] == "1000$ - 1500$"{
            priceID = 3
            print(priceID)
        }else if priceRange[row] == "Above 1500$" {
            priceID = 4
            print(priceID)
        }
    }
}
