//
//  Player.swift
//  0706012110032-Micheila Jiemesha-AFL 1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation

struct Player {
    var name: String
    var HP: Int = 100
    var MP: Int = 50
    var money: Int = 0
    var elixir: Potion = Potion(name: "Elixir", price: 50, addStats: 10, type: 0, owned: 5, description: "Recover 10pt of your MP")
    var healthPotion: Potion = Potion(name: "Health Potion", price: 35, addStats: 20, type: 1, owned: 20, description: "Heal 20pt of your HP")
    var equipments: Set<Equipment> = Set<Equipment>()
    var actions: [Action] = [Action]()
    var monster: Monster?
    
    init(name: String) {
        self.name = name
    }
    
    mutating func buyPotion(amount: Int, type: Int) {
        if (type == 0) {
            money -= elixir.buyPotion(amount: amount, money: self.money)
        } else {
            money -= healthPotion.buyPotion(amount: amount, money: self.money)
        }
    }
    
    mutating func usePotion(type: Int) {
        if (type == 0) {
            MP += elixir.usePotion()
        } else {
            HP +=  healthPotion.usePotion()
        }
    }
    
    mutating func buyEquipment(equipment: Equipment) {
        if (equipment.price <= money) {
            money -= equipment.price
            equipments.insert(equipment)
            print("\nYou successfully bought \(equipment.name) for \(equipment.price)!\n")
        } else {
            print("\nYou don't have enough money to buy \(equipment.name). You need \(equipment.price - money) more.\n")
        }
    }
    
    func monsterEncounter() {
        if (monster?.name == "Troll") {
            print("""
            As you enter the forest, you feel a sense of unease wash over you.
            Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.
            """)
        } else {
            print("""
            As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin. Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.
            """)
        }
        
        var choice = 0
        
        repeat {
            print("""
        
        ❤️ Your HP: \(HP)
        ⚡️ Your MP: \(MP)
        💰 Your Money: \(money)
        
        """)
            
            var num = 0
            
            for action in actions {
                print("[\(num + 1)] \(action.name)", terminator: " ")
                
                if (action.mp == 0) {
                    print("No mana required.", terminator: " ")
                } else {
                    print("Use \(action.mp)pt of MP.", terminator: " ")
                }
                
                print("\(action.description).")
                
                num += 1
            }
            
            print("[\(num + 1)] Use Potion to heal wound.")
            print("[\(num + 2)] Use Elixir to recover mana.")
            print("[\(num + 3)] Scan enemy's vital.")
            print("[\(num + 4)] Flee from battle.")
            
            var choiceRepeat: Bool = false
            
            repeat {
                print("Your choice? ", terminator: "")
                choice = readLine()!
            } while choiceRepeat
            
            switch choice {
            case 1:
                <#code#>
            default:
                <#code#>
            }
        } while (choice != actions.count + 4 && player.HP > 0)
    }
}
