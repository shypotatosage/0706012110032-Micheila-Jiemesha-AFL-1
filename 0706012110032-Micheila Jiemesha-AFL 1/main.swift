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
var shopEquipments: [Equipment] = [Equipment(name: "Elven Shoes", price: 100, addStats: 20, type: 1, breakingIn: 10, description: "Adds 20 HP to your stats."), Equipment(name: "Kings Gauntlet", price: 200, addStats: 15, type: 2, breakingIn: 5, description: "Adds 15 Attack Point to your stats."), Equipment(name: "Bloodvine", price: 150, addStats: 15, type: 0, breakingIn: 7, description: "Adds 15 MP to your stats.")]
var monster: Monster = Monster(name: "")

// Functions
// ==========================================================================================

//Function Untuk Menampilkan Layar Saat Memasuki Shop
func shopScreen() {
    var choice: String = ""
    var choiceRepeat: Bool = false
    
    repeat {
        var shopIndex: Int = 0
        let numberOfChoicesInShop: Int = shopEquipments.count + 2
        
        print("""
        Welcome to the shop! ✨ Here you can buy potions such as elixir and potion to help you during your journey.
        
        💰 Your Money: \(player.money)
        
        [0] Back
        """)
        
        for equipment in shopEquipments {
            print("[\(shopIndex + 1)] \(equipment.name)", terminator: " ")
            
            if (player.equipments.contains(equipment)) {
                print("(Already Owned).", terminator: " ")
            } else {
                print("(\(equipment.price) Coins).", terminator: " ")
            }
            
            print("\(equipment.description) Breaks In \(equipment.breaksIn) turns.")
            
            shopIndex += 1
        }
        
        print("""
        [\(shopIndex + 1)] \(player.elixir.name) (\(player.elixir.price) Coins)
        [\(shopIndex + 2)] \(player.healthPotion.name) (\(player.healthPotion.price) Coins)
        
        """)
        
        repeat {
            print("Your choice? ", terminator: "")
            choice = readLine()!
            
            if (choice.range(of: "[^0-" + String(numberOfChoicesInShop) + "]", options: .regularExpression) == nil && choice.trimmingCharacters(in:.whitespacesAndNewlines) != "") {
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
        } else if (Int(choice) != 0) {
            player.buyEquipment(equipment: shopEquipments[Int(choice)! - 1])
        }
    } while (choice != "0")
    
}

func fleeFromMonsterScreen() {
    print("""
    
    You feel that if you don't escape soon, you won't be able to continue the fight.
    You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.
    
    You're safe, for now.
    
    """)
    
    player.returnToGoBack()
}

func monsterStatsScreen() {
    print("""
    
    😈 Name: \(monster.name) x1
    😈 Health: \(monster.HP)
    
    """)
    
    player.returnToGoBack()
}

// Function Tampilan Ketika User Masuk Ke Forest/Mountain
func monsterEncounterScreen() {
    print()
    
    if (monster.name == "Troll") {
        print("""
        As you enter the forest, you feel a sense of unease wash over you.
        Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.
        """)
    } else {
        print("""
        As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin. Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.
        """)
    }

    print()
    
    var choice: String = ""
    let numberOfChoicesOfAction = player.actions.count + 4
    
    repeat {
        print("""
        ❤️ Your HP: \(player.HP)
        ⚡️ Your MP: \(player.MP)
        💰 Your Money: \(player.money)
        
        """)
        
        var actionIndex: Int = 0
        
        for action in player.actions {
            print("[\(actionIndex + 1)] \(action.name)", terminator: " ")
            
            if (action.mp == 0) {
                print("No mana required.", terminator: " ")
            } else {
                print("Use \(action.mp)pt of MP.", terminator: " ")
            }
            
            print("\(action.description)")
            
            actionIndex += 1
        }
        
        print()
        print("[\(actionIndex + 1)] Use Potion to heal wound.")
        print("[\(actionIndex + 2)] Use Elixir to recover mana.")
        print("[\(actionIndex + 3)] Scan enemy's vital.")
        print("[\(actionIndex + 4)] Flee from battle.")
        
        var choiceRepeat: Bool = false
        
        repeat {
            print("Your choice? ", terminator: "")
            choice = readLine()!
            
            if (choice.range(of: "[^1-" + String(numberOfChoicesOfAction) + "]", options: .regularExpression) == nil && choice.trimmingCharacters(in:.whitespacesAndNewlines) != "") {
                if (Int(choice)! < 1 || Int(choice)! > numberOfChoicesOfAction) {
                    choiceRepeat = true
                    
                    print("\nChoice must be between 1-" + String(numberOfChoicesOfAction) + ".\n")
                } else {
                    choiceRepeat = false
                }
            } else {
                choiceRepeat = true
                
                print("\nChoice must be a number between 1-" + String(numberOfChoicesOfAction) + ".\n")
            }
        } while choiceRepeat
        
        if (Int(choice)! < actionIndex + 1) {
            monster.HP -= player.useAction(actionIndex: Int(choice)! - 1)
            
            if (player.skillStack.contains("Shield")) {
                player.HP -= monster.attack(shielded: true)
                player.skillStack.remove(at: player.skillStack.firstIndex(of: "Shield")!)
            } else {
                player.HP -= monster.attack(shielded: false)
            }
            
            for equipment in player.equipments {
                let isBroken = equipment.use()
                
                if (isBroken == 1) {
                    print("Your \(equipment.name) has broken.\n")
                    equipment.timesUsed = 0
                    equipment.isBroken = 0
                    player.equipments.remove(at: player.equipments.firstIndex(of: equipment)!)
                }
            }
            
            if (player.HP > 100 + player.equipmentHPBonus()) {
                player.HP = 100 + player.equipmentHPBonus()
            }
            
            if (player.MP > 50 + player.equipmentMPBonus()) {
                player.MP = 50 + player.equipmentMPBonus()
            }
            
            let coinsDropped: Int = Int.random(in: 10..<25)
            player.money += coinsDropped
            
            print("You gained \(coinsDropped) coins.\n")
        } else if (Int(choice) == actionIndex + 1) {
            player.healingScreen()
        } else if (Int(choice) == actionIndex + 2) {
            player.recoverManaScreen()
        } else if (Int(choice) == actionIndex + 3) {
            monsterStatsScreen()
        } else {
            fleeFromMonsterScreen()
        }
    } while (choice != String(numberOfChoicesOfAction) && player.HP > 0)
}

// Game Logic Starts Here
// ==========================================================================================

// Starting Screen
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

// Asking Players Name
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

// Main Menu Screen
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
        player.showStats()
    } else if (mainChoice.lowercased() == "h") {
        player.healingScreen()
    } else if (mainChoice.lowercased() == "f") {
        monster = Monster(name: "Troll")
        monsterEncounterScreen()
    } else if (mainChoice.lowercased() == "m") {
        monster = Monster(name: "Golem")
        monsterEncounterScreen()
    } else if (mainChoice.lowercased() == "r") {
        player.recoverManaScreen()
    } else if (mainChoice.lowercased() == "s") {
        shopScreen()
    }
} while mainChoice.lowercased() != "q" && player.HP > 0

if (player.HP <= 0) {
    print("\nToo bad, \(player.name)... You have drained all your health and died as a hero in the hands of the monster 🥲\n")
} else {
    print("\nI guess this is the end. May we meet again, \(player.name)!\n")
}
