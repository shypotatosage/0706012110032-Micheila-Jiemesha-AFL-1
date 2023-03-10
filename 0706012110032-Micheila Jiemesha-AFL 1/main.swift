//
//  main.swift
//  0706012110032-Micheila Jiemesha-AFL 1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var start: String = ""
var mainChoice: String = ""
var HP: Int = 100
var MP: Int = 50
//var potion: Int = 20
var elixir: Int = 5
var potions = ["Potion": 20, "Elixir": 5]
let monsterName: [String] = ["Troll", "Golem"]
let maxHP: Int = 100
let maxMP: Int = 50
var monsterHP: [Int] = [1000, 1000]
var skillStack = Set<String>()
var money: Int = 0
let price = ["Potion": 35, "Elixir": 50]

// Functions
// ==========================================================================================
func chooseAction() {
    print("""
    
    ❤️ Your HP: \(HP)
    ⚡️ Your MP: \(MP)
    💰 Your Money: \(money)
    
    Choose your action:
    [1] Physical Attack. No mana required. Deal 5pt of damage.
    [2] Meteor. Use 15pt of MP. Deal 50pt of damage.
    [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
    
    [4] Use Potion to heal wound.
    [5] Use Elixir to recover mana.
    [6] Scan enemy's vital.
    [7] Flee from battle.
    
    """)
}

func enemyVital(monster: Int) {
    print("""
    
    😈 Name: \(monsterName[monster]) x1
    😈 Health: \(monsterHP[monster])
    """)
    
    returnToGoBack()
}

func monsterScreenPrint(monster: Int) {
    print("")
    
    if (monster == 0) {
        print("""
        As you enter the forest, you feel a sense of unease wash over you.
        Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.
        
        """)
    } else {
        print("""
        As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin. Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.
        
        """)
    }
    
    print("""
    😈 Name: \(monsterName[monster]) x1
    😈 Health: \(monsterHP[monster])
    
    """)
}

func returnToGoBack() {
    var returnChoice: String = ""
    
    repeat {
        print("Press [return] to go back: ", terminator: "")
        
        returnChoice = readLine()!
    } while returnChoice != ""
}

func healing() {
    HP += 20
    potions["Potion"]! -= 1
    
    if (HP > maxHP) {
        HP = maxHP
    }
}

func recoverMana() {
    MP += 10
    potions["Elixir"]! -= 1
    
    if (MP > maxMP) {
        MP = maxMP
    }
}

func recoverManaScreen() {
    var manaChoice: String = ""
    
    if potions["Elixir"]! > 0 && MP < maxMP {
        print("""
        \nYour MP is \(MP).
        You have \(potions["Elixir"]!) Elixirs.
        
        """)
        
        repeat {
            print("Are you sure you want to use 1 elixir to recover mana? [Y/N] ", terminator: "")
            
            manaChoice = readLine()!
        } while manaChoice.lowercased() != "y" && manaChoice.lowercased() != "n"
        
        if (manaChoice.lowercased() == "y") {
            recoverMana()
            
            repeat {
                if potions["Elixir"]! > 0 && MP < maxMP {
                    print("""
                    \nYour MP is \(MP) now.
                    You have \(potions["Elixir"]!) Elixirs left.
                    
                    """)
                    
                    repeat {
                        print("Still want to use 1 elixir to recover mana again? [Y/N] ", terminator: "")
                        
                        manaChoice = readLine()!
                    } while manaChoice.lowercased() != "y" && manaChoice.lowercased() != "n"
                    
                    if (manaChoice.lowercased() == "y") {
                        recoverMana()
                    }
                } else if potions["Elixir"]! < 0 {
                    print("\nYou don't have any elixir left. Be careful of your next journey.")
                    
                    repeat {
                        print("Press [return] to go back: ", terminator: "")
                        
                        manaChoice = readLine()!
                    } while manaChoice != ""
                } else {
                    print("\nYour mana is already maxed.")
                    
                    repeat {
                        print("Press [return] to go back: ", terminator: "")
                        
                        manaChoice = readLine()!
                    } while manaChoice != ""
                }
            } while manaChoice.lowercased() != "n" && manaChoice != ""
        }
    } else if potions["Elixir"]! < 0 {
        print("\nYou don't have any elixir left. Be careful of your next journey.")
        
        returnToGoBack()
    } else {
        print("\nYour mana is already maxed.")
        
        returnToGoBack()
    }
}

