//
//  Weapon.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 14.06.2021.
//

import Foundation

class Weapon: Item {
    let distance:Distance
    let typeOfWeapon:TypeOfWeapon
    let properties: [Properties]
    var damage: (Int, TypeOfDamage?) { (0, .bludgeoning) }
    
    enum Distance {
        case melee, ranged
    }
    enum TypeOfWeapon {
        case improvised, simple, martial
    }
    enum Properties: String {
        case ammunition, finesse, heavy, light, loading, range, reach, special, thrown, twoHanded, versatile
    }
    init(name: String, cost: Double, weight: Double, description: String, distance:Distance, typeOfWeapon:TypeOfWeapon, properties:[Properties]) {
        super.init(name: name, cost: cost, weight: weight, description: description)
        self.distance = distance
        self.typeOfWeapon = typeOfWeapon
        self.properties = properties
    }
}
//MARK: Протоколы для свойств оружия
fileprivate protocol Special {}
fileprivate protocol Finesse {}
fileprivate protocol Heavy {}
fileprivate protocol Light {}
fileprivate protocol Reach {}
fileprivate protocol Thrown {}
fileprivate protocol TwoHanded {}
fileprivate protocol AmmunitionPr {
    var ammo: Ammunition.Ammo {get}
    var charged: Bool {get set}
}
fileprivate protocol Loading {
    var chargedInThisRound: Bool {get set}
}
fileprivate protocol Range {
    var range: (normal:Int, max:Int) {get}
}
fileprivate protocol Versatile {
    var damageForTwoHand: (Int, TypeOfDamage?) {get}
}

//MARK: Оружия
//MARK: Простое Ближнее
//
class Club: Weapon, Light {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d4), .bludgeoning) }
    init() {
        super.init(name:"Дубинка", cost:1, weight:2, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.light])
    }
}
//
class Dagger: Weapon, Finesse, Light, Thrown, Range {
    let range: (normal: Int, max: Int) = (20,60)
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d4), .piercing) }
    init() {
        super.init(name:"Кинжал", cost:2_00, weight:1, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.finesse,.light,.thrown,.range])
    }
}

//
class GreatClub: Weapon, TwoHanded {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .bludgeoning) }
    init() {
        super.init(name:"Большая дубина", cost:2, weight:10, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.twoHanded])
    }
}
//
class HandAxe: Weapon, Light, Thrown, Range {
    let range: (normal: Int, max: Int) = (20,60)
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .slashing) }
    init() {
        super.init(name:"Топорик", cost:5_00, weight:1, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.light,.thrown,.range])
    }
}

//
class Javelin: Weapon, Thrown {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .piercing) }
    init() {
        super.init(name:"Метательное копье", cost:5, weight:2, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.thrown])
    }
}
//
class LightHammer: Weapon, Light, Thrown, Range {
    let range: (normal: Int, max: Int) = (20,60)
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d4), .bludgeoning) }
    init() {
        super.init(name:"Лёгкий молот", cost:2_00, weight:2, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.light,.thrown,.range])
    }
}
//
class Mace: Weapon {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .bludgeoning) }
    init() {
        super.init(name:"Булава", cost:5_00, weight:4, description:"", distance:.melee, typeOfWeapon:.simple, properties:[])
    }
}
//
class QuarterStaff: Weapon, Versatile {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .bludgeoning) }
    var damageForTwoHand: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .bludgeoning) }
    init() {
        super.init(name:"Короткий посох", cost:2, weight:4, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.versatile])
    }
}
//
class Sickle: Weapon, Light {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d4), .slashing) }
    init() {
        super.init(name:"Серп", cost:1_00, weight:2, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.light])
    }
}
//
class Spear: Weapon, Thrown, Versatile, Range {
    let range: (normal: Int, max: Int) = (20,60)
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .piercing) }
    var damageForTwoHand: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .piercing) }
    init() {
        super.init(name:"Копье", cost:1_00, weight:3, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.thrown,.versatile,.range])
    }
}

