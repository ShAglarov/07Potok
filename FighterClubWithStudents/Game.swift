//
//  Game.swift
//  FighterClubWithStudents
//
//  Created by Shamil Aglarov on 11.03.2024.
//

import Foundation

protocol IsDeadDelegate {
    func isDead()
}

final class Game {
    private var numberOfPlayers = 0 // количесвто игровок
    
    private var listOfPlayers = [Fighter?]()
    private var player1: Fighter?
    private var player2: Fighter?
    
    private let maxPoints = 10
    
    var isGameOver: Bool = false
    var round: Int = 1
    
//    func startGame() {
//        print("ИГРОК 1 СОЗДАЕТ БОЙЦА")
//        player1 = selectedType()
//        player1?.delegate = self
//        print("ИГРОК 2 СОЗДАЕТ БОЙЦА")
//        player2 = selectedType()
//        player2?.delegate = self
//    }
    
    func distributionPoints(player: Fighter?, maxPoints: Int) {
        //MARK: //как сюда затащить имя бойца введенное в терминале в TypeFighter method namingFighter?
        print("Добро пожаловать на ринг! \(String(describing: player?.name))")
        print(" \(player?.name ?? " ") Перед стартом битвы разделите очки умения персонажа")
        print("У вас \(maxPoints) очков, сколько очков вы распределите для силы")
        var choicePlayer = Int(readLine() ?? "0") ?? 0
        if isPointsMoreOrEqualMax(maxOint: maxPoints, choicePlayer: choicePlayer) {
            choicePlayer = maxPoints
            print("остальные умения распределяются по 0 очков")
            player?.agility = 0
            player?.vitality = 0
        }
        var remainPoints = maxPoints - choicePlayer
        print("У вас \(remainPoints) очков, сколько очков вы распределите для ловкости")
        choicePlayer = Int(readLine() ?? "0") ?? 0
        if isPointsMoreOrEqualMax(maxOint: maxPoints, choicePlayer: choicePlayer) {
            choicePlayer = maxPoints
            print("очки выносливости равны по 0 очков")
            
            player?.vitality = 0
        }
        remainPoints -= choicePlayer
        print("для выносливости осталось \(remainPoints) очков")
    }

    func isPointsMoreOrEqualMax(maxOint: Int, choicePlayer: Int) -> Bool {//бо льше ли выбранное кол-во очков максимального
        return choicePlayer >= maxOint
    }
    
    /// Функция реализует  выбор колличества игроков и присваивает это значени переменной numberOfPlayers.
    /// И создается выбранное количестов игроков
    func startGame() {
        print("Введите количество игроков (2 - n): ", terminator: "")
        guard let numPlayers = Int(readLine() ?? "0"),
              numPlayers >= 2 else {
            print("Некорректное количество игроков. Игроков не может быт меньшу двух. Повторите попытку")
            
            return startGame()
        }
        
        numberOfPlayers = numPlayers
        
        // Цикл добавляет в список созданных игроков
        for _ in 1...numberOfPlayers {
            let typeFighter = typeFighter()
            let figther = typeFighter.selectedType
            figther.delegate = self
            listOfPlayers.append(figther)
            distributionPoints(player: figther, maxPoints: maxPoints)
        }
    }
    
    
    /// В функции рандомно выбираются игроки для боя
    func randomFightersForBattle() {
        guard listOfPlayers.count >= 2 else {return}
        
        // рандомно выбираем индекв игрока
        let indexFighter1 = Int.random(in: 0..<listOfPlayers.count)
        var indexFighter2 = Int.random(in: 0..<listOfPlayers.count)
        
        // в цикле проверям чтобы боец не дрался сам с собой
        while indexFighter1 == indexFighter2 {
            indexFighter2 = Int.random(in: 0..<listOfPlayers.count)
        }
        
        let player1 = listOfPlayers[indexFighter1]
        let player2 = listOfPlayers[indexFighter2]
        
    }
    

    func startFighting() {
        while listOfPlayers.count > 1 {
            print("Для старта игры нажмите Enter", terminator: " ")
            
            let _ = readLine()
            
            print("Раунд - \(round)")
            
            // как минимум один игрок должен нанести 15 ударов
            for _ in 1...3 * listOfPlayers.count {
                    randomFightersForBattle()
            }
            round += 1
        }
        print("Победитель турнира: \(listOfPlayers[0]!.name)!")
    }
    
    // устанавливаем тип бойца
    private func typeFighter() -> TypeFighter {
        print("Выберите бойца ")
        TypeFighter.allCases.enumerated().map { "\($0.offset+1): \($0.element)"}.forEach { print($0) }
        
        guard let indexTypeFighter = Int(readLine() ?? "0"), indexTypeFighter <= TypeFighter.allCases.count else {
            return typeFighter()
        }
        return TypeFighter.allCases[indexTypeFighter-1]
    }
    // выбираем бойца
    func selectedType() -> Fighter {
        let typeFighter = typeFighter()

        return typeFighter.selectedType
    }
    
    func calculateDamage(agressor: Fighter, victim: Fighter) {
        let agressorDamage = agressor.damage
        if victim.chance > 50 {
            print("\(victim.name) увернулся от удара")
        } else {
            victim.health -= agressorDamage
        }
    }
}

extension Game: IsDeadDelegate {
    func isDead() {
        self.isGameOver = true
    }
}
