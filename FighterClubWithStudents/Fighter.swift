//
//  Fighter.swift
//  FighterClubWithStudents
//
//  Created by Shamil Aglarov on 11.03.2024.
//

import Foundation

protocol UltimateAbility {
    func ultimateAbility() -> Int
}

class Fighter {
    
    let name: String
    var type: TypeFighter
    
    private var _strength = Int()
    var strength: Int {
        get { return _strength }
        set {
            _strength = newValue
            damage = _strength * type.multiply.strength
        }
    }
    private var _vitality = Int()
    var vitality: Int {
        get { return _vitality }
        set {
            _vitality = newValue
            health = vitality * type.multiply.vitality
        }
    }
    private var _agility = Int()
    var agility: Int {
        get { return _agility}
        set {
            _agility = newValue
            chance = _agility * type.multiply.agility
        }
    }
    
    var delegate: IsDeadDelegate?
    
    var damage = Int()
    private var _health = Int()
    var health: Int {
        get { return _health }
        set {
            _health = newValue
            if _health <= 0 {
                delegate?.isDead()
            }
        }
    }
    var chance = Int()
    
    internal init(name: String, type: TypeFighter, strength: Int, vitality: Int, agility: Int) {
        self.name = name
        self.type = type
        self.vitality = vitality
        self.agility = agility
        self.strength = strength
    }
}
