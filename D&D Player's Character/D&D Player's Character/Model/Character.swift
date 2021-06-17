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
    var armorClass = 10
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
    
    func modifier(parametr:String) -> Int {
        
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
    
    
    init() {
        
    }
}
