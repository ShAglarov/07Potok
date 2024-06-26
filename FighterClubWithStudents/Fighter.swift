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

protocol FightAbility {
    func kick() -> Int
}

class Fighter: FightAbility, UltimateAbility {
    
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
    
    
    var damage = Int()
    private var _health = Int()
    var health: Int {
        get { return _health }
        set {
            _health = newValue
            if _health < 0 {
                _health = 0
            }
        }
    }
    var chance = Int()
    
    init(name: String, type: TypeFighter, strength: Int, vitality: Int, agility: Int) {
        self.name = name
        self.type = type
        self.vitality = vitality
        self.agility = agility
        self.strength = strength
    }
    init() {
        self.name = "noname"
        self.type = .warrior
        self.vitality = 0
        self.agility = 0
        self.strength = 0
    }
    
    func showStats() -> String {
        "У \(name) осталось жизней :\(health)"
    }
    
    func showStats2(){
        print("""
                Имя:\(name)\t\t\tКласс:\(type.description)
                Сила:\(strength)\t\t\tЛовкость:\(agility)
                Живучесть:\(vitality)\t\t\tУрон:\(damage)
                Шанс увернуться:\(chance)\t\t\tHP:\(health)
                Умение:\(type.ultimateAbilityDescription)
                """)
    }
    func kick() -> Int {return 0}
    func ultimateAbility() -> Int {return 0}
}
