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
    private var player1: Fighter?
    private var player2: Fighter?
    
    var isGameOver: Bool = false
    var round: Int = 1
    
    func startGame() {
        print("ИГРОК 1 СОЗДАЕТ БОЙЦА")
        player1 = selectedType()
        player1?.delegate = self
        print("ИГРОК 2 СОЗДАЕТ БОЙЦА")
        //MARK: - реализовать раздачу очков бойцам и реализовать бойца Годзила
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
