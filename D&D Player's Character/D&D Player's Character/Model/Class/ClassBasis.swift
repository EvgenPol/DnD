//
//  ClassBasis.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 16.05.2021.
//

import Foundation

class ClassBasis {
    
    var level = 1
    let hitDie:Dices
    let features:[Features]
    let primaryAbility:[Ability]
    let skills:[Skills]
    let savingThrowProficiencies:[Ability]
    let toolsProficiencies:[Tools]
    let armorProficiencies:[Armor]
    let weaponProficiencies:[Weapon]
    let path:ClassPaths!
    //MARK: Преимущства, помехи и резисты есть у классов чар и классЧар, надо пересмотреть
    var advantage = [String]()
    var disadvantage = [String]()
    var resistance = [TypeOfDamage]()
    
    func damage (condition: [() -> Bool]) -> Int {
        0
    }
    func defense(condition: [() -> Bool]) -> Int {
        0
    }
    func useFeatures(condition: () -> Bool, feature: Features) {
      
    }
    
    func hitForLevel_1 (constitutionModifier:Int) -> Int {
        Dices.throwing(cast: 1, dice: hitDie) + constitutionModifier
    }
    
    func nextLevel () {}
    
    init(hitDie:Dices, features:[Features], primaryAbility:[Ability], skills:[Skills], savingThrowProficiencies:[Ability], toolsProficiencies:[Tools], armorProficiencies:[Armor], weaponProficiencies:[Weapon]) {
        self.hitDie = hitDie
        self.features = features
        self.primaryAbility = primaryAbility
        self.skills = skills
        self.savingThrowProficiencies = savingThrowProficiencies
        self.toolsProficiencies = toolsProficiencies
        self.armorProficiencies = armorProficiencies
        self.weaponProficiencies = weaponProficiencies
    }
}
