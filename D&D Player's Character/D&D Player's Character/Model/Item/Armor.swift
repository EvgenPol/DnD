//
//  Armor.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 29.05.2021.
//

import Foundation

//MARK: класс Armor
class Armor: Item {
    let armorClass: Int
    let stealthDisadvantage: Bool
    let strength: Int?
    let type: String
    let stealthDisadvntage: Bool
    let modifier:String?
    let don: Int
    let doff: Int
    
    class func getAllSubclasses () -> [Armor] {
        [Padded(), Leather(), StuddedLeather(), Hide(), ChainShirt(), ScaleMail(), Breastplate(), HalfPlate(), RingMail(), ChainMail(), Splint(), Plate()]
    }
    
    init(name:String, cost:Double, weight:Double, description:String, armorClass:Int, stealthDisadvantage:Bool, strength:Int?, type:String, modifier:String?, don:Int, doff:Int ) {
        super.init(name: name, cost: cost, weight: weight, description: description)
        self.armorClass = armorClass
        self.stealthDisadvantage = stealthDisadvantage
        self.type = type
        self.modifier = modifier
        self.don = don
        self.doff = doff
    }
}
//MARK: виды брони + щит
class LightArmor: Armor {
    override class func getAllSubclasses() -> [Armor] {
        [Padded(), Leather(), StuddedLeather()]
    }
    init(name:String, cost:Double, weight:Double, description:String, armorClass:Int, stealthDisadvantage:Bool) {
        super.init(name: name, cost: cost, weight: weight, description: description, armorClass: armorClass, stealthDisadvantage: stealthDisadvantage, strength: nil, type: "LightArmor", modifier: "Dex modifier", don: 1, doff: 1)
    }
}

class MediumArmor: Armor {
    override class func getAllSubclasses() -> [Armor] {
        [Hide(), ChainShirt(), ScaleMail(), Breastplate(), HalfPlate()]
    }
    init(name: String, cost: Double, weight: Double, description: String, armorClass: Int, stealthDisadvantage: Bool) {
        super.init(name: name, cost: cost, weight: weight, description: description, armorClass: armorClass, stealthDisadvantage: stealthDisadvantage, strength: nil, type: "MediumArmor", modifier: "Dex modifier (max 2)", don: 5, doff: 1)
    }
}

class HeavyArmor: Armor {
    override class func getAllSubclasses() -> [Armor] {
        [RingMail(), ChainMail(), Splint(), Plate()]
    }
    init(name:String, cost:Double, weight:Double, description:String, armorClass:Int, strength:Int?) {
        super.init(name: name, cost: cost, weight: weight, description: description, armorClass: armorClass, stealthDisadvantage: true, strength: strength, type: "HeavyArmor", modifier: nil, don: 10, doff: 5)
    }
}

class Shield: Armor {
    override class func getAllSubclasses() -> [Armor] {
        [UsualShield()]
    }
    init(name: String, cost: Double, weight: Double, description: String, armorClass: Int) {
        super.init(name: name, cost: cost, weight: weight, description: description, armorClass: armorClass, stealthDisadvantage: false, strength: nil, type: "Shield", modifier: nil, don: 0, doff: 0)
    }
}

//MARK: Виды легкой брони
class Padded: LightArmor {
    override class func getAllSubclasses() -> [Armor] { [] }
    init() {
        let description = DescriptionArmor.padded.description()
        super.init(name: "Стеганные доспехи", cost: 5_000, weight: 8, description:description, armorClass: 11, stealthDisadvantage: true)
    }
}
class Leather: LightArmor {
    override class func getAllSubclasses() -> [Armor] { [] }
    init() {
        let description = DescriptionArmor.leather.description()
        super.init(name: "Кожанные доспехи", cost: 10_000, weight: 10, description: description, armorClass: 11, stealthDisadvantage: false)
    }
}
class StuddedLeather: LightArmor {
    override class func getAllSubclasses() -> [Armor] { [] }
    init() {
        let description = DescriptionArmor.studdedLeather.description()
        super .init(name: "Клепанные доспехи", cost: 45_000, weight: 13, description: description, armorClass: 12, stealthDisadvantage: false)
    }
}
//MARK: Виды средней броны
class Hide: MediumArmor {
    override class func getAllSubclasses() -> [Armor] { [] }
    init() {
        let description = DescriptionArmor.hide.description()
        super.init(name: "Сыромятные доспехи", cost: 10_000, weight: 12, description: description, armorClass: 12, stealthDisadvantage: false)
    }
}
class ChainShirt: MediumArmor {
    override class func getAllSubclasses() -> [Armor] { [] }
    init() {
        let description = DescriptionArmor.chainShirt.description()
        super.init(name: "Кольчужная рубаха", cost: 50_000, weight: 20, description: description, armorClass: 13, stealthDisadvantage: false)
    }
}
class ScaleMail: MediumArmor {
    override class func getAllSubclasses() -> [Armor] { [] }
    init() {
        let description = DescriptionArmor.scaleMail.description()
        super.init(name: "Чешуйчатые доспехи", cost: 50_000, weight: 45, description: description, armorClass: 14, stealthDisadvantage: true)
    }
}
class Breastplate: MediumArmor {
    override class func getAllSubclasses() -> [Armor] { [] }
    init() {
        let description = DescriptionArmor.breastplate.description()
        super.init(name: "Нагрудник", cost: 400_000, weight: 20, description: description, armorClass: 14, stealthDisadvantage: false)
    }
}

