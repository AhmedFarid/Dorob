//
//  message.swift
//  Dorob
//
//  Created by Ahmed farid on 3/31/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//

import Foundation


struct Message: Codable {
    let success: Bool?
    let data, message: String?
}
