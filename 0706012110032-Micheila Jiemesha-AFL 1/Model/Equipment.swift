//
//  Equipment.swift
//  0706012110032-Micheila Jiemesha-AFL 1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation

class Equipment: Item, Hashable, Equatable {
    static func == (lhs: Equipment, rhs: Equipment) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    var breakingIn: Int = 0
    var isBroken: Bool = false
    
    init(name: String, price: Int, addStats: Int, type: Int, breakingIn: Int, description: String) {
        super.init(name: name, price: price, addStats: addStats, type: type, description: description)
        self.breakingIn = breakingIn
    }
    
    func use() -> Bool {
        breakingIn -= 1
        
        if (breakingIn <= 0) {
            isBroken = true
        }
        
        return isBroken
    }
}
