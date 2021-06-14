//
//  Item.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 18.05.2021.
//

import Foundation

class Item {
    let id = UUID()
    let name: String
    let cost: Double
    let weight: Double
    let description: String
    init(name: String, cost: Double, weight: Double, description: String ) {
        self.name = name
        self.cost = cost
        self.weight = weight
        self.description = description
    }
}



