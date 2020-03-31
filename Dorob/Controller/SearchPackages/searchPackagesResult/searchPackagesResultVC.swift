//
//  searchPackagesResultVC.swift
//  Dorob
//
//  Created by Ahmed farid on 3/31/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class searchPackagesResultVC: UIViewController, NVActivityIndicatorViewable {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var priceID = 0
    var singelItemCity: citiesData?
    var singelItemCategory: citiesData?
    
    var package = [packagesData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "searchPackagesResultCell", bundle: nil), forCellWithReuseIdentifier: "cell")

        
        
        guideHandelRefresh()
    }


  func guideHandelRefresh(){
        startAnimating(CGSize(width: 45, height: 45), message: "Loading",type: .ballSpinFadeLoader, color: .red, textColor: .white)
    packagesAPI.allPackages(price_tour_only: priceID, category_id: singelItemCategory?.id ?? 0, city_id: singelItemCity?.id ?? 0){ (error,networkSuccess,codeSucess,package) in
            if networkSuccess {
                if codeSucess {
                    if package?.success == true {
                        if let package = package{
                            self.package = package.data ?? []
                            print("zzzz\(package)")
                            self.collectionView.reloadData()
                            self.stopAnimating()
                        }else {
                            self.stopAnimating()
                            //self.showAlert(title: "Error", message: "Error favorite")
                        }
                    }else {
                        self.stopAnimating()
                        //self.showAlert(title: "Favorite", message: "Error favorite")
                    }
                }else {
                    self.stopAnimating()
                    //self.showAlert(title: "Favorite", message: "Favorite is empty")
                }
            }else {
                self.stopAnimating()
                //self.showAlert(title: "Network", message: "Check your network connection")
            }
        }
    }

}


extension searchPackagesResultVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return package.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? searchPackagesResultCell {
            cell.configuerCell(package: package[indexPath.row])
            return cell
        }else {
            return searchPackagesResultCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height / 3)
    }
}
