//
//  CreateUsers.swift
//  
//
//  Created by Samy Mehdid on 15/3/2023.
//

import FluentKit

struct CreateUsers: Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema(User.schema)
            .id()
            .field("username", .string, .required)
            .unique(on: "username")
            .field("firstname", .string, .required)
            .field("lastname", .string, .required)
            .field("profile_image_url", .string)
            .field("phone", .string)
            .field("email", .string)
            .field("password_hash", .string, .required)
            .field("province", .string, .required)
            .field("haircuts_done", .int8, .required)
            .field("vip", .bool, .required)
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema(User.schema)
            .delete()
    }
}
