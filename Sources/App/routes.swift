import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    try app.register(collection: BarbershopController())
    try app.register(collection: BarberController())
    try app.register(collection: ReviewController())
    try app.register(collection: UserController())
    try app.register(collection: TokenController())
}
