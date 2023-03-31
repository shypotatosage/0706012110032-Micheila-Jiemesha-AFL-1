//
//  main.swift
//  0706012110032-Micheila Jiemesha-AFL 1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var player: Player = Player(name: "")

var start: String = ""
var mainChoice: String = ""
var HP: Int = 100
var MP: Int = 50
var elixir: Int = 5
var potions = ["Potion": 20, "Elixir": 5]
let monsterName: [String] = ["Troll", "Golem"]
let maxHP: Int = 100
let maxMP: Int = 50
var monsterHP: [Int] = [1000, 1000]
var skillStack = Set<String>()
var money: Double = 0
let price = ["Potion": 35, "Elixir": 50]
let actions = ["Physical Attack. No mana required. Deal 5pt of damage.", "Meteor. Use 15pt of MP. Deal 50pt of damage.", "Shield. Use 10pt of MP. Block enemy's attack in 1 turn.", "Use Potion to heal wound.", "Use Elixir to recover mana.", "Scan enemy's vital.", "Flee from battle."]
var shopEquipments: [Equipment] = [Equipment(name: "Elven Shoes", price: 100, addStats: 20, type: 1, breakingIn: 10, description: "Adds 20 HP to your stats. Breaks in 10 turns."), Equipment(name: "Kings Gauntlet", price: 200, addStats: 15, type: 2, breakingIn: 5, description: "Adds 15 Attack Point to your stats. Breaks in 5 turns."), Equipment(name: "Bloodvine", price: 200, addStats: 15, type: 2, breakingIn: 5, description: "Adds 15 Attack Point to your stats. Breaks in 5 turns.")]

// Functions
// ==========================================================================================

//Function untuk mempersingkat Return To Go Back karena dipakai berulang kali
func returnToGoBack() {
    var returnChoice: String = ""
    
    repeat {
        print("Press [return] to go back: ", terminator: "")
        
        returnChoice = readLine()!
        
        if (returnChoice.trimmingCharacters(in:.whitespacesAndNewlines) != "") {
            print("\nWrong Input! You must [return] to continue\n")
        }
    } while returnChoice != ""
}

//Function untuk menampilkan layar saat memasuki shop
func shopScreen() {
    var choice: String = ""
    var choiceRepeat: Bool = false
    
    var shopIndex: Int = 0
    let numberOfChoicesInShop: Int = shopEquipments.count + 2
    
    repeat {
        print("""
        Welcome to the shop! ✨ Here you can buy potions such as elixir and potion to help you during your journey.
        
        [0] Back
        """)
        
        for equipment in shopEquipments {
            print("[\(shopIndex + 1)] \(equipment.name)", terminator: " ")
            
            if (player.equipments.contains(equipment)) {
                print("(Already Owned).", terminator: " ")
            } else {
                print("(\(equipment.price) Coins).", terminator: " ")
            }
            
            if (equipment.type == 0) {
                print("Increases player MP by \(equipment.addStats).", terminator: " ")
            } else {
                print("", terminator: " ")
            }
            
            print("\(equipment.description).")
            
            shopIndex += 1
        }
        
        print("""
        [\(shopIndex + 1)] \(player.elixir.name) (\(player.elixir.price) Coins)
        [\(shopIndex + 2)] \(player.healthPotion.name) (\(player.healthPotion.price) Coins)
        
        """)
        
        repeat {
            print("Your choice? ", terminator: "")
            choice = readLine()!
            
            if (choice.range(of: "[^0-" + String(numberOfChoicesInShop) + "]", options: .regularExpression) == nil) {
                if (Int(choice)! < 0 || Int(choice)! > numberOfChoicesInShop) {
                    choiceRepeat = true
                    
                    print("\nChoice must be between 0-" + String(numberOfChoicesInShop) + ".\n")
                } else {
                    choiceRepeat = false
                }
            } else {
                choiceRepeat = true
                
                print("\nChoice must be a number between 0-" + String(numberOfChoicesInShop) + ".\n")
            }
        } while choiceRepeat
        
        if (Int(choice) == shopIndex + 1 || Int(choice) == shopIndex + 2) {
            var amount: Int = 0
            var buy: Bool = false
            var temp: String = ""
            
            repeat {
                print("\nHowmany would you like to buy? ([0] Back) ", terminator: "")
                temp = readLine()!
                
                if (temp.range(of: "[^0-9]", options: .regularExpression) != nil) {
                    buy = false
                    
                    print("\nYou must only input a number.\n")
                } else {
                    if (Int(temp)! < 0) {
                        buy = false
                        
                        print("\nInput may not be less than 0.\n")
                    } else {
                        buy = true
                    }
                }
            } while !buy
            
            amount = Int(temp)!
            
            player.buyPotion(amount: amount, type: Int(choice)! - shopIndex - 1)
        } else {
            player.buyEquipment(equipment: shopEquipments[Int(choice)! - 1])
        }
    } while (choice != "0")
    
}

