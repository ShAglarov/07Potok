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
    case godzila
    
    var multiply: (strength: Int, vitality: Int, agility: Int) {
        switch self {
        case .warrior: (10, 10, 2)
        case .dodger: (5, 5, 10)
        case .ironMan: (7,5,4)
        case .godzila: (50, 20, 1)
        }
    }
    
    var description: String {
        switch self {
        case .warrior: "Воин"
        case .dodger: "Ловкач"
        case .ironMan: "Железный человек"
        case .godzila: "годзила"
        }
    }
    
    var ultimateAbilityDescription: String {
        switch self {
        case .warrior: "впадает в ярость и бьет щитом 3 раза"
        case .dodger: "уворачивается от удара, и бьет ответный удар"
        case .ironMan: "может нанести супер удар и при этом теряет собственное здоровье"
        case .godzila:  "топает ногой и наносит урон сращ всем соперникам"
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
        case .godzila: Godzila(name: namingFighter())
        }
    }
}
