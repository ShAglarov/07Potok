//
//  Dodger.swift
//  FighterClubWithStudents
//
//  Created by Shamil Aglarov on 11.03.2024.
//

import Foundation

final class Dodger: Fighter, UltimateAbility {
    
    init(name: String) {
        super.init(name: name,
                   type: .dodger,
                   strength: 5,
                   vitality: 5,
                   agility: 10)
    }
    
    func ultimateAbility() -> Int {
        return 10
    }
    
    func kick() -> Int {
        let totalDamage: Int = Int.random(in: 0...damage)
        return totalDamage
    }
}
