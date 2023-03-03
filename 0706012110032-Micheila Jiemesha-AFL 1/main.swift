//
//  main.swift
//  0706012110032-Micheila Jiemesha-AFL 1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var start: String? = ""

repeat {
    print("""
    Welcome to the world of magic! 🧙🏻‍♂️🧌

    You have been chose to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventures will take you through forests 🌲, mountains ⛰️, and dungeons 🏰, where you will face challenges, make allies, and fight enemies.

    Press [return] to continue:
    """, terminator: " ")
    
    start = readLine()
} while start != ""

var userName: String = ""

print()

repeat {
    print("May I know your name, a young wizard? ", terminator: "")
    userName = readLine()!
} while userName.trimmingCharacters(in: .whitespacesAndNewlines) == "" || (userName.range(of: "[^a-zA-Z]", options: .regularExpression) != nil)

print("\nNice to meet you \(userName)!")


var choice: String = ""
var HP: Int = 100
var MP: Int = 50
var potion: Int = 20
var elixir: Int = 5

repeat {
    print("\nFrom here, you can...")
    
    print("""
    \n[C]heck your health and stats
    [H]eal your wounds with potion

    ...or choose where you want to go

    [F]orest of Troll
    [M]ountain of Golem
    [Q]uit game

    """)
    
    repeat {
        print("Your choice? ", terminator: "")
        
        choice = readLine()!
    } while (choice.lowercased() == "c" || choice.lowercased() == "h" || choice.lowercased() == "f" || choice.lowercased() == "m" || choice.lowercased() == "q") == false
    
    if (choice.lowercased() == "c") {
        var cchoice: String = ""
        
        print("""
        Player Name: \(userName)
        
        HP: \(HP)/100
        MP: \(MP)/50
        
        Magic:
        - Physical Attack. No mana required. Deal 5pt of damage.
        - Meteor. Use 15pt of MP. Deal 50pt of damage.
        - Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
        
        Items:
        - Potion x\(potion). Heal 20pt of your HP
        - Elixir x\(elixir). Add 10pt of your MP.
        
        """)
        
        repeat {
            print("Press [return] to go back: ", terminator: "")
            
            cchoice = readLine()!
        } while cchoice != ""
    } else if (choice.lowercased() == "h") {
        var hchoice: String = ""
        
        if potion > 0 {
            print("""
            \nYour HP is \(HP).
            You have \(potion) Potions.
            
            """)
            
            repeat {
                print("Are you sure you want to use 1 potion to heal wound? [Y/N] ", terminator: "")
                
                hchoice = readLine()!
            } while hchoice.lowercased() != "y" && hchoice.lowercased() != "n"
            
            if (hchoice.lowercased() == "y") {
                HP += 20
                potion -= 1
                
                if (HP > 100) {
                    HP = 100
                }
            }
            
            while hchoice.lowercased() != "n" {
                print("""
                \nYour HP is \(HP) now.
                You have \(potion) Potions left.
                
                """)
                
                repeat {
                    print("Still want to use 1 potion to heal wound again? [Y/N] ", terminator: "")
                    
                    hchoice = readLine()!
                } while hchoice.lowercased() != "y" && hchoice.lowercased() != "n"
            }
        } else {
            print("You don't have any potion left. Be careful of your next journey.")
            
            repeat {
                print("Press [return] to go back: ", terminator: "")
                
                hchoice = readLine()!
            } while hchoice != ""
        }
    } else if (choice.lowercased() == "f") {
        var fchoice: String = ""
        
        print("""
        As you enter the forest, you feel a sense of unease wash over you.
        Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.
        
        😈 Name: Troll x1
        😈 Health: 1000
        
        Choose your action:
        [1] Physical Attack. No mana required. Deal 5pt of damage.
        [2] Meteor. Use 15pt of MP. Deal 50pt of damage.
        [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
        
        [4] Use Potion to heal wound.
        [5] Scan enemy's vital.
        [6] Flee from battle.
        
        """)
        
        repeat {
            print("Your choice? ", terminator: "")
            fchoice = readLine()!
        } while fchoice.range(of: "[^1-6]", options: .regularExpression) != nil
        
        if (fchoice == "6") {
            print("""
            \nYou feel that if you don't escape soon, you won't be able to continue the fight.
            You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.
            
            You're safe, for now.
            """)
            
            repeat {
                print("Press [return] to go back: ", terminator: "")
                
                fchoice = readLine()!
            } while fchoice != ""
        }
    } else if (choice.lowercased() == "m") {
        var mchoice: String = ""
        
        print("""
        As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin. Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.
        
        😈 Name: Golem x1
        😈 Health: 1000
        
        Choose your action:
        [1] Physical Attack. No mana required. Deal 5pt of damage.
        [2] Meteor. Use 15pt of MP. Deal 50pt of damage.
        [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
        
        [4] Use Potion to heal wound.
        [5] Scan enemy's vital.
        [6] Flee from battle.
        
        """)
        
        repeat {
            print("Your choice? ", terminator: "")
            mchoice = readLine()!
        } while mchoice.range(of: "[^1-6]", options: .regularExpression) != nil
        
        if (mchoice == "6") {
            print("""
            \nYou feel that if you don't escape soon, you won't be able to continue the fight.
            You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.
            
            You're safe, for now.
            """)
            
            repeat {
                print("Press [return] to go back: ", terminator: "")
                
                mchoice = readLine()!
            } while mchoice != ""
        }
    }
} while choice.lowercased() != "q"
