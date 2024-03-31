//
//  SpongeBob.swift
//  FighterClubWithStudents
//
//  Created by Даниил Глуховцев on 31.03.2024.
//

import Foundation

final class SpongeBob: Fighter, UltimateAbility {
    
    init(name: String) {
        super.init(name: name,
                   type: .spongebob,
                   strength: 3,
                   vitality: 70,
                   agility: 10)
    }
    func ultimateAbility() -> Int {
        var damageAbility = 0
        if agility >= strength {
            damageAbility = agility + strength
        } else if agility < vitality {
            damageAbility = (agility + vitality) * 2
          
        }
        return damageAbility
    }
    
    func kick() -> Int {
        let simpleKick: Int = Int.random(in: 0...damage)
        return simpleKick
    }
    
}
