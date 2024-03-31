//
//  IronMan.swift
//  FighterClubWithStudents
//
//  Created by Shamil Aglarov on 11.03.2024.
//

import Foundation

final class IronMan: Fighter, UltimateAbility {
    
    init(name: String) {
        super.init(name: name,
                   type: .ironMan,
                   strength: 5,
                   vitality: 8,
                   agility: 10)
    }
    
    func ultimateAbility() -> Int {
        return Int.random(in: damage...damage+health)
    }
    
    func kick() -> Int {
        let totalDamage: Int = Int.random(in: 0...damage)
        return totalDamage
    }
}
