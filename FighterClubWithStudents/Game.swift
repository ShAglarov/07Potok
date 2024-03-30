//
//  Game.swift
//  FighterClubWithStudents
//
//  Created by Shamil Aglarov on 11.03.2024.
//

import Foundation

final class Game {
    private var numberOfPlayers = 0
    private var listOfPlayers = [Fighter?]()
    private let maxPoints = 10
    var isGameOver: Bool = false
    var round: Int = 1
    let welcome = "Добро пожаловать на ринг!"
    let errorPoints = "Вы ввели некорректное значение"

    func distributionPoints(for player: inout Fighter?, maxPoints: Int, message: String) {
        print("\(message)! \(player?.name ?? "")")
        print("\(player?.name ?? "") Перед стартом битвы разделите очки умения персонажа")
        print("У вас \(maxPoints) очков, сколько очков вы распределите для силы")

        var remainPoints = maxPoints

        while remainPoints > 0 {
            guard let choicePlayer = Int(readLine() ?? "0"), choicePlayer <= remainPoints else {
                print(errorPoints)
                continue
            }
            
            player?.strength += choicePlayer
            remainPoints -= choicePlayer

            if remainPoints <= 0 {
                break
            }

            print("У вас \(remainPoints) очков, сколько очков вы распределите для ловкости")
            guard let agilityInput = readLine(), let agilityPoints = Int(agilityInput), agilityPoints <= remainPoints else {
                print(errorPoints)
                continue
            }

            player?.agility += agilityPoints
            remainPoints -= agilityPoints

            if remainPoints <= 0 {
                break
            }

            print("У вас \(remainPoints) очков, сколько очков вы распределите для выносливости")
            guard let vitalityInput = readLine(), let vitalityPoints = Int(vitalityInput), vitalityPoints <= remainPoints else {
                print(errorPoints)
                continue
            }

            player?.vitality += vitalityPoints
            remainPoints -= vitalityPoints
        }
    }

    func startGame() {
        var numPlayers = 0
        while numPlayers < 2 {
            print("Введите количество игроков (минимум 2): ", terminator: "")
            guard let input = readLine(), let players = Int(input), players >= 2 else {
                print("Некорректное количество игроков. Игроков не может быть меньше двух. Повторите попытку")
                continue
            }
            numPlayers = players
        }
        
        numberOfPlayers = numPlayers

        for _ in 1...numberOfPlayers {
            let typeFighter = chooseFighter()
            var fighter: Fighter? = typeFighter.selectedType
            distributionPoints(for: &fighter, maxPoints: maxPoints, message: welcome)

            if let warrior = fighter as? Warrior {
                listOfPlayers.append(warrior)
            } else if let dodger = fighter as? Dodger {
                listOfPlayers.append(dodger)
            } else if let ironMan = fighter as? IronMan {
                listOfPlayers.append(ironMan)
            } else if let venom = fighter as? Venom {
                listOfPlayers.append(venom)
            }
        }
    }

    func randomFightersForBattle() {
        for (index, value) in listOfPlayers.enumerated() {
            guard let fighter = value else { return }
            if fighter.health <= 0 {
                listOfPlayers.remove(at: index)
                print("Боец \(fighter.name) погиб ")
            }
        }
        guard listOfPlayers.count >= 2 else { return }

        let indexFighter1 = Int.random(in: 0..<listOfPlayers.count)
        var indexFighter2 = Int.random(in: 0..<listOfPlayers.count)

        while indexFighter1 == indexFighter2 {
            indexFighter2 = Int.random(in: 0..<listOfPlayers.count)
        }
        
        let player1 = listOfPlayers[indexFighter1] ?? Fighter()
        let player2 = listOfPlayers[indexFighter2] ?? Fighter()
        calculateDamage(agressor: player1, victim: player2)
    }

