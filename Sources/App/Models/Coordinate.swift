//
//  Coordinate.swift
//  
//
//  Created by Samy Mehdid on 13/3/2023.
//

import Fluent
import Vapor

final class Coordinate: Model, Content {
    static let schema = "coordinate"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "latitude")
    var latitude: Double
    
    @Field(key: "longitude")
    var longitude: Double
    
    init() {}
    
    init(id: UUID? = nil, latitude: Double, longitude: Double) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
    }
}
