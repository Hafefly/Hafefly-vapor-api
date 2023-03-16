//
//  File.swift
//  
//
//  Created by Samy Mehdid on 16/3/2023.
//

import FluentKit

struct CreateTokens: Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema(Token.schema)
            .id()
            .field("value", .string, .required)
            .field("user_id", .uuid, .required, .references(User.schema, "id"))
            .unique(on: "value")
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema(Token.schema)
            .delete()
    }
}
