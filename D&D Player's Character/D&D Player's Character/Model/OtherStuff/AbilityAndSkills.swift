//
//  Ability.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 16.05.2021.
//

import Foundation

struct Ability {
    
    
    var strenght:UInt = 0
    var dexterity:UInt = 0
    var constitution:UInt = 0
    var intelligence:UInt = 0
    var wisdom:UInt = 0
    var charisma:UInt = 0
    
    
}



enum Skills {
    //Strenght
    case athletics
    //Dexterity
    case acrobatics
    case sleightOHand
    case stealth
    //Intelligence
    case arcana
    case History
    case investigation
    case nature
    case religion
    //Wisdom
    case animalHandling
    case insight
    case medicine
    case perception
    case survival
    //Charisma
    case deception
    case intimidation
    case performance
    case persuasion
}
