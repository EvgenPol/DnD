//
//  Features.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 16.05.2021.
//

import Foundation

class Features {
    let name:String
    
    //static func for increase parametrs on 4,8,12,16,19 levels
    static func abilityScoreImprovement() -> Int { 2 }
    
    init(name:String) {
        self.name = name
    }
}


enum Featureadass: String {
    //MARK:Features Barbarian
   
    case rage = "Ярость"
    case unarmoredDefence = "Бездоспешная защита"
    case recklessAttack = "Безрассудная атака"
    case dangerSense = "Чувство опасности"
    case primalPath = "Первородный путь"
    case extraAttack = "Дополнительная атака"
    case fastMovement = "Быстрое передвижение"
    case feralInstinct = "Звериный инстинкт"
    case brutalCritical = "Зверский критический удар"
    case relentlessRage = "Неослабевающая ярость"
    case persistentRage = "Нескончаемая ярость"
    case indomitableMight = "Неукротимая мощь"
    case primalChampion = "Первородный чемпион"
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
    
}
