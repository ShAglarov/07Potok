//
//  TMNT.swift
//  FighterClubWithStudents
//
//  Created by Oleg Lesnoy on 30.03.2024.
//

import Foundation

final class TMNT: Fighter, UltimateAbility {
    
    init(name: String) {
        super.init(name: name,
                   type: .tmnt,
                   strength: 8,
                   vitality: 7,
                   agility: 7)
    }
    
    func ultimateAbility() -> Int {
        return Int.random(in: damage...damage * 3)
    }
}
