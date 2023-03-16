//
//  Barbershop.swift
//  
//
//  Created by Samy Mehdid on 13/3/2023.
//

import Fluent
import Vapor

final class Barbershop: Model, Content {
    static let schema = "barbershops"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "image_url")
    var imageUrl: String?
    
    @Field(key: "town")
    var town: String
    
    @Field(key: "rating")
    var rating: Double
    
    @Field(key: "vip")
    var vip: Bool
    
//    @Field(key: "working_hours")
//    var workingHours: WorkingHours
//
//    @Field(key: "pricing")
//    var pricing: Pricing
//
//    @Field(key: "coordinate")
//    var coordinate: Coordinate
    
    @Children(for: \.$barbershop)
    var barbers: [Barber]
    
    init() {}
    
    init(id: UUID? = nil, name: String, imageUrl: String? = nil, town: String, rating: Double, vip: Bool, workingHours: WorkingHours, pricing: Pricing, coordinate: Coordinate, barbers: [Barber]){
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.town = town
        self.rating = rating
        self.vip = vip
//        self.workingHours = workingHours
//        self.pricing = pricing
//        self.coordinate = coordinate
    }
}

