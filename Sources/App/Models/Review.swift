//
//  Review.swift
//  
//
//  Created by Samy Mehdid on 15/3/2023.
//

import Fluent
import Vapor

final class Review: Model, Content {
    static let schema = "reviews"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "barber_id")
    var barber: Barber
    
    @Parent(key: "user_id")
    var user: User
    
    @Field(key: "message")
    var message: String?
    
    @Field(key: "rating")
    var rating: Double
    
    init() { }
    
    init(id: UUID? = nil, barberID: UUID, userID: UUID, rating: Double, message: String? = nil) {
        self.id = id
        self.$barber.id = barberID
        self.$user.id = userID
        self.rating = rating
        self.message = message
    }
}
