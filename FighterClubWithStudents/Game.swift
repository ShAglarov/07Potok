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
            } else if let tmnt = fighter as? TMNT {
                listOfPlayers.append(tmnt)
            }
        }
    }

    func randomFightersForBattle() {
        for (index, value) in listOfPlayers.enumerated() {
            guard let fighter = value else { return }
            if fighter.health <= 0 {
                listOfPlayers.remove(at: index)
                print("----------- Боец \(fighter.name) погиб -----------")
                
                print("Для продолжения боя, жмите Enter")
                let _ = readLine()
            }
        }
        guard listOfPlayers.count >= 2 else { return }

        let indexFighter1 = Int.random(in: 0..<listOfPlayers.count)
        var indexFighter2 = Int.random(in: 0..<listOfPlayers.count)

        while indexFighter1 == indexFighter2 {
            indexFighter2 = Int.random(in: 0..<listOfPlayers.count)
        }
        
        calculateDamage(agressor: listOfPlayers[indexFighter1] ?? Fighter(),
                        victim: listOfPlayers[indexFighter2] ?? Fighter())
    }

    func startFighting() {
        listOfPlayers.forEach { fighter in
            fighter?.showStats2()
            print()
        }
        print("Бой начался! \n ")
        //let _ = readLine()
        
        sleep(2)

        while listOfPlayers.count > 1 {
            //let _ = readLine()
            print("Раунд - \(round)")

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
        let maxChance = Int.random(in: 1...500)
        if let warrior = agressor as? Warrior {
            if (victim.chance > Int.random(in: 1..<maxChance)) {
                print(" \(warrior.name) хотел ударить, но \(victim.name) увернулся от удара")
                print(victim.showStats())
            } else if (victim.chance < warrior.chance)  {
                let damage = warrior.kick()
                victim.health -= damage
                print("\(warrior.name) напал на \(victim.name) и \(warrior.type.ultimateKickDesctiption) тем самым нанес ему \(damage) урона")
                print(victim.showStats())
            } else {
                let ultimateDamage = warrior.ultimateAbility()
                victim.health -= ultimateDamage
                print("\(warrior.name) напал на \(victim.name) и \(warrior.type.ultimateAbilityDescription) тем самым нанес ему \(ultimateDamage) урона")
                print(victim.showStats())
            }
        } else if let dodger = agressor as? Dodger {
            if (victim.chance > Int.random(in: 0..<maxChance)) {
                print(" \(dodger.name) хотел ударить, но \(victim.name) увернулся от удара")
                print(victim.showStats())
            } else if (victim.chance < dodger.chance)  {
                let damage = dodger.kick()
                victim.health -= damage
                print("\(dodger.name) напал на \(victim.name) и \(dodger.type.ultimateKickDesctiption) тем самым нанес ему \(damage) урона")
                print(victim.showStats())
            } else {
                let ultimateDamage = dodger.ultimateAbility()
                victim.health -= ultimateDamage
                print("\(dodger.name) напал на \(victim.name) и \(dodger.type.ultimateAbilityDescription) тем самым нанес ему \(ultimateDamage) урона")
                print(victim.showStats())
            }
        } else if let ironMan = agressor as? Dodger {
            if (victim.chance > Int.random(in: 1..<maxChance)) {
                print(" \(ironMan.name) хотел ударить, но \(victim.name) увернулся от удара")
                print(victim.showStats())
            } else if (victim.chance < ironMan.chance)  {
                let damage = ironMan.kick()
                victim.health -= damage
                print("\(ironMan.name) напал на \(victim.name) и \(ironMan.type.ultimateKickDesctiption) тем самым нанес ему \(damage) урона")
                print(victim.showStats())
            } else {
                let ultimateDamage = ironMan.ultimateAbility()
                victim.health -= ultimateDamage
                print("\(ironMan.name) напал на \(victim.name) и \(ironMan.type.ultimateAbilityDescription) тем самым нанес ему \(ultimateDamage) урона")
                print(victim.showStats())
            }
        } else if let venom = agressor as? IronMan {
            if (victim.chance > Int.random(in: 1..<maxChance)) {
                print(" \(venom.name) хотел ударить, но \(victim.name) увернулся от удара")
            } else if (victim.chance < venom.chance)  {
                let damage = venom.kick()
                victim.health -= damage
                print("\(venom.name) напал на \(victim.name) и \(venom.type.ultimateKickDesctiption) тем самым нанес ему \(damage) урона")
                print(victim.showStats())
            } else {
                let ultimateDamage = venom.ultimateAbility()
                victim.health -= ultimateDamage
                print("\(venom.name) напал на \(victim.name) и \(venom.type.ultimateAbilityDescription) тем самым нанес ему \(ultimateDamage) урона")
                print(victim.showStats())
            }
        }
    }
}
