//
//  Barber.swift
//  
//
//  Created by Samy Mehdid on 13/3/2023.
//

import Fluent
import Vapor

final class Barber: Model, Content {
    static let schema = "barbers"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "barbershop_id")
    var barbershopID: UInt
    
    @Field(key: "profile_image_url")
    var profileImageUrl: String?
    
    @Field(key: "province")
    var province: String
    
    @Field(key: "rating")
    var rating: Double
    
    @Field(key: "barbershop_name")
    var barbershopName: String
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "bio")
    var bio: String?
    
    @Field(key: "age")
    var age: UInt
    
    @Field(key: "experience")
    var experience: UInt
    
    @Field(key: "haircuts_done")
    var haircutsDone: UInt
    
    @Field(key: "instagram")
    var instagram: String
    
    @Field(key: "is_available_home")
    var isAvailableHome: Bool
    
    @Field(key: "phone")
    var phone: String
    
    @Field(key: "verified")
    var verified: Bool
    
    @Field(key: "working_hours")
    var workingHours: WorkingHours
    
    @Field(key: "reviews")
    var reviews: [Review]
    
    init() {}
    
    init(id: UUID? = nil, barbershopID: UInt, profileImageUrl: String? = nil, province: String, rating: Double, barbershopName: String, name: String, bio: String? = nil, age: UInt, haircutsDone: UInt, instagram: String, isAvailableHome: Bool, phone: String, verified: Bool, workingHours: WorkingHours, reviews: [Review]) {
        self.id = id
        self.barbershopID = barbershopID
        self.barbershopName = barbershopName
        self.profileImageUrl = profileImageUrl
        self.province = province
        self.name = name
        self.bio = bio
        self.age = age
        self.haircutsDone = haircutsDone
        self.instagram = instagram
        self.isAvailableHome = isAvailableHome
        self.phone = phone
        self.verified = verified
        self.workingHours = workingHours
        self.reviews = reviews
    }
}

final class Review: Model, Content {
    static let schema = "reviews"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "message")
    var message: String
    
    @Field(key: "username")
    var username: String
    
    @Field(key: "rating")
    var rating: Double
    
    init() { }
    
    init(id: UUID? = nil, message: String, username: String, rating: Double) {
        self.id = id
        self.message = message
        self.username = username
        self.rating = rating
    }
}
