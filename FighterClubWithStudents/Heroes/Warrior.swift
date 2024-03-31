//
//  Warrior.swift
//  FighterClubWithStudents
//
//  Created by Shamil Aglarov on 11.03.2024.
//

import Foundation

final class Warrior: Fighter {
    
    init(name: String) {
        super.init(name: name,
                   type: .warrior,
                   strength: 10,
                   vitality: 10,
                   agility: 0)
    }
    
    override func ultimateAbility() -> Int {
        let damage = damage * 3
        return Int.random(in: damage/2...damage)
    }
    
    override func kick() -> Int {
        let totalDamage: Int = Int.random(in: 0...damage)
        return totalDamage
    }
}
