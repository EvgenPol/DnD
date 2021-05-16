//
//  Features.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 16.05.2021.
//

import Foundation

enum Features {
    
    //Features Barbarian
    case rage
    case unarmoredDefence
    case recklessAttack
    case dangerSense
    case primalPath
    case extraAttack
    case fastMovement
    case feralInstinct
    case brutalCritical
    case persistentRage
    case indomitableMight
    case primalChampion
    //Features Barbarian for Primal Path
    case frenzy
    case mindlessRage
    case intimidatingPresence
    case retaliation
    case spiritSeeker
    case totemSpirit (beastOfBarbarian)
    case aspectOfTheBeast (beastOfBarbarian)
    case spiritWalker
    case totemicAttunement (beastOfBarbarian)
    //Enum beast for Barbarian Totem Warior
    enum beastOfBarbarian {
        case bear
        case eagle
        case wolf
    }
    
}
