//
//  packagesAPI.swift
//  Dorob
//
//  Created by Ahmed farid on 3/31/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import Foundation
import Alamofire

class packagesAPI: NSObject {
    
    class func allPackages(price_tour_only: Int,category_id: Int,city_id: Int,completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSucess: Bool ,_ package: packages?)-> Void){
        
        let headers: HTTPHeaders = [
            "X-localization": "en"
        ]
        
        let parameters = [
            "price_tour_only": price_tour_only,
            "category_id": category_id,
            "city_id": city_id
        ]
        
        let url = URLs.searchPackges
        print(url)
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON{ (response) in
            switch response.result
            {
            case .failure(let error):
                completion(error, false,false,nil)
                print(error)
            case .success:
                do{
                    print(response)
                    let package = try JSONDecoder().decode(packages.self, from: response.data!)
                    if package.success == false {
                        completion(nil,true,true,package)
                    }else {
                        completion(nil,true,true,package)
                    }
                }catch{
                    print("error")
                    completion(nil,true,false,nil)
                }
            }
        }
    }
}
