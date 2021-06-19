//
//  Features.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 16.05.2021.
//

import Foundation

class Features: RangeReplaceableCollection {
    typealias SubSequence = String
    
    let name:String
    
    //static func for increase parametrs on 4,8,12,16,19 levels
    static func abilityScoreImprovement() -> Int { 2 }
    
    init(name:String) {
        self.name = name
    }
}

