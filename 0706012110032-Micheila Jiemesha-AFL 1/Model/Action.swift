//
//  Action.swift
//  0706012110032-Micheila Jiemesha-AFL 1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation

struct Action {
    var name: String
    var mp: Int
    var points: Int
    // Type 0 = Offense && Type 1 = Defense
    var type: Int
    var description: String
    var messageAfterUsed: String
    
    // Initializer
    init(name: String, mp: Int, points: Int, type: Int, description: String, messageAfterUsed: String) {
        self.name = name
        self.mp = mp
        self.points = points
        self.type = type
        self.description = description
        self.messageAfterUsed = messageAfterUsed
    }
}