//MARK: Простое Дальнее
//
class CrossbowLight: Weapon, AmmunitionPr, Loading, TwoHanded, Range {
    let ammo: Ammunition.Ammo = .crossbowBolt
    let range: (normal: Int, max: Int) = (80, 320)
    var charged = false
    var chargedInThisRound = false
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .piercing) }
    init() {
        super.init(name:"Лёгкий арбалет", cost:25_00, weight:5, description:"", distance:.ranged, typeOfWeapon:.simple, properties:[.ammunition, .loading, .twoHanded,.range])
    }
}
//
class Dart: Weapon, Finesse, Thrown, Range {
    let range: (normal: Int, max: Int) = (20,60)
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d4), .piercing) }
    init() {
        super.init(name:"Дротик", cost:0.5, weight:0.25, description:"", distance:.ranged, typeOfWeapon:.simple, properties:[.finesse,.thrown,.range])
    }
}
//
class ShortBow: Weapon, AmmunitionPr, TwoHanded, Range {
    let ammo: Ammunition.Ammo = .arrow
    let range: (normal: Int, max: Int) = (80, 320)
    var charged = false
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .piercing) }
    init() {
        super.init(name:"Короткий лук", cost:25_00, weight: 2, description: "", distance:.ranged, typeOfWeapon:.simple, properties:[.ammunition,.twoHanded,.range])
    }
}
//
class Sling: Weapon, AmmunitionPr, Range {
    let ammo: Ammunition.Ammo = .slingBullets
    let range: (normal: Int, max: Int) = (30,120)
    var charged = false
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d4), .bludgeoning) }
    init() {
        super.init(name:"Праща", cost:1, weight:0, description:"", distance:.ranged, typeOfWeapon:.simple, properties:[.ammunition,.range])
    }
}

