//
// Dices.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 16.05.2021.
//

import Foundation

enum Dices: UInt32 {
    case d100 = 100
    case d20 = 20
    case d12 = 12
    case d10 = 10
    case d8 = 8
    case d6 = 6
    case d4 = 4
    
   static func throwing(cast:Int, dice:Dices) -> Int {
        var result = 0
        for _ in 1...cast {
            result += Int(arc4random_uniform(dice.rawValue)) + 1
        }
        return result
    }
}

enum Money: String {
    case copper = "Медь"
    case silver = "Серебро"
    case electrum = "Электрум"
    case gold = "Золото"
    case platinum = "Платина"
}






