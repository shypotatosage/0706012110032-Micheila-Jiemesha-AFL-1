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

print("\nFrom here, you can...")

var choice: String = ""

repeat {
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
    
    
} while choice.lowercased() != "q"
