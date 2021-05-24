//
//  Character.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 02.05.2021.
//

import Foundation

class Character {
    var race:RaceBasis!
    var `class`:ClassBasis!
    var hitPoints:Int!
    var maxHP:Int!
    var alignment:Alignment!
    var additionHP = 0
    var money = 0.0
    var armorClass = 10
    var personality:Personality!
    var background:Background!
    
    init() {
        
    }
}