class HalfPlate: MediumArmor {
    override class func getAllSubclasses() -> [Armor] { [] }
    init() {
        let description = DescriptionArmor.halfPlate.description()
        super.init(name: "Полулаты", cost: 750_000, weight: 40, description: description, armorClass: 15, stealthDisadvantage: true)
    }
}
//MARK: Виды тяжелой брони
class RingMail: HeavyArmor {
    override class func getAllSubclasses() -> [Armor] { [] }
    init() {
        let description = DescriptionArmor.ringMail.description()
        super.init(name: "Кольчатые доспехи", cost: 30_000, weight: 40, description: description, armorClass: 14, strength: nil)
    }
}
class ChainMail: HeavyArmor {
    override class func getAllSubclasses() -> [Armor] { [] }
    init() {
        let description = DescriptionArmor.chainMail.description()
        super.init(name: "Кольчуга", cost: 75_000, weight: 55, description: description, armorClass: 16, strength: 13)
    }
}
class Splint: HeavyArmor {
    override class func getAllSubclasses() -> [Armor] { [] }
    init() {
        let description = DescriptionArmor.splint.description()
        super.init(name: "Пластинчатые доспехи", cost: 200_000, weight: 60, description: description, armorClass: 17, strength: 15)
    }
}
class Plate: HeavyArmor {
    override class func getAllSubclasses() -> [Armor] { [] }
    init() {
        let description = DescriptionArmor.plate.description()
        super.init(name: "Латы", cost: 1500_000, weight: 65, description: description, armorClass: 18, strength: 15)
    }
}
//MARK: Обычный щит
class UsualShield: Shield {
    override class func getAllSubclasses() -> [Armor] { [] }
    init() {
        let description = DescriptionArmor.shield.description()
        super.init(name: "Обычный щит", cost: 10_000, weight: 6, description: description, armorClass: 2)
    }
}

//MARK: Описание брони
fileprivate enum DescriptionArmor {
    case padded, leather, studdedLeather, hide, chainShirt, scaleMail, breastplate, halfPlate, ringMail, chainMail, splint, plate, shield
    func description () -> String {
        switch self {
        case .padded:
           return "Стеганые доспехи состоят из нескольких слоев стеганой ткани и шерстяной подкладки."
        case .leather:
            return "Нагрудник и наплечники доспехов изготовлены из кожи, для придания жесткости обработанной в кипящем масле. Остальные детали доспеха сделаны из более мягких и гибких материалов."
        case .studdedLeather:
            return "Клепаные. Сделанные из прочной, но гибкой кожи, клепаные доспехи укреплены близко посаженными заклепками или шипами."
        case .hide:
            return "Эта грубая броня сделана из толстых мехов и шкур. Обычно её носят племена варваров, злые гуманоиды и другие народы, которые не имеют инструментов и ресурсов для изготовления более качественных доспехов."
        case .chainShirt:
            return "Сделанная из множества соединенных металлических колец, кольчужная рубаха одевается между слоями одежды или кожаной брони. Она предоставляет умеренную защиту для верхней части тела, а звон колец приглушается слоями другой одежды."
        case .scaleMail:
            return "Этот доспех состоит из кожаной куртки и штанов (и возможно отдельной юбки), внахлест покрытых металлическими пластинами, подобно рыбьей чешуе. Этот набор также включает в себя перчатки."
        case .breastplate:
            return "Этот доспех состоит из металлической пластины, закрепленной на гибкой коже. Хотя он оставляет ноги и руки незащищ енными, этот доспех хорошо защищает жизненно важные органы владельца, при этом не слишком перегружая его."
        case .halfPlate:
            return "Полулаты изготовлены из металлических пластин, покрывающих большую часть тела. Они не включают в себя защиту ног, кроме простых поножей, которые закрепляются при помощи кожаных ремешков."
        case .ringMail:
            return "Это кожаная броня с тяжелыми кольцами, вшитыми в нее. Кольца укрепляют броню от ударов мечами и топорами. Кольчатая броня хуже кольчуги, её обычно носят те, кто не может позволить более качественную броню."
        case .chainMail:
            return "Сделана из соединенных металлических колец, а также включает в себя слой стеганой ткани, одеваемой под кольчугу, чтобы предотвратить трение, и смягчить силу ударов. Этот доспех включает в себя перчатки."
        case .splint:
            return "Этот доспех сделан из узких полосок металла, заклепками присоединенных к кожаной подложке, одеваемой поверх тканевой подкладки. Места соединения защищены гибкой кольчужной сеткой."
        case .plate:
            return "Латный доспех состоит из металлических пластин, соединенных друг с другом и закрывающих всё тело. Набор включает в себя перчатки, тяжелые кожаные ботинки, шлем с опущенным забралом и толстые слои подкладки. Пряжки и ремешки распределяют вес по всему телу."
        case .shield:
            return "Щит изготовлен из дерева или металла, и носится в одной руке"
        }
    }
}
