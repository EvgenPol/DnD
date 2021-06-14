//
//  Items.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 14.06.2021.
//

import Foundation
class Ammunition: Item {
    var ammunition:Ammo
    enum Ammo {
        case arrow
        case blowgunNeedles
        case crossbowBolt
        case slingBullets
        var rawValue: (Double, Double) {
               switch self {
               case .arrow: return (5, 0.05)
               case .blowgunNeedles: return (2, 0.02)
               case .crossbowBolt: return (5, 0.075)
               case .slingBullets: return (0.2, 0.075)
               }
        }
    }
    init(ammunition: Ammo) {
        self.ammunition = ammunition
    }
}
