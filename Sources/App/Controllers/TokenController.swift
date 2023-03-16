//
//  File.swift
//  
//
//  Created by Samy Mehdid on 16/3/2023.
//

import FluentKit
import Vapor

struct TokenController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let users = routes.grouped("login")
        users.post(use: create)
    }
    
    func create(req: Request) throws -> EventLoopFuture<Token> {
        let user = try req.auth.require(User.self)
        let token = try user.generateToken()
        return token.save(on: req.db).transform(to: token)
    }
}
