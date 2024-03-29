//
//  CreateBarbers.swift
//  
//
//  Created by Samy Mehdid on 13/3/2023.
//

import FluentKit

struct CreateBarbers: Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema(Barber.schema)
            .id()
            .field("barbershop_id", .uuid, .references(Barbershop.schema, "id"))
            .field("name", .string, .required)
            .field("profile_image_url", .string)
            .field("province", .string, .required)
            .field("rating", .double, .required)
            .field("bio", .string)
            .field("age", .int8, .required)
            .field("experience", .int8, .required)
            .field("haircuts_done", .int8, .required)
            .field("instagram", .string)
            .field("is_available_home", .bool, .required)
            .field("phone", .string, .required)
//            .field("working_hours", .custom(WorkingHours.self), .required)
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema(Barber.schema)
            .delete()
    }
}
