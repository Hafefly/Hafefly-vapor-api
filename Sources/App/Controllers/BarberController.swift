//
//  BarberController.swift
//  
//
//  Created by Samy Mehdid on 13/3/2023.
//

import Fluent
import Vapor

struct BarberController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let barbers = routes.grouped("barbers")
        barbers.get(use: index)
        barbers.post(use: create)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Barber]> {
        return Barber.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let barber = try req.content.decode(Barbershop.self)
        return barber.save(on: req.db).transform(to: .ok)
    }
}
