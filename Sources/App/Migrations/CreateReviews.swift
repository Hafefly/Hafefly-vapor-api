//
//  CreateReviews.swift
//  
//
//  Created by Samy Mehdid on 15/3/2023.
//

import FluentKit

struct CreateReviews: Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("reviews")
            .id()
            .field("barber_id", .uuid, .references("barbers", "id"))
            .field("user_id", .uuid, .references("users", "id"))
            .field("rating", .double, .required)
            .field("message", .string)
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("reviews")
            .delete()
    }
}