func healingScreen() {
    var healingChoice: String = ""
    
    if potions["Potion"]! > 0 && HP < maxHP {
        print("""
        \nYour HP is \(HP).
        You have \(potions["Potion"]!) Potions.
        
        """)
        
        repeat {
            print("Are you sure you want to use 1 potion to heal wound? [Y/N] ", terminator: "")
            
            healingChoice = readLine()!
        } while healingChoice.lowercased() != "y" && healingChoice.lowercased() != "n"
        
        if (healingChoice.lowercased() == "y") {
            healing()
            
            repeat {
                if potions["Potion"]! > 0 && HP < maxHP {
                    print("""
                    \nYour HP is \(HP) now.
                    You have \(potions["Potion"]!) Potions left.
                    
                    """)
                    
                    repeat {
                        print("Still want to use 1 potion to heal wound again? [Y/N] ", terminator: "")
                        
                        healingChoice = readLine()!
                    } while healingChoice.lowercased() != "y" && healingChoice.lowercased() != "n"
                    
                    if (healingChoice.lowercased() == "y") {
                        healing()
                    }
                } else if potions["Potion"]! < 0 {
                    print("\nYou don't have any potion left. Be careful of your next journey.\n")
                    
                    repeat {
                        print("Press [return] to go back: ", terminator: "")
                        
                        healingChoice = readLine()!
                    } while healingChoice != ""
                } else {
                    print("\nYour health is already maxed.\n")
                    
                    repeat {
                        print("Press [return] to go back: ", terminator: "")
                        
                        healingChoice = readLine()!
                    } while healingChoice != ""
                }
            } while healingChoice.lowercased() != "n" && healingChoice != ""
        }
    } else if potions["Potion"]! < 0 {
        print("\nYou don't have any potion left. Be careful of your next journey.\n")
        
        returnToGoBack()
    } else {
        print("\nYour health is already maxed.\n")
        
        returnToGoBack()
    }
}

func physicalAttack(monster: Int) {
    monsterHP[monster] -= 5
    
    print("\n*Kapowwww*")
    print("You have dealt 5 damage to the \(monsterName[monster])\n")
}

func meteor(monster: Int) {
    if (MP < 15) {
        print("""
        
        You don't have enough MP to use this skill.
        
        """)
    } else {
        MP -= 15
        monsterHP[monster] -= 50
        
        print("""
        
        *Boommm!*
        You have used 'Meteor' skill which consumed 15 MP and dealt 50 damage to the \(monsterName[monster])
        
        """)
    }
}

func shield(monster: Int) {
    if (MP < 10) {
        print("""
        
        You don't have enough MP to use this skill.
        
        """)
    } else {
        MP -= 10
        skillStack.insert("Shield")
        
        print("""
        
        *Shriiing!*
        You have used 'Shield' skill which consumed 10 MP and will protect you from the \(monsterName[monster])s attack for 1 turn.
        
        """)
    }
}

func checkSkillStack() -> String {
    if (skillStack.contains("Shield")) {
        return "Skip"
    }
    
    return "None"
}

func enemyAttack(monster: Int) {
    if (checkSkillStack() == "Skip") {
        print("\nThe \(monsterName[monster]) jumps to your face, yet you succeeded to block his attacks with your shield.\n")
        
        skillStack.remove("Shield")
    } else {
        let damage = Int.random(in: 1..<5)
        HP -= damage
        
        if (damage < 3) {
            print("\nThe \(monsterName[monster]) throws a huge rock at your way, yet you managed to smash the rock, but the shards still managed to scratch you making your health decrease by \(damage).\n")
        } else {
            print("\nThe \(monsterName[monster]) swiftly moves towards your back and slashed your body with a sharp rock making your health decrease by \(damage).\n")
        }
    }
}

func monsterAttackScreen(monster: Int) {
    var choice: String = ""
    var turn: Int = 0
    
    monsterScreenPrint(monster: monster)
    
    repeat {
        if turn % 2 == 0 {
            var choiceRepeat: Bool = false
            
            chooseAction()
            
            repeat {
                print("Your choice? ", terminator: "")
                choice = readLine()!
                
                if (choice.range(of: "[^1-7]", options: .regularExpression) == nil) {
                    if (Int(choice)! < 1 || Int(choice)! > 7) {
                        choiceRepeat = true
                    } else {
                        choiceRepeat = false
                    }
                } else {
                    choiceRepeat = true
                }
            } while choiceRepeat
            
            switch choice {
            case "1":
                physicalAttack(monster: monster)
            case "2":
                meteor(monster: monster)
            case "3":
                shield(monster: monster)
            case "4":
                healingScreen()
            case "5":
                recoverManaScreen()
            case "6":
                enemyVital(monster: monster)
            case "7":
                print("""
                
                You feel that if you don't escape soon, you won't be able to continue the fight.
                You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.
                
                You're safe, for now.
                
                """)
                
                returnToGoBack()
            default:
                print()
            }
        } else {
            enemyAttack(monster: monster)
        }
        
        if (choice != "6") {
            turn += 1
        }
    } while choice != "7" && monsterHP[monster] > 0
    
    monsterHP[monster] = 1000
}

