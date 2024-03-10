

import Foundation


protocol UltimateAbility {
    func ultimateAbility() -> Int
}

protocol IsDeadDelegate {
    func isDead()
}

enum TypeFighter: CustomStringConvertible, CaseIterable {
    case warrior
    case dodger
    case ironMan
    
    var multiply: (strength: Int, vitality: Int, agility: Int) {
        switch self {
        case .warrior: (10, 10, 2)
        case .dodger: (5, 5, 10)
        case .ironMan: (7,5,4)
        }
    }
    
    var description: String {
        switch self {
        case .warrior: "Воин"
        case .dodger: "Ловкач"
        case .ironMan: "Железный человек"
        }
    }
    
    var ultimateAbilityDescription: String {
        switch self {
        case .warrior: "впадает в ярость и бьет щитом 3 раза"
        case .dodger: "уворачивается от удара, и бьет ответный удар"
        case .ironMan: "может нанести супер удар и при этом теряет собственное здоровье"
        }
    }
    
    // имя бойца
    private func namingFighter() -> String {
        print("Введите имя для своего боца")
        guard let nameFighter = readLine(),
              nameFighter != "" else { return namingFighter() }
        return nameFighter
    }
    
    var selectedType: Fighter {
        switch self {
        case .warrior: Warrior(name: namingFighter())
        case .dodger: Dodger(name: namingFighter())
        case .ironMan: IronMan(name: namingFighter())
        }
    }
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

final class Warrior: Fighter, UltimateAbility {
    
    init(name: String) {
        super.init(name: name, 
                   type: .warrior,
                   strength: 10,
                   vitality: 10,
                   agility: 0)
    }
    
    func ultimateAbility() -> Int {
        return damage * 3
    }
}

final class Dodger: Fighter, UltimateAbility {
    
    init(name: String) {
        super.init(name: name,
                   type: .dodger,
                   strength: 5,
                   vitality: 5,
                   agility: 10)
    }
    
    func ultimateAbility() -> Int {
        return 10
    }
}

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

final class Game {
    private var player1: Fighter?
    private var player2: Fighter?
    
    var isGameOver: Bool = false
    var round: Int = 1
    
    func startGame() {
        print("ИГРОК 1 СОЗДАЕТ БОЙЦА")
        player1 = selectedType()
        player1?.delegate = self
        print("ИГРОК 2 СОЗДАЕТ БОЙЦА")
        player2 = selectedType()
        player2?.delegate = self
    }
    
    func startFighting() {
        while !isGameOver {
            print("Для старта игры нажмите Enter", terminator: " ")
            let _ = readLine()
            print("Раунд - \(round)")
        }
    }
    
    // устанавливаем тип бойца
    private func typeFighter() -> TypeFighter {
        print("Выберите бойца ")
        TypeFighter.allCases.enumerated().map { "\($0.offset+1): \($0.element)"}.forEach { print($0) }
        
        guard let indexTypeFighter = Int(readLine() ?? "0"), indexTypeFighter <= TypeFighter.allCases.count else { return typeFighter() }
        return TypeFighter.allCases[indexTypeFighter-1]
    }
    // выбираем бойца
    func selectedType() -> Fighter {
        let typeFighter = typeFighter()

        return typeFighter.selectedType
    }
    
    func calculateDamage(agressor: Fighter, victim: Fighter) {
        
    }
}

extension Game: IsDeadDelegate {
    func isDead() {
        self.isGameOver = true
    }
}

let game = Game()

game.selectedType()
