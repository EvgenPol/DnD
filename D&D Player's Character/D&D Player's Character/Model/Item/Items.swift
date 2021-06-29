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
        var rawValue: (name: String, cost:Double, weight:Double) {
               switch self {
               case .arrow: return ("Стрела", 5, 0.05)
               case .blowgunNeedles: return ("Иглы для духового оружия", 2, 0.02)
               case .crossbowBolt: return ("Арбалетные болты",  5, 0.075)
               case .slingBullets: return ("Шарики для пращи",  0.2, 0.075)
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
        self.ammunition = ammunition
        super.init(name: name, cost: ammunition.rawValue.cost, weight: ammunition.rawValue.weight, description: "")
    }
}
class OtherItems: Item {
    let item: Items
    enum Items {
        case abacus, acidVial, alchemistsFireFlask, antitoxinVial, backpack, ballBearings, barrel, basket, bedroll, bell ,blanket, blockAndTackle, book, bootle, glass, bucket, caltrops, candle, caseCrossbowBolt, caseMapOrScroll, chain, chalk, chest, climbersKit, clothesCommon, clothesCostume, clothesFine, clothesTraveler, componentPouch, crowbar, fishingTackle, flaskOfTankard, grapplingHook,hammer, hammerSledge, healersKit, holyWaterFlask, hourglass, huntingTrap, inkBotle, inkPen, jug, ladder, lamp, lanternBullseye, lanternHooded, lock, magnifyingGlass, manacles, messKit, mirrorSteel, oilFlask, paper, parchment, perfumeVial, pickMiners, piton, poisonBasicVial, pole, potIron, potionOfHealing, pouch, quiver, ramPortable,rations, robes,ropeHempen, ropeSilk, sack, scaleMerchants, sealingWax, shovel, signalWhistle, signetRing,soap,spellbook, spikesIron, spyglass, tent, tinderbox, torch, vial, waterskin, waterskinfuul, whetstone
    }
    private init(item:Items, name:String, cost:Double,weight:Double, description:String){
        self.item = item
        super.init(name: name, cost: cost, weight: weight, description: description)
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
        self.pack = pack
        super.init(name: "", cost: 1, weight: 2, description: "")
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
        case .holyWaterFlask: return ("Святая вода (колба)", 25_000, 1)
        case .hourglass: return ("Песочные часы", 25_000, 1)
        case .huntingTrap: return ("Капкан", 5_000 , 25)
        case .inkBotle: return ("Чернила", 10_000 ,0.1)
        case .inkPen: return ("Чернильное перо", 2, 0.1)
        case .jug: return ("Кувшин", 2, 4)
        case .ladder: return ("Лестница", 1, 25)
        case .lamp: return ("Лампа",5_00 , 1)
        case .lanternBullseye: return ("Фонарь,бычий глаз", 10_000, 2)
        case .lanternHooded: return ("Фонарь с козырьком", 5_000, 2)
        case .lock: return ("Замок", 10_000, 1)
        case .magnifyingGlass: return ("Лупа", 100_000, 0.1)
        case .manacles: return ("Наручники", 2_000, 6)
        case .messKit: return ("Столовые приборы", 2_00, 1)
        case .mirrorSteel: return ("Стальное зеркало", 5_000, 0.5)
        case .oilFlask: return ("Флакон масла", 1_00, 1)
        case .paper: return ("Бумага, один лист", 2_00, 0.1)
        case .parchment: return ("Пергамент, один лист", 1_00, 0.1)
        case .perfumeVial: return ("Флакон духов", 5_000, 0.1)
        case .pickMiners: return ("Шахтёрская кирка", 2_000, 10)
        case .piton: return ("Крюк", 5, 0.2)
        case .poisonBasicVial: return ("Флакон обычного яда", 100_000, 0.1)
        case .pouch: return ("Сумка", 5_00, 1)
        case .quiver: return ("Колчан", 1_000, 1)
        case .ramPortable: return ("Переносной таран", 4_000, 35)
        case .rations: return ("Провизия", 5_00, 2)
        case .robes: return ("Одеяние", 1_000, 4)
        case .ropeHempen: return ("Пеньковая верёвка 50 футов", 1_000, 10)
        case .ropeSilk: return ("Шёлковая верёвка 50 футов", 10_000, 5)
        case .sack: return ("Мешочек", 5, 2)
        case .scaleMerchants: return ("Торговые весы", 5_000, 3)
        case .sealingWax: return ("Сургуч", 5_00, 0.1)
        case .shovel: return ("Монтировка", 2_000, 5)
        case .signalWhistle: return ("Сигнальный свисток", 5, 0.1)
        case .signetRing: return ("Кольцо-перчатка", 5_000, 0.1)
        case .soap: return ("Мыло", 2, 0.1)
        case .spellbook: return ("Книга заклинаний", 50_000, 3)
        case .spikesIron: return ("Железные шипы", 1_000, 5)
        case .spyglass: return ("Подзорная труба", 1000_000, 1)
        case .tent: return ("Палатка на двоих", 2_000, 20)
        case .tinderbox: return ("Трутница", 5_00, 1)
        case .torch: return ("Факел", 1, 1)
        case .vial: return ("Флакон", 1_000, 0.1)
        case .waterskin: return ("Пустой бурдюк", 2_00, 0.1)
        case .waterskinfuul: return ("Бурдюк с водой", 4_00, 5)
        case .whetstone: return ("Точильный камень", 1, 1)
        case .pole: return ("Шест 10 футов", 5_00, 7)
        case .potIron: return ("Железный котелок", 2_000, 10)
        case .potionOfHealing: return ("Лечебное зелье", 50_000, 0.5)
        }
    }
}

//MARK:Задание
//Добавить классы и вложенные в них перечисления arcane focus, druidic focus, holy symbols из списка придметов на 150стр, как в других классах

