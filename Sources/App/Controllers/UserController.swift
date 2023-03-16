//
//  File.swift
//  
//
//  Created by Samy Mehdid on 15/3/2023.
//

import Fluent
import Vapor

struct UserController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let users = routes.grouped("users")
        users.get(use: index)
        users.post(use: create)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[User]> {
        return User.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let user = try req.content.decode(User.self)
        return user.save(on: req.db).transform(to: .ok)
    }
}
