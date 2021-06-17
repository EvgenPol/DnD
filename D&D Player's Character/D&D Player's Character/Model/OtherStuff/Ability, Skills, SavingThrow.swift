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
