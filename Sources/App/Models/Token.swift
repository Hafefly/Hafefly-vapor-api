//
//  Token.swift
//  
//
//  Created by Samy Mehdid on 16/3/2023.
//

import Fluent
import Vapor

final class Token: Model, Content {
    static let schema = "user_tokens"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "value")
    var value: String

    @Parent(key: "user_id")
    var user: User

    init() { }

    init(id: UUID? = nil, value: String, userID: UUID) {
        self.id = id
        self.value = value
        self.$user.id = userID
    }
}

extension Token: ModelTokenAuthenticatable {
    static let valueKey = \Token.$value
    static let userKey = \Token.$user

    var isValid: Bool {
        true
    }
}
