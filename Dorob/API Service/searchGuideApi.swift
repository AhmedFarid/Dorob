//
//  searchGuideApi.swift
//  Dorob
//
//  Created by Ahmed farid on 3/30/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import Foundation
import Alamofire

class searchGuideApi: NSObject {
    
    class func allGuide(city_id: Int,state_id: Int,language_id: Int,completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSucess: Bool ,_ guide: Guides?)-> Void){
        
        let headers: HTTPHeaders = [
            "X-localization": "en"
        ]
        
        let parameters = [
            "city_id": city_id,
            "state_id": state_id,
            "language_id": language_id
        ]
        
        let url = URLs.searchGuide
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
                    let guide = try JSONDecoder().decode(Guides.self, from: response.data!)
                    if guide.success == false {
                        completion(nil,true,true,guide)
                    }else {
                        completion(nil,true,true,guide)
                    }
                }catch{
                    print("error")
                    completion(nil,true,false,nil)
                }
            }
        }
    }
    
    class func orderGuid(guide_id: Int,email: String,name: String,phone: String,message: String,completion: @escaping(_ error: Error?,_ success: Bool,_ msge: Message?)-> Void){
           
//           guard let user_token = helperLogin.getAPIToken() else {
//               completion(nil, false,nil)
//               return
//           }
           
           let parametars = [
               "guide_id": guide_id,
               "email": email,
               "name": name,
               "phone": phone,
               "message": message
            ] as [String : Any]
           
           let headers: HTTPHeaders = [
               "X-localization": "en"
           ]
           
           let url = URLs.orderGuide
           print(url)
           print(parametars)
           
           AF.request(url, method: .post, parameters: parametars, encoding: URLEncoding.queryString, headers: headers).responseJSON{ (response) in
               switch response.result
               {
               case .failure(let error):
                   completion(error, false,nil)
                   print(error)
               case .success:
                   do{
                       print(response)
                       let msge = try JSONDecoder().decode(Message.self, from: response.data!)
                       if msge.success == false {
                           completion(nil,true,msge)
                       }else {
                           completion(nil,true,msge)
                       }
                   }catch{
                       print("error")
                   }
               }
           }
       }
}
