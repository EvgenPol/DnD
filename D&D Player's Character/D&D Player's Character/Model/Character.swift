//
//  Character.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 02.05.2021.
//

import Foundation
struct Character {
    var initiative: UInt?
    let race:Race
    var classOfChar:[EnumClass:ClassBasis]
    var hitPoints: HP
    var level = XP()
    var ability = AbilityChar()
    var alignment:Alignment
    var armorClass = 10
    var inventory = Inventory()
   
    
    mutating func first(){
        let char = classOfChar.first!.value.name
        let hitPointsMax = UInt(HP.findHitDice(charClass: char).rawValue + UInt32(ability.modifier(parametr: .constitution)))
        let hitPointsDice = (char, 1, HP.findHitDice(charClass: char))
        self.hitPoints = HP(current: hitPointsMax, max: hitPointsMax, dice: [hitPointsDice])
    }
    
    
    mutating func setInitiative (battleIsOver: Bool) {
        battleIsOver ? (initiative = nil) : (initiative = UInt(Dices.throwing(cast: 1, dice: .d20)))
    }

    mutating func levelUp(charClass: EnumClass, path: ClassPaths...) {
        guard level.current > level.requiredExp else { return }
        if !classOfChar.keys.contains(charClass) {
            classOfChar[charClass] = ClassBasis.findClass(charClass: charClass)
        }
        level.current = level.current - level.requiredExp
        path.isEmpty ? () : (classOfChar[charClass]!.path = path[0])
        classOfChar[charClass]!.nextLevel()
        switch classOfChar[charClass]!.level {
            case 4,8,12,16,19: ability.freePoints += 2
            default: break
        }
        hitPoints.max += UInt(Dices.throwing(cast: 1, dice: HP.findHitDice(charClass: classOfChar[charClass]!.name)) + ability.modifier(parametr: .constitution))
        hitPoints.addDice(charClass: charClass)
        level.level += 1
    }
}
