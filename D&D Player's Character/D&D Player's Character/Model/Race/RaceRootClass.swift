//
//  Race.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 02.05.2021.
//

import Foundation

class Race {
    
    let name:String
    let age:ClosedRange<Int>
    let size:Size
    let speed:Int
    let traits:[Traits]
    let languages:[Languages]
    let ownerTools:[Tools]
    let subraces:Subraces
    let weight:ClosedRange<Int>
    let height:ClosedRange<Int>

    init (name:String, age:ClosedRange<Int>, size: Size, speed:Int, traits:[Traits], languages:[Languages], ownerTools:[Tools], subraces:Subraces, weight:ClosedRange<Int>, height:ClosedRange<Int>) {
        self.name = name
        self.age = age
        self.size = size
        self.speed = speed
        self.traits = traits
        self.languages = languages
        self.ownerTools = ownerTools
        self.subraces = subraces
        self.weight = weight
        self.height = height
    }
}
