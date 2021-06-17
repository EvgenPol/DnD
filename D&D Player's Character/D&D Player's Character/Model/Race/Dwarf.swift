//
//  RaceDwarf.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 02.05.2021.
//

import Foundation

class Dwarf:Race {
    init(subraces: Subraces) {
        let traits:[Traits] = [.darkvision,.dwarvenArmorTraining,.dwarvenCombatTraining, .dwarvenResilience,.dwarvenToughness,.stoneCunning]
        let languages:[Languages] = [.common, .dwarvish]
        let ownerTools:[Tools] = []
        
        super .init(name: "Дворф", age: 50...350, size: Size.medium, speed: 25, traits: traits, languages: languages, ownerTools: ownerTools, subraces: subraces, weight: 130...150, height: 4...5)
    }
}
