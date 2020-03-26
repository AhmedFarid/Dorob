//
//  serachFormVC.swift
//  Dorob
//
//  Created by Ahmed farid on 3/26/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

protocol searchDeleget {
    
    func selectedAdrees(city: citiesData,Url: String)
}


class serachFormVC: UIViewController, NVActivityIndicatorViewable {
    
    var cityId = 0
    var city = [citiesData]()
    var delegate: searchDeleget?
    var url = ""
    
    @IBOutlet weak var serchTabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serchTabelView.dataSource = self
        serchTabelView.delegate = self
        serchTabelView.register(UINib(nibName: "formSearchCell", bundle: nil), forCellReuseIdentifier: "cell")
        serchTabelView.tableFooterView = UIView(frame: .zero)
        
        if url == URLs.states {
            statesHandelRefresh()
        }else {
        prodeuctsHandelRefresh(url: url)
        }
    }
    
   
    func prodeuctsHandelRefresh(url: String){
        citiesAPI.allCities(url: url){ (error,networkSuccess,codeSucess,city) in
            if networkSuccess {
                if codeSucess {
                    if city?.success == true {
                        if let city = city{
                            self.city = city.data ?? []
                            print("zzzz\(city)")
                            self.serchTabelView.reloadData()
                            self.stopAnimating()
                        }else {
                            //self.showAlert(title: "Error", message: "Error favorite")
                        }
                    }else {
                        //self.showAlert(title: "Favorite", message: "Error favorite")
                    }
                }else {
                    //self.showAlert(title: "Favorite", message: "Favorite is empty")
                }
            }else {
                //self.showAlert(title: "Network", message: "Check your network connection")
            }
        }
    }
    
    func statesHandelRefresh(){
        citiesAPI.allStates(city_id: "\(cityId)"){ (error,networkSuccess,codeSucess,city) in
            if networkSuccess {
                if codeSucess {
                    if city?.success == true {
                        if let city = city{
                            self.city = city.data ?? []
                            print("zzzz\(city)")
                            self.serchTabelView.reloadData()
                            self.stopAnimating()
                        }else {
                            //self.showAlert(title: "Error", message: "Error favorite")
                        }
                    }else {
                        //self.showAlert(title: "Favorite", message: "Error favorite")
                    }
                }else {
                    //self.showAlert(title: "Favorite", message: "Favorite is empty")
                }
            }else {
                //self.showAlert(title: "Network", message: "Check your network connection")
            }
        }
    }
}

extension serachFormVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = serchTabelView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? formSearchCell {
            if url == URLs.cities{
                cell.imageNamed.image = UIImage(named: "noun_Location_2017554")
            }else if url == URLs.states {
                cell.imageNamed.image = UIImage(named: "noun_Location_2017554")
            }else if url == URLs.categories {
                cell.imageNamed.image = UIImage(named: "indian-tent")
            }else {
                cell.imageNamed.image = UIImage(named: "002---Global-Language")
            }
            cell.configureCell(city: city[indexPath.row])
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }else {
            return formSearchCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedAdrees(city: city[indexPath.row], Url: url)
        dismiss(animated: true)
    }
}
