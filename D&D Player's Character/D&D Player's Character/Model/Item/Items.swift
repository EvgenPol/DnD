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
        //MARK: Задание
        //добавить в rawValue (name: String...), как в экстеншене OtherItems
        //
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
    //MARK:Задание
    //реализовать init как в Ammunition, посчитав цену и вес в книге игрока d&d на русском, "наборы экипировки" стр 151
    init(pack:Packs) {
        <#statements#>
    }
}


extension OtherItems {
    var rawValue: (name:String, cost:Double, weight:Double) {
        switch item {
        case .abacus: return ("Счёты", 2_000, 2)
        case .acidVial: return ("Кислота", 25_000, 1)
        case .alchemistsFireFlask: return ("Алхемический огонь", 50_000, 1)
        case .antitoxinVial: return ("Противоядие",50_000, 0.1)
        case .backpack: return ("Рюкзак", 2_000, 5)
        case .ballBearings: return ("Шарики(1000 в сумке)", 1_000, 2)
        case .barrel: return ("Бочка", 2_000, 70)
        case .basket: return ("Корзина", 4_00, 2)
        case .bedroll: return ("Постельные принадлежности", 1_000, 7)
        case .bell: return ("Колокольчик", 1_000, 0.1)
        case .blanket: return ("Одеяло", 5_00, 3)
        case .blockAndTackle: return ("Грузоподъемный блок", 1_000, 5)
        case .book: return ("Книга", 25_000, 5)
        case .bootle: return ("Бутылка", 2, 2)
        case .bucket: return ("Ведро", 5, 2)
        case .caltrops: return ("Шипы (20 в мешочке)", 1, 2)
        case .candle: return ("Свеча", 1, 0.1)
        case .caseCrossbowBolt: return ("Футляр для арбалетных болтов", 1_000, 1)
        case .caseMapOrScroll: return ("Футляр для карт или свитков", 1_000, 1)
        case .chain: return ("Цепь (10 футов)", 5_000, 10)
        case .chalk: return ("Пергамент (один лист)", 1, 0.1)
        case .chest: return ("Сундук", 5_000, 25)
        case .climbersKit: return ("Набор скалолаза", 25_000, 12)
        case .clothesCommon: return ("Обычная одежда", 5_000, 3)
        case .clothesCostume: return ("Официальная одежда", 5_000, 4)
        case .clothesFine: return ("Качественная одежда", 15_000, 6)
        case .clothesTraveler: return ("Одежда путешественника", 2_000, 4)
        case .componentPouch: return ("Мешочек для компонентов", 25_000, 12)
        case .crowbar: return ("Монтировка", 2_000, 5)
        case .fishingTackle: return ("Рыболовные снасти", 1_000, 4)
        case .flaskOfTankard: return ("Столовые приборы", 2, 1)
        case .glass: return ("Стакан", 2_000, 2)
        case .grapplingHook: return ("Крюк-кошка", 2_000, 4)
        case .hammer: return ("Молоток", 1_000, 3)
        case .hammerSledge: return ("Кувалда", 2_000, 10)
        case .healersKit: return ("Набор лекаря", 5_000, 3)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        case . : return ("", ,)
        }
    }
}

//MARK:Задание
//Добавить классы и вложенные в них перечисления arcane focus, druidic focus, holy symbols из списка придметов на 150стр, как в других классах

