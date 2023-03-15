//
//  File.swift
//  
//
//  Created by Samy Mehdid on 15/3/2023.
//

import FluentKit

struct CreateUsers: Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("users")
            .id()
            .field("firstname", .string, .required)
            .field("lastname", .string, .required)
            .field("profile_image_url", .string)
            .field("phone", .string, .required)
            .field("email", .string)
            .field("province", .string, .required)
            .field("haircuts_done", .uint8, .required)
            .field("vip", .bool, .required)
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("users")
            .delete()
    }
}
