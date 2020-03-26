//
//  citiesAPI.swift
//  Dorob
//
//  Created by Ahmed farid on 3/26/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import Foundation
import Alamofire

class citiesAPI: NSObject {
    
    class func allCities(url: String,completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSucess: Bool ,_ city: cities?)-> Void){
        
        let headers: HTTPHeaders = [
            "X-localization": "en"
        ]
        
        //let url = URLs.cities
        AF.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON{ (response) in
            switch response.result
            {
            case .failure(let error):
                completion(error, false,false,nil)
                print(error)
            case .success:
                do{
                    print(response)
                    let city = try JSONDecoder().decode(cities.self, from: response.data!)
                    if city.success == false {
                        completion(nil,true,true,city)
                    }else {
                        completion(nil,true,true,city)
                    }
                }catch{
                    print("error")
                    completion(nil,true,false,nil)
                }
            }
        }
    }
    
    
    class func allStates(city_id: String,completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSucess: Bool ,_ city: cities?)-> Void){
        
        let headers: HTTPHeaders = [
            "X-localization": "en"
        ]
        
        let parameters = [
            "city_id": city_id
        ]
        
        let url = URLs.states
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON{ (response) in
            switch response.result
            {
            case .failure(let error):
                completion(error, false,false,nil)
                print(error)
            case .success:
                do{
                    print(response)
                    let city = try JSONDecoder().decode(cities.self, from: response.data!)
                    if city.success == false {
                        completion(nil,true,true,city)
                    }else {
                        completion(nil,true,true,city)
                    }
                }catch{
                    print("error")
                    completion(nil,true,false,nil)
                }
            }
        }
    }
}
