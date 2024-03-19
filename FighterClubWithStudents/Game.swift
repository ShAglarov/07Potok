

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
        var maxPointsForFighter: Int = 10
        //MARK: идея передавать сюда количество бойцов, складывать их ы массив и гонять в цикле создавая каждый раз нового
        var countFighter: Int = 0
        while true {
            print("выберите кол-во бойцов на ринге")
            countFighter = Int(readLine() ?? "0") ?? 0
            if countFighter <= 0 {
                print("количество бойцов должно быть больше нуля")
                continue
            }
            break
        }
       
        var attempDistributionForFighter = 1 // попытки распределения очков для бойцов
        
        distributionPoints(player: player1, maxPoints: maxPointsForFighter)
        distributionPoints(player: player2, maxPoints: maxPointsForFighter)
//        while attempDistributionForFighter == countFighter {
//            
//            
//            print("ИГРОК 1 СОЗДАЕТ БОЙЦА")
//            player1 = selectedType()
//            player1?.delegate = self
//            print("ИГРОК 2 СОЗДАЕТ БОЙЦА")
//            //MARK: - реализовать раздачу очков бойцам и реализовать бойца Годзила
//            player2 = selectedType()
//            player2?.delegate = self
//        }
    }
    
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
