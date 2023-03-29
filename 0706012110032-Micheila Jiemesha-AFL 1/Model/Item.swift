//
//  Item.swift
//  0706012110032-Micheila Jiemesha-AFL 1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation

class Item {
    var name: String
    var price: Int
    var addStats: Int
    var type: Int
    var description: String
    
    init(name: String, price: Int, addStats: Int, type: Int, description: String) {
        self.name = name
        self.price = price
        self.addStats = addStats
        self.type = type
        self.description = description
    }
}
