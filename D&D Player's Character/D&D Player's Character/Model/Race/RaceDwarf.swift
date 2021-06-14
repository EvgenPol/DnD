//
//  RaceDwarf.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 02.05.2021.
//

import Foundation

class RaceDwarf:RaceBasis {
    static var maxAge = 360
    
    init(age:UInt, height:UInt, weight:UInt, additionLanguage:Languages?, subrace:Subraces ) {
        super .init()
        
        self.age = age
        self.speed = 25
        self.size.size = .medium
        self.size.height = height
        self.size.weight = weight
        self.languages = [.common, .dwarvish]
        self.subraces = subrace
        
        self.ownerTools = [.brewer,
                           .mason,
                           .smith
        ]
      
        
        
        self.traits = [.darkvision,
                       .dwarvenResilience,
                       .dwarvenCombatTraining,
                       .stoneCunning
        ]
        if (additionLanguage != nil) {
            languages.append(additionLanguage!)
        }
    }
}
