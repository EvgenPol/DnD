//
//  Alignment.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 02.05.2021.
//

import Foundation

enum Alignment: String {
    case lawfulGood = "Законопослушный-Добрый"
    case neutralGood = "Нейтральный-Добрый"
    case chaoticGood = "Хаотичный-Добрый"
    case lawfulNeutral = "Законопослушый-Нейтральный"
    case trueNeutral = "Нейтральный"
    case chaoticNeutral = "Хаотичный-Нейтральный"
    case lawfulEvil = "Законопослушный-Злой"
    case neutralEvil = "Нейтральный-Злой"
    case chaoticEvil = "Хаотичный-Злой"
}

enum Size: String {
    case tiny = "Крошечный"
    case small = "Маленький"
    case medium = "Средний"
    case large = "Большой"
    case huge = "Огромный"
    case gargantuan = "Колоссальный"
}
