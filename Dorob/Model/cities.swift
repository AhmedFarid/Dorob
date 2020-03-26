//
//  cities.swift
//  Dorob
//
//  Created by Ahmed farid on 3/26/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import Foundation

struct cities: Codable {
    let success: Bool?
    let data: [citiesData]?
    let message: String?
}

struct citiesData: Codable {
    let id: Int?
    let name: String?
}
