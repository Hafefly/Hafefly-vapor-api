//
//  WorkingHours.swift
//  
//
//  Created by Samy Mehdid on 13/3/2023.
//

import Fluent
import Vapor

struct WorkingHours: Content {
    let opening: Date
    let closing: Date
}
