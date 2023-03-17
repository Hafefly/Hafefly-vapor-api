//
//  User.swift
//  
//
//  Created by Samy Mehdid on 15/3/2023.
//

import Fluent
import Vapor

final class User: Model, Content, Authenticatable {
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "username")
    var username: String
    
    @Field(key: "firstname")
    var firstname: String
    
    @Field(key: "lastname")
    var lastname: String
    
    @Field(key: "profile_image_url")
    var profileImageUrl: String?
    
    @Field(key: "phone")
    var phone: String?
    
    @Field(key: "email")
    var email: String?
    
    @Field(key: "password_hash")
    var passwordHash: String
    
    @Field(key: "province")
    var province: String
    
    @Field(key: "haircuts_done")
    var haircutsDone: Int
    
    @Field(key: "vip")
    var vip: Bool
    
    @Children(for: \.$user)
    var reviews: [Review]
    
    @Children(for: \.$user)
    var tokens: [Token]
    
    init() {}
    
    init(id: UUID? = nil, username: String, firstname: String, lastname: String, profileImageUrl: String? = nil, phone: String? = nil, email: String? = nil, passwordHash: String, province: String, haircutsDone: Int, vip: Bool) {
        self.id = id
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.profileImageUrl = profileImageUrl
        self.phone = phone
        self.email = email
        self.passwordHash = passwordHash
        self.province = province
        self.haircutsDone = haircutsDone
        self.vip = vip
    }
}

extension User: ModelAuthenticatable {
    static let usernameKey = \User.$username
    static let passwordHashKey = \User.$passwordHash

    func verify(password: String) throws -> Bool {
        try Bcrypt.verify(password, created: self.passwordHash)
    }
}

extension User {
    struct Create: Content {
        var username: String
        var firstname: String
        var lastname: String
        var province: String
        var password: String
        var confirmPassword: String
    }
}

extension User.Create: Validatable {
    static func validations(_ validations: inout Validations) {
        validations.add("username", as: String.self, is: !.empty)
        validations.add("firstname", as: String.self, is: !.empty)
        validations.add("password", as: String.self, is: .count(8...))
    }
}

extension User {
    func generateToken() throws -> Token {
            try .init(
                value: [UInt8].random(count: 16).base64,
                userID: self.requireID()
            )
        }
}
