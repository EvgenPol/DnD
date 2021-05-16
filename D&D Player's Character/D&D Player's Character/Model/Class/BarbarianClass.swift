//
//  BarbarianClass.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 16.05.2021.
//

import Foundation

class BarbarianClass: ClassBasis {
    var rage:Features = .rage
    var unarmoredDefence:Features!
    var recklessAttack:Features!
    var dangerSense:Features!
    var primalPath:Features!
    var extraAttack:Features!
    var fastMovement:Features!
    var feralInstinct:Features!
    var brutalCritical:Features!
    var persistentRage:Features!
    var indomitableMight:Features!
    var primalChampion:Features!
    
    var rageON = false
    var countRage = 2
    
    var damageRage:Int {
        switch level {
        case 1...8:
            return 2
        case 9...15:
            return 3
        default:
            return 4
        }
       
    }
    
    //Доделать
    func useFeatures(features:Features) {
        switch features {
        case .rage: rageON = true; countRage-=1
        default: break
        }
    }
    
    func restForRage(level:Int) {
        switch level {
        case 1,2: countRage = 2
        case 3...5: countRage = 3
        case 6...11: countRage = 4
        case 12...16: countRage = 5
        case 17...19: countRage = 6
        default: countRage = Int.max
        }
    }
    
    func nextLVL() {
        level+=1
        switch level {
        case 2:
        default:
            <#code#>
        }
        
    }
    
    init(startEquipment: StartEquipment, skills:[Skills]) {
        super.init()
        self.hitDie = .d12
        self.primalAbilites = ["strength"]
        self.savingThrowProficiencies = ["strength","constitution"]
        self.armorProficiencies = [Equipment.Armor.LightArmor.allCases,
                                   Equipment.Armor.MediumArmor.allCases,
                                   Equipment.shield]
        self.weaponProficiencies = [Equipment.Weapons.SimpleMeleeWeapons.allCases,
                                    Equipment.Weapons.SimpleRangedWeapons.allCases,
                                    Equipment.Weapons.MartialMeleeWeapons.allCases,
                                    Equipment.Weapons.MartialRangedWeapons.allCases]
        self.startEquipment = startEquipment
        self.skills = skills
    }
}
