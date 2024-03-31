//
//  TypeFighter.swift
//  FighterClubWithStudents
//
//  Created by Shamil Aglarov on 11.03.2024.
//

import Foundation

enum TypeFighter: CustomStringConvertible, CaseIterable {
    case warrior
    case dodger
    case ironMan
    case venom
    case tmnt
    
    var multiply: (strength: Int, vitality: Int, agility: Int) {
        switch self {
        case .warrior: (10, 50, 2)
        case .dodger: (5, 30, 10)
        case .ironMan: (10,30,4)
        case .venom: (8, 30, 8)
        case .tmnt: (7, 40, 7)
        }
    }
    
    var description: String {
        switch self {
        case .warrior: "Воин"
        case .dodger: "Ловкач"
        case .ironMan: "Железный человек"
        case .venom: "Веном"
        case .tmnt: "Черепашка ниндзя"
        }
    }
    
    var ultimateAbilityDescription: String {
        switch self {
        case .warrior: "впадает в ярость и бьет щитом 3 раза"
        case .dodger: "уворачивается от удара, и бьет ответный удар"
        case .ironMan: "может нанести супер удар и при этом теряет собственное здоровье"
        case .venom: "превращает руки в живое оружие и быстро наносит 5 ударов"
        case .tmnt: "урон от удара увеличивается в 3 раза"
        }
    } 
    
    var ultimateKickDesctiption: String {
        switch self {
        case .warrior: "ударил щитом"
        case .dodger: "стрельнул из лука"
        case .ironMan: "стрельнул шаром"
        case .venom: "плюнул кислотой"
        case .tmnt: "нанёс уширо маваши гери"
        }
    }
    
    // имя бойца
    private func namingFighter() -> String {
        print("Введите имя для своего боца: ", terminator: "")
        guard let nameFighter = readLine(),
              nameFighter != "" else { return namingFighter() }
        return nameFighter
    }
    
    var selectedType: Fighter {
        switch self {
        case .warrior: Warrior(name: namingFighter())
        case .dodger: Dodger(name: namingFighter())
        case .ironMan: IronMan(name: namingFighter())
        case .venom: Venom(name: namingFighter())
        case .tmnt: TMNT(name: namingFighter())
        }
    }
}
