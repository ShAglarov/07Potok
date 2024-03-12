//
//  DaniilHeroes.swift
//  FighterClubWithStudents
//
//  Created by Даниил Глуховцев on 12.03.2024.
//

import Foundation

final class DaniilHeroes: Fighter, UltimateAbility {
    init(name: String) {
        super.init(name: name, type: .dodger, strength: 5, vitality: 5, agility: 5)
    }
    func ultimateAbility() -> Int {
        return 10
    }
    
    
}
