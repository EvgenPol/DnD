//
//  HP and XP.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 21.06.2021.
//

import Foundation
struct HP {
    var current:UInt {didSet { current > max ? (self.current = max) : () } }
    var max:UInt
    var dice:[(classChar:EnumClass, countDices:Int, Dice: Dices)]
    var additional = UInt(0)
    
    mutating func addDice(charClass:EnumClass) {
        if dice.contains(where: { $0.classChar == charClass }) {
           let i = dice.firstIndex(where: {$0.classChar == charClass})!
            dice[i].countDices += 1
        } else {
            dice.append((charClass, 1, HP.findHitDice(charClass: charClass)))
        }
    }
    
    static func hitForLevel_1 (constitutionModifier:Int, charClass:EnumClass) -> UInt {
        UInt(Self.findHitDice(charClass: charClass).rawValue) + UInt(constitutionModifier)
    }
    
    static func findHitDice(charClass:EnumClass) -> Dices {
        switch charClass {
        case .barbarian: return .d12
        default:
            return .d100
            print("Eror static func findHitDice in HP")
        }
    }
}

struct XP {
    var level = 1
    var current = UInt(0)
    var requiredExp: UInt { requiredExpForLevelUp() }
    
    private func findProficiencyBonus() -> Int {
            switch level {
            case 0...4: return 2
            case 5...8: return 3
            case 9...12: return 4
            case 13...16: return 5
            default: return 6
            }
    }
    
    mutating func addExp(exp:UInt) {
        current += exp
    }
    
    private func requiredExpForLevelUp() -> UInt {
        switch level {
        case 1: return 300
        case 2: return 900
        case 3: return 2_700
        case 4: return 6_500
        case 5: return 14_000
        case 6: return 23_000
        case 7: return 34_000
        case 8: return 48_000
        case 9: return 64_000
        case 10: return 85_000
        case 11: return 100_000
        case 12: return 120_000
        case 13: return 140_000
        case 14: return 165_000
        case 15: return 195_000
        case 16: return 225_000
        case 17: return 265_000
        case 18: return 305_000
        case 19: return 355_000
        default: return 0
        }
    }
}

