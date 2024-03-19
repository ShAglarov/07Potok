//
//  Godzila.swift
//  FighterClubWithStudents
//
//  Created by Игорь Крысин on 19.03.2024.
//

import Foundation

final class Godzila: Fighter, UltimateAbility {
    init(name: String) {
        super.init(name: name,
                   type: .godzila,
                   strength: 50,
                   vitality: 30,
                   agility: 1)
    }
    
    func ultimateAbility() -> Int {
        return 10
    }
}
