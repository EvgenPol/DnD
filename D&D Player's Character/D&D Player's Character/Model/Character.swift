//
//  Character.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 02.05.2021.
//

import Foundation

class Character {
    var race:RaceBasis!
    var classOfChar:ClassBasis!
    var expirience:UInt = 0
    var hitPoints:Int!
    var maxHP:Int!
    var advantage:[String] = []
    var resistance:[String] = []
    var ability = Ability()
    var alignment:Alignment!
    var additionHP = 0
    var money = 0.0
    var damage = 0
    var armorClass = 10
    var personality:Personality!
    var background:Background!
    
    func useFeatures(features:Features) {
        classOfChar.useFeatures(features:features)
    }
    
    func updateStatsCharacter() {
        self.advantage = classOfChar.advantage
        self.resistance = classOfChar.resistance
    }
    
    
    init() {
        
    }
}
