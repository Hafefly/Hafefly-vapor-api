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
        users.get(use: me)
        users.post(use: create)
    }
    
    func me(req: Request) throws -> EventLoopFuture<User> {
        let user = try req.auth.require(User.self)
        return req.eventLoop.future(user)
    }
    
    func create(req: Request) throws -> EventLoopFuture<User> {
        try User.Create.validate(content: req)
        let create = try req.content.decode(User.Create.self)
        guard create.password == create.confirmPassword else {
            throw Abort(.badRequest, reason: "Passwords did not match")
        }
        let user = User(
            firstname: create.firstname,
            lastname: create.lastname,
            email: create.email,
            passwordHash: try Bcrypt.hash(create.password),
            province: create.province,
            haircutsDone: 0,
            vip: false
        )
        
        return user.save(on: req.db).transform(to: user)
    }
}
