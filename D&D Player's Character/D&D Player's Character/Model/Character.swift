//
//  Character.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 02.05.2021.
//

import Foundation

//Безоружная атака это simple melee
class Character {
    var level = 1
    let race:RaceBasis
    var classOfChar:[ClassBasis]
    var hitDices:[Int:Dices]
    var expirience:UInt = 0
    var hitPoints = 0
    var maxHP = 0
    var advantage:Bool
    var disadvanrage:Bool
    var resistance:[String]
    var ability = Ability()
    var alignment:Alignment
    var additionHP = 0
    let resistance:[String]
    var armorClass:Int { 0 }
    var inventory = Inventory()
        
    
    var personality:Personality!
    var background:Background!
    var proficiencyBonus:Int {
        switch level {
        case 1...4: return 2
        case 5...8: return 3
        case 9...12: return 4
        case 13...16: return 5
        default: return 6
        }
    }
    
    func modifier(parametr:Ability) -> Int {
        
    }
    
    
    func useFeaturesOfClass(features:Features) {
        classOfChar.useFeatures(features:features)
    }
    
    func useTraitOfRace() {
    }
    
    func updateStatsCharacter() {
        self.advantage = classOfChar.advantage
        self.resistance = classOfChar.resistance
    }
    
    func findDefence () -> Int {
        var defence = 0
        for `class` in classOfChar {
            //Обрабатывает случай когда умение бездоспешная защита Варвара действует
            if `class` is BarbarianClass && `class`.features.contains(where: {$0 is UnarmoredDefence}) && inventory.equipment.armor == nil {
                // проверка на наличие щита
                ((inventory.equipment.leftHand is Shield) || (inventory.equipment.rightHand is Shield)) ? (defence = 2) : (defence = 0)
                defence += 10 + modifier(parametr: .dexterity) + modifier(parametr: .constitution)
            }
        }
        return defence
    }
    init() {
        
    }
    
    func physicalAttackImprovised (anotherChar: Character, characteristic: (Int, TypeOfDamage)) {
        
    }
    func physicalAttackWeapon (anotherChar: Character, item: Item) {
        let weapon = item as! Weapon
        var damage = weapon.damage
        
    }
        
        private func physicalAttack () -> Int {
            
        }
    
    func massAttack () {
        
    }
}
