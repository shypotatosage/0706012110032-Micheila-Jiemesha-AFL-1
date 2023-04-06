//
//  PlayerProtocol.swift
//  0706012110032-Micheila Jiemesha-AFL 1
//
//  Created by MacBook Pro on 06/04/23.
//

import Foundation

protocol PlayerProtocol {
    
    // Menghitung Bonus HP Dari Equipments Yang Dimiliki User
    func equipmentHPBonus() -> Int
    
    // Menghitung Bonus MP Dari Equipments Yang Dimiliki User
    func equipmentMPBonus() -> Int
    
    // Menghitung Bonus Attack Dari Equipments Yang Dimiliki User
    func equipmentAttackBonus() -> Int
    
    // Function Ketika User Memilih Untuk Membeli Health Potion/Elixir
    func buyPotion(amount: Int, type: Int)
    
    // Function Ketika User Memilih Untuk Menggunakan Health Potion/Elixir
    func usePotion(type: Int)
    
    // Function Ketika User Memilih Untuk Membeli Equipment
    func buyEquipment(equipment: Equipment)
    
    // Function Untuk Mempersingkat Coding Karena Banyak Penggunaan Return To Go Back
    func returnToGoBack()
    
    // Function Ketika User Memilih Untuk Melihat Statsnya
    func showStats()
    
    // Function Tampilan Ketika User Memilih Untuk Masuk Ke Menu Heal
    func healingScreen()
    
    // Function Tampilan Ketika User Memilih Untuk Masuk Ke Menu Recover Mana
    func recoverManaScreen()
    
    // Function Ketika User Memilih Untuk Menyerang/Menggunakan Skillnya Ke Enemy
    func useAction(actionIndex: Int) -> Int
}
