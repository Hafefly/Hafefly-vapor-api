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
    
    @Parent(key: "barbershop_id")
    var barbershop: Barbershop
    
    @Field(key: "profile_image_url")
    var profileImageUrl: String?
    
    @Field(key: "province")
    var province: String
    
    @Field(key: "rating")
    var rating: Double
    
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
    
    @Field(key: "working_hours")
    var workingHours: WorkingHours
    
    init() {}
    
    init(id: UUID? = nil, barbershopID: UUID, profileImageUrl: String? = nil, province: String, rating: Double, name: String, bio: String? = nil, age: UInt, experience: UInt, haircutsDone: UInt, instagram: String? = nil, isAvailableHome: Bool, phone: String, workingHours: WorkingHours) {
        self.id = id
        self.$barbershop.id = barbershopID
        self.profileImageUrl = profileImageUrl
        self.province = province
        self.rating = rating
        self.name = name
        self.bio = bio
        self.age = age
        self.experience = experience
        self.haircutsDone = haircutsDone
        self.instagram = instagram
        self.isAvailableHome = isAvailableHome
        self.phone = phone
        self.workingHours = workingHours
    }
}
