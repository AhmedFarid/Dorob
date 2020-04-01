//
//  homeVC.swift
//  Dorob
//
//  Created by Ahmed farid on 3/10/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit

class homeVC: UIViewController {
    
    @IBOutlet weak var topContrens: NSLayoutConstraint!
    @IBOutlet weak var scrollViewTopConstrins: NSLayoutConstraint!
    @IBOutlet weak var specialHotelsCollection: UICollectionView!
    @IBOutlet weak var specialDealsCollection: UICollectionView!
    @IBOutlet weak var specialPackageCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        specialDealsCollection.delegate = self
        specialDealsCollection.dataSource = self
         self.specialDealsCollection.register(UINib.init(nibName: "specialDealsCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        specialHotelsCollection.delegate = self
        specialHotelsCollection.dataSource = self
         self.specialHotelsCollection.register(UINib.init(nibName: "specialDealsCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        specialPackageCollection.delegate = self
        specialPackageCollection.dataSource = self
         self.specialPackageCollection.register(UINib.init(nibName: "specialDealsCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavColore(isTranslucent: true, hiden: false, backColor: .white)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        setUpNavColore(isTranslucent: true, hiden: false, backColor: .white)
    }
    
    @IBAction func flights(_ sender: Any) {
        
    }
    
    @IBAction func searchGuidBTN(_ sender: Any) {
        let vc = searchGuidVC(nibName: "searchGuidVC", bundle: nil)
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    @IBAction func searchHotelsBTN(_ sender: Any) {
    }
    
    @IBAction func searchPackageBTN(_ sender: Any) {
        let vc = searchPackagesVC(nibName: "searchPackagesVC", bundle: nil)
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    
}

extension homeVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == specialDealsCollection {
            return 1
        }else if collectionView == specialHotelsCollection {
            return 1
        }else if collectionView == specialPackageCollection {
            return 1
        }else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == specialDealsCollection {
            return 10
        }else if collectionView == specialHotelsCollection {
            return 10
        }else if collectionView == specialPackageCollection {
            return 10
        }else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == specialDealsCollection {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? specialDealsCell {
                return cell
            }else {
                return specialDealsCell()
            }
        }else if collectionView == specialHotelsCollection {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? specialDealsCell {
                return cell
            }else {
                return specialDealsCell()
            }
        }else if collectionView == specialPackageCollection {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? specialDealsCell {
                return cell
            }else {
                return specialDealsCell()
            }
        }else {
            return specialDealsCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: specialDealsCollection.frame.size.width / 1.08, height: specialDealsCollection.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("xxxxx")
    }
}
