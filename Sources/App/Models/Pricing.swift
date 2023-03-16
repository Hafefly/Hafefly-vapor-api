//
//  Pricing.swift
//  
//
//  Created by Samy Mehdid on 13/3/2023.
//

import Vapor

struct Pricing: Content {
    var fade: Int
    var beard: Int
    var hairdryer: Int
    var razor: Int
    var scissors: Int
    var straightener: Int
    var atHome: Int?
}
