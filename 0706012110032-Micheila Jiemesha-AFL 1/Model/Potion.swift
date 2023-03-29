//
//  Potion.swift
//  0706012110032-Micheila Jiemesha-AFL 1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation

class Potion: Item {
    var owned: Int = 0
    
    init(name: String, price: Int, addStats: Int, type: Int, owned: Int, description: String) {
        super.init(name: name, price: price, addStats: addStats, type: type, description: description)
        self.owned = owned
    }
    
    func buyPotion(amount: Int, money: Int) -> Int {
        if ((amount * price) > money) {
            print("\nYour money is not enough to buy \(amount) \(name)(s).\n")
            
            return 0
        } else {
            owned += amount
            
            return amount * price
        }
    }
    
    func usePotion() -> Int {
        if (owned <= 0) {
            print("\nYou don't have any \(name)s to use.\n")
            
            return 0
        } else {
            owned -= 1
            
            print("\nYou used 1 \(name).\n")
            
            return addStats
        }
    }
}
