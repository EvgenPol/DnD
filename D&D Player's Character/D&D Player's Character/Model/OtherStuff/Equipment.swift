//
//  Equipment.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 16.05.2021.
//

import Foundation

enum Equipment {
    //MoneyCoin
    enum MoneyCoin {
        case copperCoin(Int)
        case silver(Int)
        case electrum(Int)
        case gold(Int)
        case platinum(Int)
    }
    //Shield
    case shield
    //Armor
    public enum Armor  {
         enum LightArmor:CaseIterable {
            case padded, leather, studdedLeather
        }
         enum MediumArmor:CaseIterable {
            case hide, chainShirt, scaleMail, breastplate, halfPlate
        }
        enum HeavyArmor:CaseIterable  {
            case ringMail, chainMail, splint, plate
        }
    }
    // Weapons
    enum Weapons  {
        enum SimpleMeleeWeapons:CaseIterable  {
            case club
            case dagger
            case greatclub
            case handaxe
            case javelin
            case lightHammer
            case mace
            case quarterstaff
            case sickle
            case spear
        }
        enum SimpleRangedWeapons:CaseIterable  {
            case crossbowLight
            case dart
            case shortbow
            case sling
        }
        enum MartialMeleeWeapons:CaseIterable  {
            case battleAxe
            case flail
            case glaive
            case greataxe
            case greatsword
            case halberd
            case lance
            case longsword
            case maul
            case morningstar
            case pike
            case rapier
            case scimitar
            case shortsword
            case trident
            case warPick
            case warhammer
            case whip
        }
        enum MartialRangedWeapons:CaseIterable  {
            case blowgun
            case crossbowHand
            case crossbowHeavy
            case longbow
            case net
        }
    }
    //Item
    enum Item {
        case abacus
        case acidVial
        case alchemistsFireFlask
        enum Ammunition {
            case arrows
            case blowgunNeedles
            case crossbowBolts
            case slingBullets
        }
        case antitoxinVial
        enum ArcaneFocus {
            case crystal
            case orb
            case rod
            case staff
            case wand
        }
        case backpack
        case ballBearings
        case barrel
        case basket
        case bedroll
        case bell
        case blanket
        case blockAndTackle
        case book
        case bootle
        case glass
        case bucket
        case caltrops
        case candle
        case caseCrossbowBolt
        case caseMapOrScroll
        case chain
        case chalk
        case chest
        case climbersKit
        case clothesCommon
        case clothesCostume
        case clothesFine
        case clothesTraveler
        case componentPouch
        case  crowbar
        enum DruidicFocus {
            case springOfMistletoe
            case totem
            case woodenStaff
            case yewWand
        }
        case fishingTackle
        case flaskOfTankard
        case grapplingHook
        case hammer
        case hammerSledge
        case healersKit
        enum HolySymbol {
            case amulet
            case emblem
            case reliquary
        }
        case holyWaterFlask
        case hourglass
        case huntingTrap
        case inkBotle
        case inkPen
        case jug
        case ladder
        case lamp
        case lanternBullseye
        case lanternHooded
        case lock
        case magnifyingGlass
        case manacles
        case messKit
        case mirrorSteel
        case oilFlask
        case paper
        case parchment
        case perfumeVial
        case pickMiners
        case piton
        case poisonBasicVial
        case pole
        case potIron
        case potionOfHealing
        case pouch
        case quiver
        case ramPortable
        case rations
        case robes
        case ropeHempen
        case ropeSilk
        case sack
        case scaleMerchants
        case sealingWax
        case shovel
        case signalWhistle
        case signetRing
        case soap
        case spellbook
        case spikesIron
        case spyglass
        case tent
        case tinderbox
        case torch
        case vial
        case waterskin
        case whetstone
    }
    enum EquipmentPacks {
        case burglarsPack
        case diplomatsPack
        case dungeoneersPack
        case entertainersPack
        case explorersPack
        case priestsPack
        case scholarsPack
    }
}
