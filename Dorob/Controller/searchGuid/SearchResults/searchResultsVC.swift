//
//  searchResultsVC.swift
//  Dorob
//
//  Created by Ahmed farid on 3/30/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class searchResultsVC: UIViewController, NVActivityIndicatorViewable{
    
    @IBOutlet weak var tabelView: UITableView!
    
    var singelItemCity: citiesData?
    var singelItemStates: citiesData?
    var singelItemLang: citiesData?
    
    var guid = [GuidesData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.delegate = self
        tabelView.dataSource = self
        tabelView.register(UINib(nibName: "searchResultsCell", bundle: nil), forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
        
        guideHandelRefresh()
    }
    
    
    func guideHandelRefresh(){
        startAnimating(CGSize(width: 45, height: 45), message: "Loading",type: .ballSpinFadeLoader, color: .red, textColor: .white)
        searchGuideApi.allGuide(city_id: singelItemCity?.id ?? 0, state_id: singelItemStates?.id ?? 0, language_id: singelItemLang?.id ?? 0){ (error,networkSuccess,codeSucess,guid) in
            if networkSuccess {
                if codeSucess {
                    if guid?.success == true {
                        if let guid = guid{
                            self.guid = guid.data ?? []
                            print("zzzz\(guid)")
                            self.tabelView.reloadData()
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

extension searchResultsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guid.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? searchResultsCell {
            cell.configuerCell(guide: guid[indexPath.row])
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.city.text = singelItemCity?.name
            return cell
        }else {
            return searchResultsCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = searchGuidDitelesVC(nibName: "searchGuidDitelesVC", bundle: nil)
        vc.singelItemCity = singelItemCity
        vc.singelItemLang = singelItemLang
        vc.singelItemStates = singelItemStates
        vc.singlItem = guid[indexPath.row]
        self.navigationController!.pushViewController(vc, animated: true)
    }
}
