//
//  File.swift
//  
//
//  Created by Samy Mehdid on 14/3/2023.
//

import Fluent
import Vapor

final class User: Model, Content {
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "firstname")
    var firstname: String
    
    @Field(key: "lastname")
    var lastname: String
    
    @Field(key: "profile_image")
    var profileImage: String?
    
    @Field(key: "phone")
    var phone: String
    
    @Field(key: "email")
    var email: String?
    
    @Field(key: "instagram")
    var instagram: String?
    
    @Field(key: "province")
    var province: String
    
    @Field(key: "haircuts_done")
    var haircutsDone: UInt
    
    @Field(key: "age")
    var age: UInt?
    
    @Field(key: "vip")
    var vip: Bool
    
    init() {}
    
    init(id: UUID? = nil, firstname: String, lastname: String, profileImage: String? = nil, phone: String, email: String? = nil, instagram: String? = nil, province: String, haircutsDone: UInt, age: UInt? = nil, vip: Bool) {
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.profileImage = profileImage
        self.phone = phone
        self.email = email
        self.instagram = instagram
        self.province = province
        self.haircutsDone = haircutsDone
        self.age = age
        self.vip = vip
    }
}
