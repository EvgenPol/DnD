//
//  ClassBasis.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 16.05.2021.
//

import Foundation

class ClassBasis {
    var level = 1
    
    var hitDie:Dices!
    
    var tools:Tools!
    var skills:[Skills]!
    var features:Features!
    var savingThrowProficiencies:[String]!
    var primalAbilites:[String]!
    var advantage:[String] = []
    var resistance:[String] = []
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
    
    func useFeatures(features:Features){ }
    
}
