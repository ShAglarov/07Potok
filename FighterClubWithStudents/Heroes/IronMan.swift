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
                   vitality: 5,
                   agility: 10)
    }
    
    func ultimateAbility() -> Int {
        return 10
    }
}
