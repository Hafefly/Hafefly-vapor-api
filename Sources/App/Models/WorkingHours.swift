//
//  WorkingHours.swift
//  
//
//  Created by Samy Mehdid on 13/3/2023.
//

import Fluent
import Vapor

final class WorkingHours: Model, Content {
    static let schema = "working_hours"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "opening")
    var opening: Date
    
    @Field(key: "closing")
    var closing: Date
    
    init() {}
    
    init(id: UUID? = nil, opening: Date, closing: Date) {
        self.opening = opening
        self.closing = closing
    }
}