    func startFighting() {
        listOfPlayers.forEach { fighter in
            fighter?.showStats2()
            print()
        }
        print("Для старта игры нажмите Enter", terminator: " ")
        let _ = readLine()

        while listOfPlayers.count > 1 {
            let _ = readLine()
            print("Раунд - \(round)")
            listOfPlayers.forEach { print("Имя \($0?.name ?? ""), осталось жизней\($0?.health ?? 0)") }

            for _ in 1...(3 * listOfPlayers.count) {
                randomFightersForBattle()
            }

            round += 1
        }

        print("Победитель турнира: \(listOfPlayers[0]?.name ?? "" )!")
    }
    
    private func chooseFighter() -> TypeFighter {
        print("Выберите бойца ")
        TypeFighter.allCases.enumerated().map { "\($0.offset+1): \(($0.element, $0.element.ultimateAbilityDescription))\n"}.forEach { print($0) }
        
        guard let indexTypeFighter = Int(readLine() ?? "0"), indexTypeFighter <= TypeFighter.allCases.count else {
            return chooseFighter()
        }
        return TypeFighter.allCases[indexTypeFighter-1]
    }
    
    func calculateDamage(agressor: Fighter, victim: Fighter) {
        if let warrior = agressor as? Warrior {
            let maxChance = (agressor.chance+1) * agressor.damage
            if (victim.chance > Int.random(in: 1..<maxChance)) {
                print(" \(warrior.name) хотел ударить, но \(victim.name) увернулся от удара")
            } else if (victim.chance < warrior.chance)  {
                let damage = warrior.kick()
                victim.health -= damage
                print("\(warrior.name) \(warrior.type.ultimateKickDesctiption) и нанес \(damage) урона")
            } else {
                print("\(warrior.name) \(warrior.type.ultimateAbilityDescription)")
                let ultimateDamage = warrior.ultimateAbility()
                victim.health -= ultimateDamage
            }
        } else if let dodger = agressor as? Dodger {
            let maxChance = (agressor.chance+1) * agressor.damage
            if (victim.chance > Int.random(in: 1..<maxChance)) {
                print(" \(dodger.name) хотел ударить, но \(victim.name) увернулся от удара")
            } else if (victim.chance < dodger.chance)  {
                let damage = dodger.kick()
                victim.health -= damage
                print("\(dodger.name) \(dodger.type.ultimateKickDesctiption) и нанес \(damage) урона")
            } else {
                print("\(dodger.name) \(dodger.type.ultimateAbilityDescription)")
                let ultimateDamage = dodger.ultimateAbility()
                victim.health -= ultimateDamage
            }
        } else if let ironMan = agressor as? Dodger {
            let maxChance = (agressor.chance+1) * agressor.damage
            if (victim.chance > Int.random(in: 1..<maxChance)) {
                print(" \(ironMan.name) хотел ударить, но \(victim.name) увернулся от удара")
            } else if (victim.chance < ironMan.chance)  {
                let damage = ironMan.kick()
                victim.health -= damage
                print("\(ironMan.name) \(ironMan.type.ultimateKickDesctiption) и нанес \(damage) урона")
            } else {
                print("\(ironMan.name) \(ironMan.type.ultimateAbilityDescription)")
                let ultimateDamage = ironMan.ultimateAbility()
                victim.health -= ultimateDamage
            }
        } else if let venom = agressor as? IronMan {
            let maxChance = (agressor.chance+1) * agressor.damage
            if (victim.chance > Int.random(in: 1..<maxChance)) {
                print(" \(venom.name) хотел ударить, но \(victim.name) увернулся от удара")
            } else if (victim.chance < venom.chance)  {
                let damage = venom.kick()
                victim.health -= damage
                print("\(venom.name) \(venom.type.ultimateKickDesctiption) и нанес \(damage) урона")
            } else {
                print("\(venom.name) \(venom.type.ultimateAbilityDescription)")
                let ultimateDamage = venom.ultimateAbility()
                victim.health -= ultimateDamage
            }
        }
    }
}
