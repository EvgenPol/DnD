//
//  Items.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 14.06.2021.
//

import Foundation
//MARK: Аммуниция
class Ammunition: Item {
    let ammunition:Ammo
    enum Ammo {
        case arrow
        case blowgunNeedles
        case crossbowBolt
        case slingBullets
        var rawValue: (cost:Double, weight:Double) {
               switch self {
               case .arrow: return (5, 0.05)
               case .blowgunNeedles: return (2, 0.02)
               case .crossbowBolt: return (5, 0.075)
               case .slingBullets: return (0.2, 0.075)
               }
        }
    }
    init(ammunition: Ammo) {
        var name = ""
        switch ammunition {
        case .arrow: name = "Стрела"
        case .blowgunNeedles: name = "Дротик для духового оружия"
        case .crossbowBolt: name = "Болт"
        case .slingBullets: name = "Снаряд для пращи"
        }
        super.init(name: name, cost: ammunition.rawValue.cost, weight: ammunition.rawValue.weight, description: "")
        self.ammunition = ammunition
    }
}
class OtherItems: Item {
    let item: Items
    enum Items {
        case abacus, acidVial, alchemistsFireFlask, antitoxinVial, backpack, ballBearings, barrel, basket, bedroll, bell ,blanket, blockAndTackle, book, bootle, glass, bucket, caltrops, candle, caseCrossbowBolt, caseMapOrScroll, chain, chalk, chest, climbersKit, clothesCommon, clothesCostume, clothesFine, clothesTraveler, componentPouch, crowbar, fishingTackle, flaskOfTankard, grapplingHook,hammer, hammerSledge, healersKit, holyWaterFlask, hourglass, huntingTrap, inkBotle, inkPen, jug, ladder, lamp,lanternBullseye,lanternHooded,lock,magnifyingGlass, manacles, messKit, mirrorSteel, oilFlask, paper, parchment, perfumeVial, pickMiners, piton, poisonBasicVial, pole, potIron, potionOfHealing, pouch, quiver, ramPortable,rations, robes,ropeHempen, ropeSilk, sack, scaleMerchants, sealingWax, shovel, signalWhistle, signetRing,soap,spellbook,         spikesIron, spyglass, tent, tinderbox, torch, vial, waterskin, whetstone
    }
    private init(item:Items, name:String, cost:Double,weight:Double, description:String){
        super.init(name: name, cost: cost, weight: weight, description: description)
        self.item = item
    }
}
//MARK: Стартовые паки
class Pack: Item {
    let pack:Packs
    enum Packs {
        case burglar
        case diplomat
        case dungeoneer
        case entertainer
        case explorer
        case priest
        case scholar
    }
    init(pack:Packs) {
        <#statements#>
    }
}
extension OtherItems {
    var rawValue: (name:String, cost:Double, weight:Double) {
        switch item {
        case .abacus: return ("Счёты", 2_00, 2)
        case .acidVial: return ("")
//        case .antitoxinVial: return ("Противоядие",50_00, 0.1)
        case .
            
        
    }
    
}
