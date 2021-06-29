//
//  BarbarianClass.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 16.05.2021.
//

import Foundation

class BarbarianClass: ClassBasis {
    
    func chooseBeastForTotemWarior (for feature: Features, totemBeast: BeastOfBarbarian) {
        switch feature {
        case is TotemSpirit:
            let totemSpirit = feature as! TotemSpirit
            totemSpirit.beast = totemBeast
            
        case is AspectOfTheBeast:
            let aspectOfTheBeast = feature as! AspectOfTheBeast
            aspectOfTheBeast.beast = totemBeast
            
        case is TotemicAttunement:
            let totemicAttunement = feature as! TotemicAttunement
            totemicAttunement.beast = totemBeast
        default: break
        }
    }
       
   override func nextLevel() {
        levelUp()
   }
    
    init(skills:[Skills]) {
        var armorProficiencies = LightArmor.getAllSubclasses()
        armorProficiencies.append(contentsOf: MediumArmor.getAllSubclasses())
        armorProficiencies.append(contentsOf: Shield.getAllSubclasses())
        
        var weaponProficiencies = Weapon.getSimpleWeapon()
        weaponProficiencies.append(contentsOf: Weapon.getMartialWeapon())
        
        super.init(nameClass: EnumClass.barbarian, features: ["Rage":Rage(), "UnarmoredDefence":UnarmoredDefence()], primaryAbility: [Ability.strenght], skills: skills, savingThrowProficiencies: [Ability.strenght, .constitution], toolsProficiencies: [], armorProficiencies: armorProficiencies, weaponProficiencies: weaponProficiencies )
    }
    
}
extension BarbarianClass {
    private func levelUp(Path: ClassPaths...) {
        level += 1
        let rage = features["Rage"] as! Rage
        let brutalCritical = features["BrutalCritical"] as? BrutalCritical
        
        switch level {
        case 2:
            features["RecklessAttack"] = RecklessAttack()
            features["DangerSense"] = DangerSense()
        case 3:
            rage.total = 3
            features["PrimalPath"] = PrimalPath()
            path = Path[0]
            if path == .pathOfTheBerserker {
                features["Frenzy"] = Frenzy()
            } else if path == .pathOfTheTotemWarrior {
                features["SpiritSeeker"] =  SpiritSeeker()
                features["TotemSpirit"] = TotemSpirit()
            }
        case 4: break
        case 5:
            rage.total = 4
            features["ExtraAttack"] = ExtraAttack()
            features["FastMovement"] = FastMovement()
        case 6:
            if path == .pathOfTheBerserker {
                features["MindlessRage"] = MindlessRage()
            } else if path == .pathOfTheTotemWarrior {
                features["AspectOfTheBeast"] =  AspectOfTheBeast()
            }
        case 7: features["FeralInstinct"] = FeralInstinct()
        case 8: break
        case 9:
            rage.damage = 4
            features["BrutalCritical"] = BrutalCritical()
        case 10:
            if path == .pathOfTheBerserker {
                features["IntimidatingPresence"] = IntimidatingPresence()
            } else if path == .pathOfTheTotemWarrior {
                features["SpiritWalker"] =  SpiritWalker()
            }
        case 11: features["RelentlessRage"] = RelentlessRage()
        case 12: rage.total = 5
        case 13: brutalCritical!.countDices = 2
        case 14:
            if path == .pathOfTheBerserker {
                features["Retaliation"] = Retaliation()
            } else if path == .pathOfTheTotemWarrior {
                features["TotemicAttunement"] =  TotemicAttunement()
            }
        case 15: rage.time = Int.max
        case 16: rage.damage = 4
        case 17:
            rage.total = 6
            brutalCritical!.countDices = 3
        case 18: features["IndomitableMight"] = IndomitableMight()
        case 19: break
        case 20:
            features["PrimalChampion"] = PrimalChampion()
            rage.total = Int.max
        default: break
        }
    }
}

