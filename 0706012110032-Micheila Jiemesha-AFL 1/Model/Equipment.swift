//
//  Equipment.swift
//  0706012110032-Micheila Jiemesha-AFL 1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation

class Equipment: Item, Hashable, Equatable {
    // Supaya Bisa Memasukkan Equipment Ke Dalam Set
    // Equatable
    static func == (lhs: Equipment, rhs: Equipment) -> Bool {
        return lhs.name == rhs.name
    }
    
    // Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    var breaksIn: Int = 0
    var isBroken: Bool = false
    var timesUsed: Int = 0
    
    // Initializer
    init(name: String, price: Int, addStats: Int, type: Int, breakingIn: Int, description: String) {
        super.init(name: name, price: price, addStats: addStats, type: type, description: description)
        self.breaksIn = breakingIn
    }
    
    // Function Ketika User Menggunakan Equipment Selama Melakukan Serangan/Menggunakan Skill Ke Enemy
    func use() -> Bool {
        timesUsed += 1
        
        if (timesUsed == breaksIn) {
            isBroken = true
        }
        
        return isBroken
    }
}
