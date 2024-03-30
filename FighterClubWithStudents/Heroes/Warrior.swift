//
//  Warrior.swift
//  FighterClubWithStudents
//
//  Created by Shamil Aglarov on 11.03.2024.
//

import Foundation

final class Warrior: Fighter, UltimateAbility {
    
    init(name: String) {
        super.init(name: name,
                   type: .warrior,
                   strength: 10,
                   vitality: 10,
                   agility: 0)
    }
    
    func ultimateAbility() -> Int {
        return damage * 3
    }
    
    func kick() -> Int {
        let totalDamage: Int = Int.random(in: 0...damage)
        return totalDamage
    }
}
