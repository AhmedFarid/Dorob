//
//  packages.swift
//  Dorob
//
//  Created by Ahmed farid on 3/31/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import Foundation


struct packages: Codable {
    let success: Bool?
    let data: [packagesData]?
    let message: String?
}


struct packagesData: Codable {
    let id: Int?
    let title, datumDescription, shortDescription, prices: String?
    let highlight, inclussions, notInclussions, duration: String?
    let rating, offer: String?
    let itineraries: [Itinerary]?
    let packgePrices: [PackgePrice]?
    let image: String?
    let packgeImages: [PackgeImage]?

    enum CodingKeys: String, CodingKey {
        case id, title
        case datumDescription = "description"
        case shortDescription = "short_description"
        case prices, highlight, inclussions
        case notInclussions = "not_inclussions"
        case duration, rating, offer, itineraries
        case packgePrices = "packge_prices"
        case image
        case packgeImages = "packge_images"
    }
}

struct Itinerary: Codable {
    let id: Int?
    let title, itineraryDescription, meals: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case itineraryDescription = "description"
        case meals
    }
}


struct PackgeImage: Codable {
    let id: Int?
    let image: String?
}
 
struct PackgePrice: Codable {
    let id: Int?
    let single, double, triple, category: String?
    let season, status, packgePriceDescription: String?

    enum CodingKeys: String, CodingKey {
        case id, single, double, triple, category, season, status
        case packgePriceDescription = "description"
    }
}
