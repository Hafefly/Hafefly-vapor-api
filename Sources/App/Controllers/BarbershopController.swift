//
//  BarberController.swift
//  
//
//  Created by Samy Mehdid on 13/3/2023.
//

import Fluent
import Vapor

struct BarbershopController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let barbershops = routes.grouped("barbershops")
        barbershops.get(use: index)
        barbershops.post(use: create)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Barbershop]> {
        return Barbershop.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let barbershop = try req.content.decode(Barbershop.self)
        return barbershop.save(on: req.db).transform(to: .ok)
    }
}
