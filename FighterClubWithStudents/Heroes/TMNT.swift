//
//  TMNT.swift
//  FighterClubWithStudents
//
//  Created by Oleg Lesnoy on 30.03.2024.
//

import Foundation

final class TMNT: Fighter {
    
    init(name: String) {
        super.init(name: name,
                   type: .tmnt,
                   strength: 7,
                   vitality: 7,
                   agility: 7)
    }
    
    override func ultimateAbility() -> Int {
        return Int.random(in: 0...damage) * 3
    }
    
    override func kick() -> Int {
        return Int.random(in: 0...damage)
    }
}
