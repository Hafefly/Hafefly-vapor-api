//
//  Pricing.swift
//  
//
//  Created by Samy Mehdid on 13/3/2023.
//

import Fluent
import Vapor

final class Pricing: Model, Content {
    static let schema = "pricing"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "fade")
    var fade: UInt
    
    @Field(key: "bears")
    var beard: UInt
    
    @Field(key: "hairdryer")
    var hairdryer: UInt
    
    @Field(key: "razor")
    var razor: UInt
    
    @Field(key: "scissors")
    var scissors: UInt
    
    @Field(key: "strightener")
    var straightener: UInt
    
    @Field(key: "atHome")
    var atHome: UInt?
    
    init() {}
    
    init(id: UUID? = nil, fade: UInt, beard: UInt, hairdryer: UInt, razor: UInt, scissors: UInt, straightener: UInt, atHome: UInt? = nil){
        self.id = id
        self.fade = fade
        self.beard = beard
        self.hairdryer = hairdryer
        self.razor = razor
        self.scissors = scissors
        self.straightener = straightener
        self.atHome = atHome
    }
}
