//
//  Race.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 02.05.2021.
//

import Foundation

class RaceBasis  {
    
    var names:String!
    var age:UInt!
    
    var size = SizeCharacter()
    var speed:Int!
    var traits:[Traits]!
    var languages:[Languages]!
    var ownerTools:[Tools]!
    var subraces:Subraces!
    
    struct SizeCharacter {
        var size:Size!
        var height:UInt!
        var weight:UInt!
    }
    
  
    
    
    init() {
        
    }
}
