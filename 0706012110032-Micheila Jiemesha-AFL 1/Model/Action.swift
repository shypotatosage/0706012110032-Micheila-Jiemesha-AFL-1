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
    var type: Int
    var description: String
    
    init(name: String, mp: Int, points: Int, type: Int, description: String) {
        self.name = name
        self.mp = mp
        self.points = points
        self.type = type
        self.description = description
    }
}
