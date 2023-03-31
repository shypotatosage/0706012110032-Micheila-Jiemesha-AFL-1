//
//  Player.swift
//  0706012110032-Micheila Jiemesha-AFL 1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation

class Player {
    var name: String
    var HP: Int = 100
    var MP: Int = 50
    var money: Int = 0
    var elixir: Potion = Potion(name: "Elixir", price: 50, addStats: 10, type: 0, owned: 5, description: "Recover 10pt of your MP")
    var healthPotion: Potion = Potion(name: "Health Potion", price: 35, addStats: 20, type: 1, owned: 20, description: "Heal 20pt of your HP")
    var equipments: Set<Equipment> = Set<Equipment>()
    var actions: [Action] = [Action]()
    var monster: Monster?
    var skillStack: [String] = []
    
    init(name: String) {
        self.name = name
        actions.append(Action(name: "Physical Attack", mp: 0, points: 5, type: 0, description: "Deal 5pt of damage.", messageAfterUsed: "\n*Slash*\nYou have dealt 5 damage to your enemy."))
        actions.append(Action(name: "Meteor", mp: 15, points: 5, type: 0, description: "Deal 50pt of damage.", messageAfterUsed: "\n*BOOM*\nYou have used 'Meteor' skill which consumed 15 MP and dealt 50 damage to your enemy."))
        actions.append(Action(name: "Shield", mp: 10, points: 1, type: 1, description: "Block enemy's attack in 1 turn.", messageAfterUsed: "\n*Shriiing*\nYou have used 'Shield' skill which consumed 10 MP and will protect you from the enemy's attack for 1 turn."))
    }
    
    func equipmentHPBonus() -> Int {
        var HPBonus: Int = 0
        
        for equipment in equipments {
            if (equipment.type == 1) {
                HPBonus += equipment.addStats
            }
        }
        
        return HPBonus
    }
    
    func equipmentMPBonus() -> Int {
        var MPBonus: Int = 0
        
        for equipment in equipments {
            if (equipment.type == 0) {
                MPBonus += equipment.addStats
            }
        }
        
        return MPBonus
    }
    
    func equipmentAttackBonus() -> Int {
        var AttackBonus: Int = 0
        
        for equipment in equipments {
            if (equipment.type == 2) {
                AttackBonus += equipment.addStats
            }
        }
        
        return AttackBonus
    }
    
    func buyPotion(amount: Int, type: Int) {
        if (type == 0) {
            money -= elixir.buyPotion(amount: amount, money: self.money)
        } else {
            money -= healthPotion.buyPotion(amount: amount, money: self.money)
        }
    }
    
    func usePotion(type: Int) {
        if (type == 0) {
            MP += elixir.usePotion()
            
            if (MP > 50 + equipmentMPBonus()) {
                MP = 50 + equipmentMPBonus()
            }
        } else {
            HP +=  healthPotion.usePotion()
            
            if (HP > 100 + equipmentHPBonus()) {
                HP = 100 + equipmentHPBonus()
            }
        }
    }
    
    func buyEquipment(equipment: Equipment) {
        if (equipments.contains(equipment)) {
            print("\nYou already own this \(equipment.name)!\n")
        } else {
            if (equipment.price <= money) {
                money -= equipment.price
                equipments.insert(equipment)
                print("\nYou successfully bought \(equipment.name) for \(equipment.price)!\n")
                
                if (equipment.type == 0) {
                    MP += equipment.addStats
                } else if (equipment.type == 1) {
                    HP += equipment.addStats
                }
            } else {
                print("\nYou don't have enough money to buy \(equipment.name). You need \(equipment.price - money) more.\n")
            }
        }
    }
    
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
    
    func showStats() {
        print("""
        
        Player Name: \(name)
        
        HP: \(HP)/\(100 + equipmentHPBonus())
        MP: \(MP)/\(50 + equipmentMPBonus())
        Money: \(money)
        Bonus Attack: \(equipmentAttackBonus())
        
        Magic:
        """)
        
        for action in actions {
            print("- \(action.name).", terminator: " ")
            
            if (action.mp == 0) {
                print("No mana required.", terminator: " ")
            } else {
                print("Use \(action.mp)pt of MP.", terminator: " ")
            }
            
            print("\(action.description)")
        }
        
        print("""
        
        Items:
        - \(healthPotion.name) x\(healthPotion.owned). \(healthPotion.description)
        - \(elixir.name) x\(elixir.owned). \(elixir.description)
        """)
        
        for equipment in equipments {
            print("- \(equipment.name). \(equipment.description) Breaks In \(equipment.breaksIn - equipment.timesUsed) turns.")
        }
        
        print()
        
        returnToGoBack()
    }
    
