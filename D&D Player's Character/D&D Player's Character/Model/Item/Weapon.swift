//
//  Weapon.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 14.06.2021.
//

import Foundation

class Weapon: Item {
    let distance:Distance
    let properties: [Properties]
    var damage: (Int, TypeOfDamage?) { (0, .bludgeoning) }
    var typeOfWeapon: TypeOfWeapon
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
        self.distance = distance
        self.typeOfWeapon = typeOfWeapon
        self.properties = properties
        super.init(name: name, cost: cost, weight: weight, description: description)
       
    }
    func isEqual (weapon: Weapon) -> Bool {
        type(of: self) == type(of: weapon)
    }
}
//MARK: Протоколы для свойств оружия

// ...W is "Weapon"
 protocol SpecialW {}
 protocol FinesseW { }
 protocol HeavyW {}
 protocol LightW {}
 protocol ReachW {}
 protocol ThrownW {}
 protocol TwoHandedW {}
 protocol AmmunitionW {
    var ammo: Ammunition.Ammo {get}
    var charged: Bool {get set}
}
 protocol LoadingW {
    var chargedInThisRound: Bool {get set}
}
 protocol RangeW {
    var range: (normal:Int, max:Int) {get}
}
 protocol VersatileW {
    var damageForTwoHand: (Int, TypeOfDamage?) {get}
}
//
//MARK: Оружия
//MARK: Простое Ближнее
//
class Club: Weapon, LightW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d4), .bludgeoning) }
    init() {
        super.init(name:"Дубинка", cost:1, weight:2, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.light])
    }
}
//
class Dagger: Weapon, FinesseW, LightW, ThrownW, RangeW {
    let range: (normal: Int, max: Int) = (20,60)
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d4), .piercing) }
    init() {
        super.init(name:"Кинжал", cost:2_000, weight:1, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.finesse,.light,.thrown,.range])
    }
}

//
class GreatClub: Weapon, TwoHandedW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .bludgeoning) }
    init() {
        super.init(name:"Большая дубина", cost:2, weight:10, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.twoHanded])
    }
}
//
class HandAxe: Weapon, LightW, ThrownW, RangeW {
    let range: (normal: Int, max: Int) = (20,60)
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .slashing) }
    init() {
        super.init(name:"Топорик", cost:5_000, weight:1, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.light,.thrown,.range])
    }
}

//
class Javelin: Weapon, ThrownW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .piercing) }
    init() {
        super.init(name:"Метательное копье", cost:5, weight:2, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.thrown])
    }
}
//
class LightHammer: Weapon, LightW, ThrownW, RangeW {
    let range: (normal: Int, max: Int) = (20,60)
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d4), .bludgeoning) }
    init() {
        super.init(name:"Лёгкий молот", cost:2_000, weight:2, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.light,.thrown,.range])
    }
}
//
class Mace: Weapon {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .bludgeoning) }
    init() {
        super.init(name:"Булава", cost:5_000, weight:4, description:"", distance:.melee, typeOfWeapon:.simple, properties:[])
    }
}
//
class QuarterStaff: Weapon, VersatileW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .bludgeoning) }
    var damageForTwoHand: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .bludgeoning) }
    init() {
        super.init(name:"Короткий посох", cost:2, weight:4, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.versatile])
    }
}
//
class Sickle: Weapon, LightW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d4), .slashing) }
    init() {
        super.init(name:"Серп", cost:1_000, weight:2, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.light])
    }
}
//
class Spear: Weapon, ThrownW, VersatileW, RangeW {
    let range: (normal: Int, max: Int) = (20,60)
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .piercing) }
    var damageForTwoHand: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .piercing) }
    init() {
        super.init(name:"Копье", cost:1_000, weight:3, description:"", distance:.melee, typeOfWeapon:.simple, properties:[.thrown,.versatile,.range])
    }
}

