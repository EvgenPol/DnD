//
//  ClassBasis.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 16.05.2021.
//

import Foundation

class ClassBasis {
    var level = 1
    var expirience:UInt = 0
    var hitDie:Dices!
    var ability = Ability()
    var tools:Tools!
    var skills:[Skills]!
    var savingThrowProficiencies:[String]!
    var primalAbilites:[String]!
    var armorProficiencies:[Any]!
    var weaponProficiencies:[Any]!
    var startEquipment:StartEquipment!
    
    var proficiencyBonus:Int {
        switch level {
        case 1...4:
            return 2
        case 5...8:
            return 3
        case 9...12:
            return 4
        case 13...16:
            return 5
        default:
            return 6
        }
    }

}
