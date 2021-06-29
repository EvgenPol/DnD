//
//  ClassBasis.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 16.05.2021.
//

import Foundation

class ClassBasis {
    
    let name:EnumClass
    var level = 1
    var features:[String:Features]
    let primaryAbility:[Ability]
    let skills:[Skills]
    let savingThrowProficiencies:[Ability]
    let toolsProficiencies:[Tools]
    let armorProficiencies:[Armor]
    let weaponProficiencies:[Weapon]
    var path:ClassPaths!
    //MARK: Преимущства, помехи и резисты есть у классов чар и классЧар, надо пересмотреть
    
    
    
    static func findClass(charClass:EnumClass) -> ClassBasis {
        switch charClass {
        case .barbarian: return BarbarianClass(skills: [])
        }
    }
        
    func nextLevel() {}
        
    func advantage() {}
    
  
    init(nameClass: EnumClass, features:[String:Features], primaryAbility:[Ability], skills:[Skills], savingThrowProficiencies:[Ability], toolsProficiencies:[Tools], armorProficiencies:[Armor], weaponProficiencies:[Weapon]) {
        name = nameClass
        self.features = features
        self.primaryAbility = primaryAbility
        self.skills = skills
        self.savingThrowProficiencies = savingThrowProficiencies
        self.toolsProficiencies = toolsProficiencies
        self.armorProficiencies = armorProficiencies
        self.weaponProficiencies = weaponProficiencies
    }
}

enum EnumClass {
    case barbarian
}