//MARK: Простое Дальнее
//
class CrossbowLight: Weapon, AmmunitionW, LoadingW, TwoHandedW, RangeW {
    let ammo: Ammunition.Ammo = .crossbowBolt
    let range: (normal: Int, max: Int) = (80, 320)
    var charged = false
    var chargedInThisRound = false
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .piercing) }
    init() {
        super.init(name:"Лёгкий арбалет", cost:25_000, weight:5, description:"", distance:.ranged, typeOfWeapon:.simple, properties:[.ammunition, .loading, .twoHanded,.range])
    }
}
//
class Dart: Weapon, FinesseW, ThrownW, RangeW {
    let range: (normal: Int, max: Int) = (20,60)
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d4), .piercing) }
    init() {
        super.init(name:"Дротик", cost:0.5, weight:0.25, description:"", distance:.ranged, typeOfWeapon:.simple, properties:[.finesse,.thrown,.range])
    }
}
//
class ShortBow: Weapon, AmmunitionW, TwoHandedW, RangeW {
    let ammo: Ammunition.Ammo = .arrow
    let range: (normal: Int, max: Int) = (80, 320)
    var charged = false
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .piercing) }
    init() {
        super.init(name:"Короткий лук", cost:25_000, weight: 2, description: "", distance:.ranged, typeOfWeapon:.simple, properties:[.ammunition,.twoHanded,.range])
    }
}
//
class Sling: Weapon, AmmunitionW, RangeW {
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
class BattleAxe: Weapon, VersatileW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .slashing) }
    var damageForTwoHand: (Int, TypeOfDamage?)  { (Dices.throwing(cast: 1, dice: .d10), .slashing) }
    init() {
        super.init(name:"Боевой топор", cost:10_000, weight:4, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.versatile])
    }
}
//
class Flail: Weapon {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .bludgeoning) }
    init() {
        super.init(name:"Цеп", cost:10_000, weight:2, description:"", distance:.melee, typeOfWeapon:.martial, properties:[])
    }
}
//
class Glaive: Weapon, HeavyW, ReachW, TwoHandedW{
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d10), .slashing) }
    init() {
        super.init(name:"Глефа", cost:20_000, weight:6, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.heavy,.reach,.twoHanded])
    }
}
//
class GreatAxe: Weapon, HeavyW, TwoHandedW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d12), .slashing) }
    init() {
        super.init(name:"Двуручный топор", cost:30_000, weight:7, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.heavy,.twoHanded])
    }
}
//
class GreatSword: Weapon, HeavyW, TwoHandedW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 2, dice: .d6), .slashing) }
    init() {
        super.init(name:"Двуручный меч", cost:50_000, weight:6, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.heavy,.twoHanded])
    }
}
//
class Halberd: Weapon, HeavyW, ReachW, TwoHandedW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d10), .slashing) }
    init() {
        super.init(name:"Алебарда", cost:20_000, weight:6, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.heavy,.reach,.twoHanded])
    }
}
//
class Lance: Weapon, ReachW, SpecialW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d12), .piercing) }
    init() {
        super.init(name: "Рыцарское копье", cost:10_000, weight:6, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.reach,.special])
    }
}
//
class LongSword: Weapon, VersatileW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .slashing) }
    var damageForTwoHand: (Int, TypeOfDamage?)  { (Dices.throwing(cast: 1, dice: .d10), .slashing) }
    init() {
        super.init(name:"Длинный меч", cost:15_000, weight:3, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.versatile])
    }
}
//
class Maul: Weapon, HeavyW, TwoHandedW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 2, dice: .d6), .bludgeoning) }
    init() {
        super.init(name:"Молот", cost:10_000, weight:10, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.heavy,.twoHanded])
    }
}
//
class MorningStar: Weapon {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .piercing) }
    init() {
        super.init(name:"Моргенштерн", cost:15_000, weight: 4, description:"", distance:.melee, typeOfWeapon:.martial, properties:[])
    }
}
//
class Pike: Weapon, HeavyW, ReachW,TwoHandedW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d10), .piercing) }
    init() {
        super.init(name:"Пика", cost:5_000, weight:18, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.heavy,.reach,.twoHanded])
    }
}
//
class Rapier: Weapon, FinesseW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .piercing) }
    init() {
        super.init(name:"Рапира", cost:25_000, weight:2, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.finesse])
    }
}
//
class Scimitar: Weapon, FinesseW, LightW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .slashing) }
    init() {
        super.init(name:"Скимитар", cost:25_000, weight:3, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.finesse,.light])
    }
}
//
class ShortSword: Weapon, FinesseW, LightW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .piercing) }
    init() {
        super.init(name:"Короткий меч", cost:10_000, weight:2, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.finesse,.light])
    }
}
//
class Trident: Weapon, ThrownW, VersatileW, RangeW {
    let range: (normal: Int, max: Int) = (20,60)
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .piercing) }
    var damageForTwoHand: (Int, TypeOfDamage?)  { (Dices.throwing(cast: 1, dice: .d8), .piercing) }
    init() {
        super.init(name:"Тризубец", cost:5_000, weight:4, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.thrown,.versatile,.range])
    }
}
//
class WarPick: Weapon {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .piercing) }
    init() {
        super.init(name:"Клевец", cost:5_000, weight:2, description:"", distance:.melee, typeOfWeapon:.martial, properties:[])
    }
}
//
class Warhammer: Weapon, VersatileW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .bludgeoning) }
    var damageForTwoHand: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d10), .bludgeoning) }
    init() {
        super.init(name:"Боевой молот", cost:15_000, weight:2, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.versatile])
    }
}
//
class Whip: Weapon, FinesseW, ReachW {
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d4), .slashing) }
    init() {
        super.init(name:"Кнут", cost:2_000, weight:3, description:"", distance:.melee, typeOfWeapon:.martial, properties:[.finesse,.reach])
    }
}
//MARK: Боевое Дальнеe
//
class Blowgun: Weapon, AmmunitionW, LoadingW, RangeW {
    let ammo: Ammunition.Ammo = .blowgunNeedles
    let range: (normal: Int, max: Int) = (25,100)
    var charged = false
    var chargedInThisRound = false
    override var damage: (Int, TypeOfDamage?) { (1, .piercing) }
    init() {
        super.init(name:"Духовое ружье", cost:10_000, weight:1, description:"", distance:.ranged, typeOfWeapon:.martial, properties:[.ammunition,.loading,.range])
    }
}
//
class CrossbowHand: Weapon, AmmunitionW, LightW, LoadingW, RangeW {
    let ammo: Ammunition.Ammo = .crossbowBolt
    let range: (normal: Int, max: Int) = (30,120)
    var charged = false
    var chargedInThisRound = false
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d6), .piercing) }
    init() {
        super.init(name:"Ручной арбалет", cost:75_000, weight:3, description:"", distance:.ranged, typeOfWeapon:.martial, properties:[.ammunition,.light,.loading,.range])
    }
}
//
class CrossbowHeavy: Weapon, AmmunitionW, HeavyW, LoadingW,TwoHandedW, RangeW {
    let ammo: Ammunition.Ammo = .crossbowBolt
    let range: (normal: Int, max: Int) = (100,400)
    var charged = false
    var chargedInThisRound = false
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d10), .piercing) }
    init() {
        super.init(name:"Тяжелый арбалет", cost:50_000, weight:18, description:"", distance:.ranged, typeOfWeapon:.martial, properties:[.ammunition,.heavy,.loading, .twoHanded,.range])
    }
}
//
class Longbow: Weapon, AmmunitionW, HeavyW, TwoHandedW,RangeW {
    let ammo: Ammunition.Ammo = .arrow
    let range: (normal: Int, max: Int) = (150,600)
    var charged = false
    override var damage: (Int, TypeOfDamage?) { (Dices.throwing(cast: 1, dice: .d8), .piercing) }
    init() {
        super.init(name:"Длинный лук", cost:50_000, weight:2, description:"", distance:.ranged, typeOfWeapon:.martial, properties:[.ammunition,.heavy,.twoHanded,.range])
    }
}
//
class Net: Weapon, SpecialW, ThrownW, RangeW {
    let range: (normal: Int, max: Int) = (5,15)
    override var damage: (Int, TypeOfDamage?) { (0, nil) }
    init() {
        super.init(name:"Cеть", cost:1_000, weight:3, description:"", distance:.ranged, typeOfWeapon:.martial, properties:[.special,.thrown,.range])
    }
}

