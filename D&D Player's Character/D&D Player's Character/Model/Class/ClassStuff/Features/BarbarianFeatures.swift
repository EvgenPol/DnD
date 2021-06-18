//
//  BarbarianFeatures.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 17.06.2021.
//

import Foundation

class Rage: Features {
    var count = 2
    var total = 2
    var damage = 2
    var enabled = false
    var time: Int { 10 }
    
    init() {
        super.init(name: "Ярость")
    }
}

class UnarmoredDefence: Features {
    init() {
        super.init(name: "Бездоспешная защита")
    }
}
class RecklessAttack: Features {
    var reckless = false
    init() {
        super.init(name: "Безрассудная атака")
    }
}
class DangerSense: Features {
    init() {
        super.init(name: "Чувство опасности")
    }
}
class ExtraAttack: Features {
    init() {
        super.init(name: "Дополнительная атака")
    }
}

class FastMovement: Features {
    init () {
        super.init(name: "Быстрое передвижение")
    }
}
class FeralInstinct: Features {
    init() {
        super.init(name: "Звериный инстинкт")
    }
}
class BrutalCritical: Features {
    init() {
        super.init(name: "Зверский критический удар")
    }
}

class RelentlessRage:Features {
    init() {
        super.init(name: "Неослабевающая ярость")
    }
}

class PersistentRage: Features {
    init() {
        super.init(name: "Нескончаемая ярость")
    }
}

class IndomitableMight: Features {
    init() {
        super.init(name: "Неукротимая мощь")
    }
}
class PrimalChampion: Features {
    init() {
        super.init(name: "Первородный чемпион")
    }
}
//PATH OF THE BERSERKER--------------------------------
case frenzy = "Неистовство"
case mindlessRage = "Бездумная ярость"
case intimidatingPresence  = "Пугающий вид"
case retaliation = "Возмездие"
//PATH OF THE TOTEM WARRIOR--------------------------------
case spiritSeeker = "Искатель духов"
case totemSpirit (beastOfBarbarian) = "Тотемный дух"
case aspectOfTheBeast (beastOfBarbarian) = "Аспект зверя"
case spiritWalker (beastOfBarbarian)  = "Говорящий с духами"
case totemicAttunement  = "Тотемное единство"
//Enum beast for Barbarian Totem Warior--------------------------------
enum beastOfBarbarian: String{
    case bear  = "Медведь"
    case eagle  = "Орёл"
    case wolf  = "Волк"
}
