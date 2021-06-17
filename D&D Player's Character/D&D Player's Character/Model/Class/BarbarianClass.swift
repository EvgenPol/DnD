//
//  BarbarianClass.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 16.05.2021.
//

import Foundation

class BarbarianClass: ClassBasis {
    
   override func nextLevel() {
        level+=1
        switch level {
        case 2: 
        default:
            <#code#>
        }
    }
    
    init(skills:[Skills]) {
        let armorProficiencies = [LightArmor.getAllSubclasses(), MediumArmor.getAllSubclasses(), Shield.getAllSubclasses()]
        let weaponProficiencies = [Weapon.getSimpleWeapon(), Weapon.getMartialWeapon()]
        super.init(hitDie: Dices.d12, features: [Rage()], primaryAbility: [Ability.strenght], skills: skills, savingThrowProficiencies: [Ability.strenght, .constitution], toolsProficiencies: [], armorProficiencies: armorProficiencies, weaponProficiencies: weaponProficiencies )
    }
    
}
