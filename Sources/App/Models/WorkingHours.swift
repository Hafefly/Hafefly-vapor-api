//
//  WorkingHours.swift
//  
//
//  Created by Samy Mehdid on 13/3/2023.
//

import Vapor

struct WorkingHours: Content {
    var opening: Date
    var closing: Date
}