//MARK: Боевое Ближнее
//
class BattleAxe: Weapon, Versatile {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .slashing) }
    var damageForTwoHand: (Int, TypeOfDamage?)  { (Dices.throwing(cast: 1, dice: .d10), .slashing) }
    init() {
        super.init(name:"Боевой топор", cost:10_00, weight:4, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.versatile])
    }
}
//
class Flail: Weapon {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .bludgeoning) }
    init() {
        super.init(name:"Цеп", cost:10_00, weight:2, description:"", distance:.melee, typeOfWeapon:.martial, properties:[])
    }
}
//
class Glaive: Weapon, Heavy, Reach, TwoHanded{
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d10), .slashing) }
    init() {
        super.init(name:"Глефа", cost:20_00, weight:6, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.heavy,.reach,.twoHanded])
    }
}
//
class GreatAxe: Weapon, Heavy, TwoHanded {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d12), .slashing) }
    init() {
        super.init(name:"Двуручный топор", cost:30_00, weight:7, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.heavy,.twoHanded])
    }
}
//
class GreatSword: Weapon, Heavy, TwoHanded {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 2, dice: .d6), .slashing) }
    init() {
        super.init(name:"Двуручный меч", cost:50_00, weight:6, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.heavy,.twoHanded])
    }
}
//
class Halberd: Weapon, Heavy, Reach, TwoHanded {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d10), .slashing) }
    init() {
        super.init(name:"Алебарда", cost:20_00, weight:6, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.heavy,.reach,.twoHanded])
    }
}
//
class Lance: Weapon, Reach, Special {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d12), .piercing) }
    init() {
        super.init(name: "Рыцарское копье", cost:10_00, weight:6, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.reach,.special])
    }
}
//
class LongSword: Weapon, Versatile {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .slashing) }
    var damageForTwoHand: (Int, TypeOfDamage?)  { (Dices.throwing(cast: 1, dice: .d10), .slashing) }
    init() {
        super.init(name:"Длинный меч", cost:15_00, weight:3, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.versatile])
    }
}
//
class Maul: Weapon, Heavy, TwoHanded {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 2, dice: .d6), .bludgeoning) }
    init() {
        super.init(name:"Молот", cost:10_00, weight:10, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.heavy,.twoHanded])
    }
}
//
class MorningStar: Weapon {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .piercing) }
    init() {
        super.init(name:"Моргенштерн", cost:15_00, weight: 4, description:"", distance:.melee, typeOfWeapon:.martial, properties:[])
    }
}
//
class Pike: Weapon, Heavy, Reach,TwoHanded {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d10), .piercing) }
    init() {
        super.init(name:"Пика", cost:5_00, weight:18, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.heavy,.reach,.twoHanded])
    }
}
//
class Rapier: Weapon, Finesse {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .piercing) }
    init() {
        super.init(name:"Рапира", cost:25_00, weight:2, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.finesse])
    }
}
//
class Scimitar: Weapon, Finesse, Light {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .slashing) }
    init() {
        super.init(name:"Скимитар", cost:25_00, weight:3, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.finesse,.light])
    }
}
//
class ShortSword: Weapon, Finesse, Light {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .piercing) }
    init() {
        super.init(name:"Короткий меч", cost:10_00, weight:2, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.finesse,.light])
    }
}
//
class Trident: Weapon, Thrown, Versatile, Range {
    let range: (normal: Int, max: Int) = (20,60)
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .piercing) }
    var damageForTwoHand: (Int, TypeOfDamage?)  { (Dices.throwing(cast: 1, dice: .d8), .piercing) }
    init() {
        super.init(name:"Тризубец", cost:5_00, weight:4, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.thrown,.versatile,.range])
    }
}
//
class WarPick: Weapon {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .piercing) }
    init() {
        super.init(name:"Клевец", cost:5_00, weight:2, description:"", distance:.melee, typeOfWeapon:.martial, properties:[])
    }
}
//
class Warhammer: Weapon, Versatile {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .bludgeoning) }
    var damageForTwoHand: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d10), .bludgeoning) }
    init() {
        super.init(name:"Боевой молот", cost:15_00, weight:2, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.versatile])
    }
}
//
class Whip: Weapon, Finesse, Reach {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d4), .slashing) }
    init() {
        super.init(name:"Кнут", cost:2_00, weight:3, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.finesse,.reach])
    }
}
//MARK: Боевое Дальнеe
//
class Blowgun: Weapon, AmmunitionPr, Loading, Range {
    let ammo: Ammunition.Ammo = .blowgunNeedles
    let range: (normal: Int, max: Int) = (25,100)
    var charged = false
    var chargedInThisRound = false
    override var damage: (Int, TypeOfDamage?) { (1, .piercing) }
    init() {
        super.init(name:"Духовое ружье", cost:10_00, weight:1, description:"", distance:.ranged, typeOfWeapon:.martial, properties:[.ammunition,.loading,.range])
    }
}
//
class CrossbowHand: Weapon, AmmunitionPr, Light, Loading, Range {
    let ammo: Ammunition.Ammo = .crossbowBolt
    let range: (normal: Int, max: Int) = (30,120)
    var charged = false
    var chargedInThisRound = false
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .piercing) }
    init() {
        super.init(name:"Ручной арбалет", cost:75_00, weight:3, description:"", distance:.ranged, typeOfWeapon:.martial, properties:[.ammunition,.light,.loading,.range])
    }
}
//
class CrossbowHeavy: Weapon, AmmunitionPr, Heavy, Loading,TwoHanded, Range {
    let ammo: Ammunition.Ammo = .crossbowBolt
    let range: (normal: Int, max: Int) = (100,400)
    var charged = false
    var chargedInThisRound = false
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d10), .piercing) }
    init() {
        super.init(name:"Тяжелый арбалет", cost:50_00, weight:18, description:"", distance:.ranged, typeOfWeapon:.martial, properties:[.ammunition,.heavy,.loading, .twoHanded,.range])
    }
}
//
class Longbow: Weapon, AmmunitionPr, Heavy, TwoHanded,Range {
    let ammo: Ammunition.Ammo = .arrow
    let range: (normal: Int, max: Int) = (150,600)
    var charged = false
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .piercing) }
    init() {
        super.init(name:"Длинный лук", cost:50_00, weight:2, description:"", distance:.ranged, typeOfWeapon:.martial, properties:[.ammunition,.heavy,.twoHanded,.range])
    }
}
//
class Net: Weapon, Special, Thrown, Range {
    let range: (normal: Int, max: Int) = (5,15)
    override var damage: (Int, TypeOfDamage?) { (0, nil) }
    init() {
        super.init(name:"Cеть", cost:1_00, weight:3, description:"", distance:.ranged, typeOfWeapon:.martial, properties:[.special,.thrown,.range])
    }
}
