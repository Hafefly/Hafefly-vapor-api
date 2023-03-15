//
//  Pricing.swift
//  
//
//  Created by Samy Mehdid on 13/3/2023.
//

import Vapor

struct Pricing: Content {
    var fade: UInt
    var beard: UInt
    var hairdryer: UInt
    var razor: UInt
    var scissors: UInt
    var straightener: UInt
    var atHome: UInt?
}
