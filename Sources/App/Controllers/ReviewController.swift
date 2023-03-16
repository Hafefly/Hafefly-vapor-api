//
//  ReviewController.swift
//  
//
//  Created by Samy Mehdid on 15/3/2023.
//

import Fluent
import Vapor

struct ReviewController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let reviews = routes.grouped("reviews")
        reviews.get(use: index)
        reviews.post(use: create)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Review]> {
        return Review.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let review = try req.content.decode(Review.self)
        return review.save(on: req.db).transform(to: .ok)
    }
}
