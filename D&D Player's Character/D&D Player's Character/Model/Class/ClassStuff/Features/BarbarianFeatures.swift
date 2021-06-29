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
    var heavyArmorEquip = false
    var time = 10 
    var constitutionSavingThrow = 10
    
    var useRage:Void {
        if self.enabled == false {
            guard self.count > 0 else { return }
            self.count -= 1
            self.enabled = true
        } else {
            self.enabled = false
        }
    }
    
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
class PrimalPath: Features {
    init() {
        super.init(name: "Первородный путь")
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
    var countDices = 1
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
class Frenzy: Features {
    init() {
        super.init(name: "Неистовство")
    }
}
class MindlessRage: Features {
    init() {
        super.init(name: "Бездумная ярость")
    }
}

class IntimidatingPresence: Features {
    init() {
        super.init(name: "Пугающий вид" )
    }
}

class Retaliation: Features  {
        init() {
            super.init(name: "Возмездие")
    }
}
        
//PATH OF THE TOTEM WARRIOR--------------------------------
class SpiritSeeker: Features {
    init() {
        super.init(name: "Искатель духов")
    }
}
class TotemSpirit: Features {
    var beast: BeastOfBarbarian!
    init() {
        super.init(name: "Тотемный дух")
        }
}
class AspectOfTheBeast: Features {
    var beast: BeastOfBarbarian!
    init() {
        super.init(name:  "Аспект зверя" )
    }
}
class SpiritWalker: Features {
    init() {
        super.init(name: "Говорящий с духами")
    }
}
class TotemicAttunement: Features {
    var beast: BeastOfBarbarian!
    init() {
        super.init(name: "Тотемное единство" )
    }
}
//Enum beast for Barbarian Totem Warior--------------------------------
enum BeastOfBarbarian: String {
    case bear  = "Медведь"
    case eagle  = "Орёл"
    case wolf  = "Волк"
}

