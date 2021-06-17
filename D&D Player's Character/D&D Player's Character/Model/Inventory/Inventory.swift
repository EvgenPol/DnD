//
//  Inventary.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 25.05.2021.
//

import Foundation

struct Inventory {
    var maxWeight = 0.0
    var currentWeight = 0.0
    var wealth = Wealth()
    var equipment = Equipment()
    var unEquipment = UnEquipment()
    
    func startEquipment (class:ClassBasis) {
        a
    }
}


extension Inventory {
    struct Wealth {
        var all: Double { Double(copperCoin/1000 + silver/100 + electrum/10 + gold + platinum*10) }
        var copperCoin = 0
        var silver = 0
        var electrum = 0
        var gold = 0
        var platinum = 0
    }
    struct Equipment {
        var leftHand:Item?
        var rightHand:Item?
        var armor:Armor?
    }
    struct UnEquipment {
        var backpack = [[Item]]()
    }
}
