//
//  Equipment.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 16.05.2021.
//

import Foundation

enum Equipment {
    //Item
    enum Item {
       
        enum ArcaneFocus {
            case crystal
            case orb
            case rod
            case staff
            case wand
        }
       
        enum DruidicFocus {
            case springOfMistletoe
            case totem
            case woodenStaff
            case yewWand
        }
      
        enum HolySymbol {
            case amulet
            case emblem
            case reliquary
        }
        
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