func shopScreen() {
    var choice: String = ""
    var choiceRepeat: Bool = false
    
    print("""
    Welcome to the shop! ✨ Here you can buy potions such as elixir and potion to help you during your journey.
    
    [0] Back
    [1] Potion (35 Coins)
    [2] Elixir (50 Coins)
    
    """)
    
    repeat {
        print("Your choice? ", terminator: "")
        choice = readLine()!
        
        if (choice.range(of: "[^0-2]", options: .regularExpression) == nil) {
            if (Int(choice)! < 0 || Int(choice)! > 2) {
                choiceRepeat = true
            } else {
                choiceRepeat = false
            }
        } else {
            choiceRepeat = true
        }
    } while choiceRepeat
    
    switch choice {
    case "1":
        var amount: Int = 0
        var buy: Bool = false
        var temp: String = ""
        
        repeat {
            print("Howmany would you like to buy? ([0] Back) ", terminator: "")
            temp = readLine()!
            
            if (temp.range(of: "[^0-9]", options: .regularExpression) != nil) {
                buy = false
            } else {
                if (Int(temp)! < 0) {
                    buy = false
                } else {
                    buy = true
                }
            }
        } while !buy
        
        amount = Int(temp)!
        
        if (amount > 0) {
            if (money >= (price["Potion"]! * amount)) {
                potions["Potion"]! += amount
                money -= price["Potion"]! * amount
            } else {
                print("\nYour money is not enough.\n")
            }
        }
    case "2":
        var amount: Int = 0
        var buy: Bool = false
        var temp: String = ""
        
        repeat {
            print("Howmany would you like to buy? ([0] Back) ", terminator: "")
            temp = readLine()!
            
            if (temp.range(of: "[^0-9]", options: .regularExpression) != nil) {
                buy = false
            } else {
                if (Int(temp)! < 0) {
                    buy = false
                } else {
                    buy = true
                }
            }
        } while !buy
        
        amount = Int(temp)!
        
        if (amount > 0) {
            if (money >= (price["Elixir"]! * amount)) {
                potions["Elixir"]! += amount
                money -= price["Elixir"]! * amount
            } else {
                print("\nYour money is not enough.\n")
            }
        }
    default:
        print()
    }
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
} while start != ""

var userName: String = ""

print()

repeat {
    print("May I know your name, a young wizard? ", terminator: "")
    userName = readLine()!
} while userName.trimmingCharacters(in: .whitespacesAndNewlines) == "" || (userName.range(of: "[^a-zA-Z]", options: .regularExpression) != nil)

print("\nNice to meet you \(userName)!")

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
    [Q]uit game

    """)
    
    repeat {
        print("Your choice? ", terminator: "")
        
        mainChoice = readLine()!
    } while (mainChoice.lowercased() == "c" || mainChoice.lowercased() == "h" || mainChoice.lowercased() == "f" || mainChoice.lowercased() == "m" || mainChoice.lowercased() == "q" ||  mainChoice.lowercased() == "r" ||  mainChoice.lowercased() == "s") == false
    
    if (mainChoice.lowercased() == "c") {
        print("""
        Player Name: \(userName)
        
        HP: \(HP)/100
        MP: \(MP)/50
        Money: \(money)
        
        Magic:
        - Physical Attack. No mana required. Deal 5pt of damage.
        - Meteor. Use 15pt of MP. Deal 50pt of damage.
        - Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
        
        Items:
        - Potion x\(potions["Potion"]!). Heal 20pt of your HP
        - Elixir x\(elixir). Add 10pt of your MP.
        
        """)
        
        returnToGoBack()
    } else if (mainChoice.lowercased() == "h") {
        healingScreen()
    } else if (mainChoice.lowercased() == "f") {
        monsterAttackScreen(monster: 0)
    } else if (mainChoice.lowercased() == "m") {
        monsterAttackScreen(monster: 1)
    } else if (mainChoice.lowercased() == "r") {
        recoverManaScreen()
    } else if (mainChoice.lowercased() == "s") {
        shopScreen()
    }
} while mainChoice.lowercased() != "q" && HP > 0

if (HP <= 0) {
    print("\nToo bad... ")
} else {
    print("")
}
