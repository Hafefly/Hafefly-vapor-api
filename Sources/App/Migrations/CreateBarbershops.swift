//
//  CreateBarbershops.swift
//  
//
//  Created by Samy Mehdid on 13/3/2023.
//

import Fluent

struct CreateBarbershops: Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema(Barbershop.schema)
            .id()
            .field("name", .string, .required)
            .field("image_url", .string)
            .field("town", .string, .required)
            .field("rating", .double, .required)
            .field("vip", .bool, .required)
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema(Barbershop.schema)
            .delete()
    }
}
