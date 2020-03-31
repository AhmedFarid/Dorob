//
//  guide.swift
//  Dorob
//
//  Created by Ahmed farid on 3/30/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import Foundation

 
struct Guides: Codable {
    let success: Bool?
    let data: [GuidesData]?
    let message: String?
}

 
struct GuidesData: Codable {
    let id: Int?
    let name, email, phone: String?
    let image: String?
}
