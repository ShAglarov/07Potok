//
//  Venom.swift
//  FighterClubWithStudents
//
//  Created by NIKITA NIKOLICH on 23.03.2024.
//

import Foundation

final class Venom: Fighter, UltimateAbility {
    
    init(name: String) {
        super.init(name: name,
                   type: .venom,
                   strength: 9,
                   vitality: 5,
                   agility: 8)
    }
    
    func ultimateAbility() -> Int {
        var damageAbility = 0
        if strength > agility {
            damageAbility = (damage * strength) / 2
        } else if agility > strength {
            damageAbility = damage * agility / 2
        } else if vitality > strength && vitality > agility {
            damageAbility = damage * vitality
            health += damageAbility
        }
        return damageAbility * 5
    }
    
    func kick() -> Int {
        let totalDamage: Int = Int.random(in: 0...damage)
        return totalDamage
    }
}