    func healingScreen() {
        var healingChoice: String = ""
        
        if healthPotion.owned > 0 && HP < 100 + equipmentHPBonus() {
            print("""
            \nYour HP is \(HP).
            You have \(healthPotion.owned) Potions.
            
            """)
            
            repeat {
                print("Are you sure you want to use 1 potion to heal wound? [Y/N] ", terminator: "")
                
                healingChoice = readLine()!
                
                if (healingChoice.lowercased() != "y" && healingChoice.lowercased() != "n") {
                    print("\nYou must only choose between Y (Yes) or N (No).\n")
                }
            } while healingChoice.lowercased() != "y" && healingChoice.lowercased() != "n"
            
            if (healingChoice.lowercased() == "y") {
                usePotion(type: 1)
                
                repeat {
                    if healthPotion.owned > 0 && HP < 100 + equipmentHPBonus() {
                        print("""
                        \nYour HP is \(HP) now.
                        You have \(healthPotion.owned) Potions left.
                        
                        """)
                        
                        repeat {
                            print("Still want to use 1 potion to heal wound again? [Y/N] ", terminator: "")
                            
                            healingChoice = readLine()!
                            
                            if (healingChoice.lowercased() != "y" && healingChoice.lowercased() != "n") {
                                print("\nYou must only choose between Y (Yes) or N (No).\n")
                            }
                        } while healingChoice.lowercased() != "y" && healingChoice.lowercased() != "n"
                        
                        if (healingChoice.lowercased() == "y") {
                            usePotion(type: 1)
                        }
                    } else if healthPotion.owned < 0 {
                        print("\nYou don't have any potion left. Be careful of your next journey.\n")
                        
                        repeat {
                            print("Press [return] to go back: ", terminator: "")
                            
                            healingChoice = readLine()!
                            
                            if (healingChoice.trimmingCharacters(in:.whitespacesAndNewlines) != "") {
                                print("\nWrong Input! You must [return] to continue\n")
                            }
                        } while healingChoice != ""
                    } else {
                        print("\nYour health is already maxed.\n")
                        
                        repeat {
                            print("Press [return] to go back: ", terminator: "")
                            
                            healingChoice = readLine()!
                            
                            if (healingChoice.trimmingCharacters(in:.whitespacesAndNewlines) != "") {
                                print("\nWrong Input! You must [return] to continue\n")
                            }
                        } while healingChoice != ""
                    }
                } while healingChoice.lowercased() != "n" && healingChoice != ""
            }
        } else if healthPotion.owned < 0 {
            print("\nYou don't have any potion left. Be careful of your next journey.\n")
            
            returnToGoBack()
        } else {
            print("\nYour health is already maxed.\n")
            
            returnToGoBack()
        }
    }
    