extension Weapon {
    static func getSimpleWeapon () -> [Weapon] {
        [ Club(), Dagger(), GreatClub(), HandAxe(), Javelin(), LightHammer(), Mace(), QuarterStaff(), Sickle(), Spear(),
         CrossbowLight(), Dart(), ShortBow(), Sling() ]
    }
    static func getMartialWeapon () -> [Weapon] {
        [BattleAxe(), Flail(), Glaive(), GreatAxe(), GreatSword(), Halberd(), Lance(), LongSword(), Maul(), MorningStar(), Pike(), Rapier(), Scimitar(), ShortSword(), Trident(), WarPick(), Warhammer(),
         Blowgun(), CrossbowHand(), CrossbowHeavy(), Longbow(), Net() ]
    }
    static func getSimpleMeleeWeapon () -> [Weapon] {
        [Club(), Dagger(), GreatClub(), HandAxe(), Javelin(), LightHammer(), Mace(), QuarterStaff(), Sickle(), Spear()]
    }
    static func getSimpleRangedWeapon () -> [Weapon] {
        [CrossbowLight(), Dart(), ShortBow(), Sling()]
    }
    static func getMartialMeleeWeapon () -> [Weapon] {
        [BattleAxe(), Flail(), Glaive(), GreatAxe(), GreatSword(), Halberd(), Lance(), LongSword(), Maul(), MorningStar(), Pike(), Rapier(), Scimitar(), ShortSword(), Trident(), WarPick(), Warhammer()]
    }
    static func getMartialRangedWeapon () -> [Weapon] {
        [Blowgun(), CrossbowHand(), CrossbowHeavy(), Longbow(), Net()]
    }
    static func getMeleeWeapon () -> [Weapon] {
        [ Club(), Dagger(), GreatClub(), HandAxe(), Javelin(), LightHammer(), Mace(), QuarterStaff(), Sickle(), Spear(),
          BattleAxe(), Flail(), Glaive(), GreatAxe(), GreatSword(), Halberd(), Lance(), LongSword(), Maul(), MorningStar(), Pike(), Rapier(), Scimitar(), ShortSword(), Trident(), WarPick(), Warhammer()]
    }
    static func getRangedWeapon () -> [Weapon] {
        [CrossbowLight(), Dart(), ShortBow(), Sling(),
         Blowgun(), CrossbowHand(), CrossbowHeavy(), Longbow(), Net() ]
    }
}
