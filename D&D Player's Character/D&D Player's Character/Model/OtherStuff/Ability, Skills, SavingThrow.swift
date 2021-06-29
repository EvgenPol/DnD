//
//  Ability.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 16.05.2021.
//

import Foundation

struct AbilityChar {
    
    var strenght:UInt8 = 0
    var dexterity:UInt8 = 0
    var constitution:UInt8 = 0
    var intelligence:UInt8 = 0
    var wisdom:UInt8 = 0
    var charisma:UInt8 = 0
    var freePoints = 0
    
    func modifier (parametr: Ability) -> Int {
        switch parametr {
        case .charisma: return calculateModifier(charisma)
        case .constitution: return calculateModifier(constitution)
        case .dexterity: return calculateModifier(dexterity)
        case .intelligence: return calculateModifier(intelligence)
        case .strenght: return calculateModifier(strenght)
        case .wisdom: return calculateModifier( wisdom )
        }
    }
    
    mutating func addPointTo(_ parametr: Ability) {
        guard freePoints > 0 else { return }
        switch parametr {
        case .strenght: guard strenght < 20 else { break }; strenght += 1
        case .dexterity: guard dexterity < 20 else { break }; dexterity += 1
        case .constitution: guard constitution < 20 else { break }; constitution += 1
        case .intelligence: guard intelligence < 20 else { break }; intelligence += 1
        case .wisdom: guard wisdom < 20 else { break }; wisdom += 1
        case .charisma: guard charisma < 20 else { break }; charisma += 1
        }
        
    }
    
    private func calculateModifier(_ parametrValue: UInt8) -> Int {
        switch parametrValue {
        case 1: return -5
        case 2...3: return -4
        case 4...5: return -3
        case 6...7: return -2
        case 8...9: return -1
        case 10...11: return 0
        case 12...13: return 1
        case 14...15: return 2
        case 16...17: return 3
        case 18...19 : return 4
        case 20...21 : return 5
        case 22...23 : return 6
        case 24...25 : return 7
        case 26...27 : return 8
        case 28...29 : return 9
        default: return 10
        }
    }
}
enum Ability {
    case strenght, dexterity, constitution, intelligence, wisdom, charisma
}

enum Skills {
        //Strenght
    case athletics
        //Dexterity
    case acrobatics, sleightOHand ,stealth
        //Intelligence
    case arcana, History, investigation, nature ,religion
        //Wisdom
    case animalHandling, insight, medicine, perception, survival
        //Charisma
    case deception, intimidation, performance, persuasion
}
