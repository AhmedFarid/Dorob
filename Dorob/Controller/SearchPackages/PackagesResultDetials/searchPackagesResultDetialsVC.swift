//
//  searchPackagesResultDetialsVC.swift
//  Dorob
//
//  Created by Ahmed farid on 4/1/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//


import UIKit

class searchPackagesResultDetialsVC: UIViewController {

    
    @IBOutlet weak var notIncDescr: UILabel!
    @IBOutlet weak var incluDesc: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var titles: UILabel!
    @IBOutlet weak var imagePackage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var viewHight: NSLayoutConstraint!
    @IBOutlet weak var viewContent: coustomRoundedButton!
    @IBOutlet weak var prices: UILabel!
    @IBOutlet weak var itinerariesTabelView: UITableView!
    
    var singitem: packagesData?
    var images = [PackgeImage]()
    var itinera = [Itinerary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "packagesResultDetialsCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        itinerariesTabelView.delegate = self
        itinerariesTabelView.dataSource = self
        itinerariesTabelView.register(UINib(nibName: "itinereCell", bundle: nil), forCellReuseIdentifier: "cell")
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         
    }

    
    func setUpView() {
        titles.text = singitem?.title
        desc.text = singitem?.datumDescription?.html2String
        notIncDescr.text = singitem?.notInclussions?.html2String
        incluDesc.text = singitem?.inclussions?.html2String
        prices.text = singitem?.prices?.html2String
        
        
        let urlWithoutEncoding = (singitem?.image)
        let encodedLink = urlWithoutEncoding?.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        imagePackage.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            imagePackage.kf.setImage(with: url,placeholder: UIImage(named: "placeholder"))
        }
        
        self.viewHight.constant = self.viewContent.frame.size.height + 600
        
    }
   

}

extension searchPackagesResultDetialsVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? packagesResultDetialsCell{
            cell.configuerCell(package: images[indexPath.row])
            return cell
        }else {
            return packagesResultDetialsCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: collectionView.frame.size.width / 3, height: collectionView.frame.size.width / 3)
    }
}

extension searchPackagesResultDetialsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itinera.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = itinerariesTabelView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? itinereCell {
            cell.configuerCell(package: itinera[indexPath.row])
            return cell
        }else {
            return itinereCell()
        }
    }
    
}
