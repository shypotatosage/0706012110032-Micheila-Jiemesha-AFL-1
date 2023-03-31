//
//  Monster.swift
//  0706012110032-Micheila Jiemesha-AFL 1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation

struct Monster {
    var HP: Int = 1000
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func attack(shielded: Bool) -> Int {
        if (!shielded) {
            let damage: Int = Int.random(in: 1..<5)
            
            if (damage < 3) {
                print("\nThe \(name) throws a huge rock at your way, yet you managed to smash the rock, but the shards still managed to scratch you making your health decrease by \(damage).\n")
            } else {
                print("\nThe \(name) swiftly moves towards your back and slashed your body with a sharp rock making your health decrease by \(damage).\n")
            }
            
            return damage
        } else {
            print("""
            
            *Shriiing!*
            You have used 'Shield' skill which consumed 10 MP and will protect you from the \(name)s attack for 1 turn.
            
            """)
            
            return 0
        }
    }
    
    mutating func attacked(damage: Int) {
        HP -= damage
    }
}