//
//  Wolverine.swift
//  FighterClubWithStudents
//
//  Created by Стефан  Миливоевич on 12.3.24..
//

import Foundation

final class Wolverine: Fighter, UltimateAbility {
    
    init(name: String) {
        super.init(name: name,
                   type: .ironMan,
                   strength: 8,
                   vitality: 3,
                   agility: 15)
    }
    
    func ultimateAbility() -> Int {
        return strength * 10
    }
 
}