    func recoverManaScreen() {
        var manaChoice: String = ""
        
        if elixir.owned > 0 && MP < 50 + equipmentMPBonus() {
            print("""
            \nYour MP is \(MP).
            You have \(elixir.owned) Elixirs.
            
            """)
            
            repeat {
                print("Are you sure you want to use 1 elixir to recover mana? [Y/N] ", terminator: "")
                
                manaChoice = readLine()!
                
                if (manaChoice.lowercased() != "y" && manaChoice.lowercased() != "n") {
                    print("\nYou must only choose between Y (Yes) or N (No).\n")
                }
            } while manaChoice.lowercased() != "y" && manaChoice.lowercased() != "n"
            
            if (manaChoice.lowercased() == "y") {
                usePotion(type: 0)
                
                repeat {
                    if elixir.owned > 0 && MP < 50 + equipmentMPBonus() {
                        print("""
                        \nYour MP is \(MP) now.
                        You have \(elixir.owned) Elixirs left.
                        
                        """)
                        
                        repeat {
                            print("Still want to use 1 elixir to recover mana again? [Y/N] ", terminator: "")
                            
                            manaChoice = readLine()!
                            
                            if (manaChoice.lowercased() != "y" && manaChoice.lowercased() != "n") {
                                print("\nYou must only choose between Y (Yes) or N (No).\n")
                            }
                        } while manaChoice.lowercased() != "y" && manaChoice.lowercased() != "n"
                        
                        if (manaChoice.lowercased() == "y") {
                            usePotion(type: 0)
                        }
                    } else if elixir.owned < 0 {
                        print("\nYou don't have any elixir left. Be careful of your next journey.")
                        
                        repeat {
                            print("Press [return] to go back: ", terminator: "")
                            
                            manaChoice = readLine()!
                            
                            if (manaChoice.trimmingCharacters(in:.whitespacesAndNewlines) != "") {
                                print("\nWrong Input! You must [return] to continue\n")
                            }
                        } while manaChoice != ""
                    } else {
                        print("\nYour mana is already maxed.\n")
                        
                        repeat {
                            print("Press [return] to go back: ", terminator: "")
                            
                            manaChoice = readLine()!
                            
                            if (manaChoice.trimmingCharacters(in:.whitespacesAndNewlines) != "") {
                                print("\nWrong Input! You must [return] to continue\n")
                            }
                        } while manaChoice != ""
                    }
                } while manaChoice.lowercased() != "n" && manaChoice != ""
            }
        } else if elixir.owned < 0 {
            print("\nYou don't have any elixir left. Be careful of your next journey.")
            
            returnToGoBack()
        } else {
            print("\nYour mana is already maxed.\n")
            
            returnToGoBack()
        }
    }
    
    func useAction(actionIndex: Int) {
        print(actions[actionIndex].messageAfterUsed)
        
        if (actions[actionIndex].type == 1) {
            for _ in 1...actions[actionIndex].points {
                skillStack.append("Shield")
            }
        } else {
            monster?.HP -= actions[actionIndex].points  + equipmentAttackBonus()
            MP -= actions[actionIndex].mp
        }
    }
    
    func monsterEncounter() {
        print()
        
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
    
        print()
        
        var choice: String = ""
        let numberOfChoicesOfAction = actions.count + 4
        
        repeat {
            print("""
            ❤️ Your HP: \(HP)
            ⚡️ Your MP: \(MP)
            💰 Your Money: \(money)
            
            """)
            
            var actionIndex: Int = 0
            
            for action in actions {
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
                useAction(actionIndex: Int(choice)! - 1)
                
                if (skillStack.contains("Shield")) {
                    HP -= monster!.attack(shielded: true)
                    skillStack.remove(at: skillStack.firstIndex(of: "Shield")!)
                } else {
                    HP -= monster!.attack(shielded: false)
                }
                
                for equipment in equipments {
                    let isBroken = equipment.use()
                    
                    if (isBroken) {
                        print("Your \(equipment.name) has broken.\n")
                        equipment.timesUsed = 0
                        equipment.isBroken = false
                        equipments.remove(at: equipments.firstIndex(of: equipment)!)
                    }
                }
                
                if (HP > 100 + equipmentHPBonus()) {
                    HP = 100 + equipmentHPBonus()
                }
                
                if (MP > 50 + equipmentMPBonus()) {
                    MP = 50 + equipmentMPBonus()
                }
                
                let coinsDropped: Int = Int.random(in: 10..<25)
                money += coinsDropped
                
                print("You gained \(coinsDropped) coins.\n")
            } else if (Int(choice) == actionIndex + 1) {
                healingScreen()
            } else if (Int(choice) == actionIndex + 2) {
                recoverManaScreen()
            } else if (Int(choice) == actionIndex + 3) {
                print("""
                
                😈 Name: \(monster!.name) x1
                😈 Health: \(monster!.HP)
                
                """)
                
                returnToGoBack()
            } else {
                print("""
                
                You feel that if you don't escape soon, you won't be able to continue the fight.
                You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.
                
                You're safe, for now.
                
                """)
                
                returnToGoBack()
            }
        } while (choice != String(numberOfChoicesOfAction) && player.HP > 0)
    }
}
