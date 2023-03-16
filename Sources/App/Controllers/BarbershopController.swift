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
        if let id = req.parameters.get("id", as: UUID.self) {
            return try findBarbershop(req: req, by: id).map { [$0] }
        } else if let query = req.parameters.get("query", as: String.self) {
            return try searchBarbershops(req: req, for: query)
        } else {
            return Barbershop.query(on: req.db).with(\.$barbers).all()
        }
    }
    
    func findBarbershop(req: Request, by id: UUID) throws -> EventLoopFuture<Barbershop> {
        Barbershop.find(id, on: req.db).unwrap(or: Abort(.noContent))
    }
    
    func searchBarbershops(req: Request, for query: String) throws -> EventLoopFuture<[Barbershop]> {
        return Barbershop.query(on: req.db)
            .filter(\.$name == query)
            .sort(\.$rating)
            .with(\.$barbers)
            .all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let barbershop = try req.content.decode(Barbershop.self)
        return barbershop.save(on: req.db).transform(to: .ok)
    }
}
