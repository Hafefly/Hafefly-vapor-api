//
//  User.swift
//  
//
//  Created by Samy Mehdid on 15/3/2023.
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
    
    @Field(key: "profile_image_url")
    var profileImageUrl: String?
    
    @Field(key: "phone")
    var phone: String
    
    @Field(key: "email")
    var email: String?
    
    @Field(key: "province")
    var province: String
    
    @Field(key: "haircuts_done")
    var haircutsDone: UInt
    
    @Field(key: "vip")
    var vip: Bool
    
    init() {}
    
    init(id: UUID? = nil, firstname: String, lastname: String, profileImageUrl: String, phone: String, email: String? = nil, province: String, haircutsDone: UInt, vip: Bool) {
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.profileImageUrl = profileImageUrl
        self.phone = phone
        self.email = email
        self.province = province
        self.haircutsDone = haircutsDone
        self.vip = vip
    }
}
