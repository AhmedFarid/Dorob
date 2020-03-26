//
//  splchVC.swift
//  Dorob
//
//  Created by Ahmed farid on 3/10/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit

class splchVC: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    let images = [
        UIImage(named: "2-Splash"),
        UIImage(named: "3-Splash"),
        UIImage(named: "4-Splash")
    ]
    
    let descs = [
        "Plan your travel anytime, anywhere.",
        "Get your hotel anytime, anywhere.",
        "Get your car anytime, anywhere."
    ]
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavColore(isTranslucent: true, hiden: false, backColor: #colorLiteral(red: 0.8078431373, green: 0.5921568627, blue: 0.1490196078, alpha: 1))
        
        self.collection.register(UINib.init(nibName: "splachCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        collection.delegate = self
        collection.dataSource = self
        pageControl.numberOfPages = images.count
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    
}


extension splchVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! splachCell
        cell.image = images[indexPath.item]
        cell.label = descs[indexPath.item]
        cell.loginACtion.isHidden = true
        cell.createAcount.isHidden = true
        
        if indexPath.section == 0 {
            if indexPath.row == 2 {
                cell.loginACtion.isHidden = false
                cell.createAcount.isHidden = false
                print("xx")
            }else {
                cell.loginACtion.isHidden = true
                cell.createAcount.isHidden = true
            }
        }
        cell.login = {
            let vc = loginVC(nibName: "loginVC", bundle: nil)
            self.navigationController!.pushViewController(vc, animated: true)
        }
        cell.register = {
            let vc = signUpVC(nibName: "signUpVC", bundle: nil)
            self.navigationController!.pushViewController(vc, animated: true)
            
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        currentIndex = Int(scrollView.contentOffset.x / collection.frame.size.width)
        pageControl.currentPage = currentIndex
        
    }
    
}
