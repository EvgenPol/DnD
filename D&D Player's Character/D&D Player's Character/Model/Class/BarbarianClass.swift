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
            features += ["UnarmoredDefence": UnarmoredDefence()]
            
        
        default:
            
        }
    }
    // принимает массив доп условий - замыканий, 0 - носит ли персонаж броню, для умения Rage
    override func damage(condition: [() -> Bool]) -> Int {
        var total = 0
        let rage = features["Rage"] as! Rage
        (rage.enabled && condition[0]() ) ? (total += rage.damage) : ()
    }
    
    override func defense(condition: [() -> Bool]) -> Int {
    
    }
    
    
    
    //MARK:Проверка по спасброскам и броскам по параметрам одинакова!
    private func useRage() {
        let rage = features["Rage"] as! Rage
        if rage.enabled {
            rage.enabled = false
            advantage.remove(at: advantage.firstIndex(of: "strenght")!)
            resistance.remove(at: resistance.firstIndex(of: .piercing)!)
            resistance.remove(at: resistance.firstIndex(of: .slashing)!)
            resistance.remove(at: resistance.firstIndex(of: .bludgeoning)!)
        } else if rage.count > 0 {
            rage.count -= 1
            advantage += ["strenght"]
            resistance += [.piercing,.slashing,.bludgeoning]
            rage.enabled = true
        }
    }
    
    private func useRecklessAttack() {
        let recklessAttack = features["RecklessAttack"] as! RecklessAttack
        (recklessAttack.reckless) ? (recklessAttack.reckless = false) : (recklessAttack.reckless = true)
    }

    override func useFeatures(condition: () -> Bool, feature: Features) {
        switch feature {
        case is Rage: useRage()
        case is RecklessAttack: useRecklessAttack()
        case is 
        }
    }
    
    init(skills:[Skills]) {
        let armorProficiencies = [LightArmor.getAllSubclasses(), MediumArmor.getAllSubclasses(), Shield.getAllSubclasses()]
        let weaponProficiencies = [Weapon.getSimpleWeapon(), Weapon.getMartialWeapon()]
        super.init(hitDie: Dices.d12, features: ["Rage": Rage()], primaryAbility: [Ability.strenght], skills: skills, savingThrowProficiencies: [Ability.strenght, .constitution], toolsProficiencies: [], armorProficiencies: armorProficiencies, weaponProficiencies: weaponProficiencies )
    }
    
}
