//
//  CreateBarbershops.swift
//  
//
//  Created by Samy Mehdid on 13/3/2023.
//

import Fluent

struct CreateBarbershops: Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("barbers")
            .id()
            .field("name", .string, .required)
            .field("image_url", .string, .required)
            .field("town", .string, .required)
            .field("rating", .double, .required)
            .field("vip", .bool, .required)
            .field("working_hours", .custom(WorkingHours.self), .required)
            .field("pricing", .custom(Pricing.self), .required)
            .field("coordinate", .custom(Coordinate.self), .required)
            .field("barbers", .array(of: .custom(Barber.self)))
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("barbers")
            .delete()
    }
}