// Game Logic Starts Here
// ==========================================================================================

repeat {
    print("""
    Welcome to the world of magic! 🧙🏻‍♂️🧌

    You have been chose to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventures will take you through forests 🌲, mountains ⛰️, and dungeons 🏰, where you will face challenges, make allies, and fight enemies.

    Press [return] to continue:
    """, terminator: " ")
    
    start = readLine()!
    
    if (start != "") {
        print("\nWrong Input! You must [return] to continue\n")
    }
} while start != ""

var userName: String = ""

print()

repeat {
    print("May I know your name, a young wizard? ", terminator: "")
    userName = readLine()!
    
    if (userName.trimmingCharacters(in: .whitespacesAndNewlines) == "") {
        print("\nYou must enter your name.\n")
    } else if (userName.range(of: "[^a-zA-Z]", options: .regularExpression) != nil) {
        print("\nName must only be characters, no symbols, numbers, and whitespaces allowed.\n")
    }
} while userName.trimmingCharacters(in: .whitespacesAndNewlines) == "" || (userName.range(of: "[^a-zA-Z]", options: .regularExpression) != nil)

print("\nNice to meet you \(userName)!")

player = Player(name: userName)

repeat {
    print("\nFrom here, you can...")
    
    print("""
    \n[C]heck your health and stats
    [H]eal your wounds with potion
    [R]ecover your mana with elixir
    [S]hop

    ...or choose where you want to go

    [F]orest of Troll
    [M]ountain of Golem
    [Q]uit Game

    """)
    
    repeat {
        print("Your choice? ", terminator: "")
        
        mainChoice = readLine()!
        
        if ((mainChoice.lowercased() == "c" || mainChoice.lowercased() == "h" || mainChoice.lowercased() == "f" || mainChoice.lowercased() == "m" || mainChoice.lowercased() == "q" ||  mainChoice.lowercased() == "r" ||  mainChoice.lowercased() == "s") == false) {
            print("\nPlease choose from the menu above.\n")
        } else if (mainChoice.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
            print("\nChoice may not be empty.\n")
        }
    } while (mainChoice.lowercased() == "c" || mainChoice.lowercased() == "h" || mainChoice.lowercased() == "f" || mainChoice.lowercased() == "m" || mainChoice.lowercased() == "q" ||  mainChoice.lowercased() == "r" ||  mainChoice.lowercased() == "s") == false
    
    if (mainChoice.lowercased() == "c") {
//        print("""
//        Player Name: \(userName)
//
//        HP: \(HP)/100
//        MP: \(MP)/50
//        Money: \(money)
//
//        Magic:
//        - Physical Attack. No mana required. Deal 5pt of damage.
//        - Meteor. Use 15pt of MP. Deal 50pt of damage.
//        - Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
//
//        Items:
//        - Potion x\(potions["Potion"]!). Heal 20pt of your HP
//        - Elixir x\(elixir). Add 10pt of your MP.
//
//        """)
//
//        returnToGoBack()
        player.showStats()
    } else if (mainChoice.lowercased() == "h") {
        player.healingScreen()
    } else if (mainChoice.lowercased() == "f") {
        player.monster = Monster(name: "Troll")
        player.monsterEncounter()
    } else if (mainChoice.lowercased() == "m") {
        player.monster = Monster(name: "Golem")
        player.monsterEncounter()
    } else if (mainChoice.lowercased() == "r") {
        player.recoverManaScreen()
    } else if (mainChoice.lowercased() == "s") {
        shopScreen()
    }
} while mainChoice.lowercased() != "q" && player.HP > 0

if (HP <= 0) {
    print("\nToo bad, \(userName)... You have drained all your health and died as a hero in the hands of the monster 🥲\n")
} else {
    print("\nI guess this is the end. May we meet again, \(userName)!\n")
}
