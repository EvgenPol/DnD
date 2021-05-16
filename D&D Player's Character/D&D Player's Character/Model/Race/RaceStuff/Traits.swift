//
//  Traits.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 16.05.2021.
//

import Foundation

enum Traits {
    //Dwarf
    case darkvision
    case dwarvenResilience
    case dwarvenCombatTraining
    case stoneCunning
    
    func useTrait() {
        switch self {
        case .darkvision:
            _ = 0
        case .dwarvenResilience:
            _ = 0
        case .dwarvenCombatTraining:
            _ = 0
        case .stoneCunning:
            _ = 0
        }
    }
}
