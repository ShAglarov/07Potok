//
//  main.swift
//  01022024-ErrorNil
//
//  Created by Shamil Aglarov on 01.02.2024.
//

import Foundation
//



//enum ActionsWithCar {
//    case startEngine
//    case stopEngine
//    case openWindows
//    case closeWindows
//    case loadUnloadCar(volume: Float)
//}
//
//
//struct SportCar {
//    let carBrand: String
//    let year: String
//    let trunkOrBodyVolume: Float
//    var currentTrunkVolume: Float = 0
//    var isStartedEngine: Bool = false
//    var isOpenWindow: Bool = true
//    
//    
//    mutating func changesVehicleProperties(for action: ActionsWithCar) {
//        switch action {
//            case .startEngine:
//                if isStartedEngine {
//                    print("Двигатель уже запущен")
//                } else {
//                    isStartedEngine = true
//                    print("Двигатель запущен")
//                }
//            case .stopEngine:
//                if !isStartedEngine {
//                    print("Двигатель уже заглушен")
//                } else {
//                    isStartedEngine = false
//                    print("Двигатель заглушен")
//                }
//            case .openWindows:
//                if isOpenWindow {
//                    print("Окна уже открыты")
//                } else {
//                    isOpenWindow = true
//                    print("Окна открыты")
//                }
//            case .closeWindows:
//                if !isOpenWindow {
//                    print("Окна уже закрыты")
//                } else {
//                    isOpenWindow = false
//                    print("Окна закрыты")
//                }
//            case .loadUnloadCar(let volume):
//                if volume <= trunkOrBodyVolume  && volume > 0{
//                    currentTrunkVolume += volume
//                    print("Вы загрузили \((volume / trunkOrBodyVolume) * 100)% от допустимого объема")
//                    print("Вам еще доступно \(trunkOrBodyVolume - currentTrunkVolume) литра/ов")
//                } else if volume == 0 {
//                    print("Вы ничего не загрузили")
//                } else if volume < 0 && currentTrunkVolume == 0 {
//                    print("Выгружать нечего")
//                } else if volume < 0 && currentTrunkVolume > 0 {
//                    if currentTrunkVolume + volume < 0 {
//                        print("Вы пытаетсь выгрузить больше чем доступно")
//                        print("Доступно для выгрузки \(currentTrunkVolume)")
//                    } else {
//                        currentTrunkVolume += volume
//                        print("Вы выгрузили \(volume) литров")
//                        print("Осталось \(currentTrunkVolume)")
//                    }
//                } else {
//                    print("Вы пытаетсь загрузсь больш допустимого объема")
//                    print("Объем Ваше багажника составляет \(trunkOrBodyVolume) литров")
//                }
//        }
//        
//        printingParameters()
//    
//    }
//    
//    func printingParameters() {
//        print("Текущие параметры \(carBrand):")
//        print("\tГод выпуска: \(year)")
//        print("\tОбъем багажника\\кузова: \(trunkOrBodyVolume)")
//        print("\tБагажник заполнен на \((currentTrunkVolume / trunkOrBodyVolume) * 100)% (\(currentTrunkVolume)л.)")
//        
//        if isStartedEngine {
//            print("\tСтатус двигателя: запущен")
//        } else {
//            print("\tСтатус двигателя: не запущен")
//        }
//        
//        if isOpenWindow {
//            print("\tСостояние окон: открыты")
//        } else {
//            print("\tСостояние окон: закрыты")
//        }
//    }
//}
//
//
//struct TrukCar {
//    let carBrand: String
//    let year: String
//    let trunkOrBodyVolume: Float
//    var currentTrunkVolume: Float = 0
//    var isStartedEngine: Bool
//    var isOpenWindow: Bool
//    
//    mutating func changesVehicleProperties(for action: ActionsWithCar) {
//        switch action {
//            case .startEngine:
//                if isStartedEngine {
//                    print("Двигатель уже запущен")
//                } else {
//                    isStartedEngine = true
//                    print("Двигатель запущен")
//                }
//            case .stopEngine:
//                if !isStartedEngine {
//                    print("Двигатель уже заглушен")
//                } else {
//                    isStartedEngine = false
//                    print("Двигатель заглушен")
//                }
//            case .openWindows:
//                if isOpenWindow {
//                    print("Окна уже открыты")
//                } else {
//                    isOpenWindow = true
//                    print("Окна открыты")
//                }
//            case .closeWindows:
//                if !isOpenWindow {
//                    print("Окна уже закрыты")
//                } else {
//                    isOpenWindow = false
//                    print("Окна закрыты")
//                }
//            case .loadUnloadCar(let volume):
//                if volume <= trunkOrBodyVolume  && volume > 0{
//                    currentTrunkVolume += volume
//                    print("Вы загрузили \((volume / trunkOrBodyVolume) * 100)% от допустимого объема")
//                    print("Вам еще доступно \(trunkOrBodyVolume - currentTrunkVolume) литра/ов")
//                } else if volume == 0 {
//                    print("Вы ничего не загрузили")
//                } else if volume < 0 && currentTrunkVolume == 0 {
//                    print("Выгружать нечего")
//                } else if volume < 0 && currentTrunkVolume > 0 {
//                    if currentTrunkVolume + volume < 0 {
//                        print("Вы пытаетсь выгрузить больше чем доступно")
//                        print("Доступно для выгрузки \(currentTrunkVolume)")
//                    } else {
//                        currentTrunkVolume += volume
//                        print("Вы выгрузили \(volume) литров")
//                        print("Осталось \(currentTrunkVolume)")
//                    }
//                } else {
//                    print("Вы пытаетсь загрузсь больш допустимого объема")
//                    print("Объем Ваше багажника составляет \(trunkOrBodyVolume) литров")
//                }
//        }
//        
//        printingParameters()
//    }
//    
//    func printingParameters() {
//        print("Текущие параметры \(carBrand):")
//        print("\tГод выпуска: \(year)")
//        print("\tОбъем багажника\\кузова: \(trunkOrBodyVolume)")
//        print("\tБагажник заполнен на \((currentTrunkVolume / trunkOrBodyVolume) * 100)% (\(currentTrunkVolume)л.)")
//        
//        if isStartedEngine {
//            print("\tСтатус двигателя: запущен")
//        } else {
//            print("\tСтатус двигателя: не запущен")
//        }
//        
//        if isOpenWindow {
//            print("\tСостояние окон: открыты")
//        } else {
//            print("\tСостояние окон: закрыты")
//        }
//    }
//}
//
//
//var bmw = SportCar(carBrand: "BMW", year: "2023", trunkOrBodyVolume: 300, isStartedEngine: false, isOpenWindow: false)
//var man = TrukCar(carBrand: "MAN", year: "2023", trunkOrBodyVolume: 900, isStartedEngine: false, isOpenWindow: false)
//
//
//bmw.changesVehicleProperties(for: .stopEngine)
//bmw.changesVehicleProperties(for: .startEngine)
//bmw.changesVehicleProperties(for: .startEngine)
//bmw.changesVehicleProperties(for: .openWindows)
//bmw.changesVehicleProperties(for: .loadUnloadCar(volume: 246))
//bmw.changesVehicleProperties(for: .loadUnloadCar(volume: -300))
//bmw.changesVehicleProperties(for: .stopEngine)
//bmw.changesVehicleProperties(for: .closeWindows)
//
//print(String(repeating: "-", count: 100), "\n")
//
//man.changesVehicleProperties(for: .stopEngine)
//man.changesVehicleProperties(for: .startEngine)
//man.changesVehicleProperties(for: .startEngine)
//man.changesVehicleProperties(for: .openWindows)
//man.changesVehicleProperties(for: .loadUnloadCar(volume: 246))
//man.changesVehicleProperties(for: .loadUnloadCar(volume: -240))
//man.changesVehicleProperties(for: .stopEngine)
//man.changesVehicleProperties(for: .closeWindows)

enum ModelsCar {
    case Tesla
    case Volva
    case BMW
    case Mersedes
}

enum ActionsWithCar {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadUnloadCar(volume: Float)
}

protocol Vehicle {
    var carBrand: ModelsCar { get }
    var year: String { get }
    var trunkOrBodyVolume: Float { get }
    var currentTrunkVolume: Float { get set }
    var isStartedEngine: Bool { get set }
    var isOpenWindow: Bool { get set }
    var isMoving: Bool { get }
    
    mutating func performAction(_ action: ActionsWithCar)
    func printVehicleParameters()
}

protocol VehicleAction {
    var failureMessage: String { get }
    mutating func canPerform(on vehicle: Vehicle) -> Bool
    func performAction(on vehicle: inout Vehicle)
}

protocol VehicleActionWithParameter {
    var failureMessage: String { get set }
    mutating func canPerform(on vehicle: Vehicle, volume: Float) -> Bool
    func performAction(on vehicle: inout Vehicle, volume: Float)
}

struct StartEngineAction: VehicleAction {
    var failureMessage: String = "Двигатель уже запущен"
    
    mutating func canPerform(on vehicle: Vehicle) -> Bool {
        return !vehicle.isStartedEngine
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.isStartedEngine = true
        print("Двигатель запущен")
    }
}

struct StopEngineAction: VehicleAction {
    var failureMessage: String = "Двигатель уже остановлен"
    
    mutating func canPerform(on vehicle: Vehicle) -> Bool {
        return vehicle.isStartedEngine
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.isStartedEngine = false
        print("Двигатель остановлен")
    }
}

struct OpenWindowsAction: VehicleAction {
    var failureMessage: String = "Окна уже открыты"
    
    mutating func canPerform(on vehicle: Vehicle) -> Bool {
        !vehicle.isOpenWindow
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.isOpenWindow = true
        print("Окна открыты")
    }
}

struct LoadUnloadCarAction: VehicleActionWithParameter {
    var failureMessage: String = "Операция невозможна"
    
    mutating func canPerform(on vehicle: Vehicle, volume: Float) -> Bool {
        if vehicle.isMoving {
            failureMessage = "Операция невозможна: автомобиль находится в движении"
            return false
        }
        if volume > 0 && (vehicle.currentTrunkVolume + volume > vehicle.trunkOrBodyVolume) {
            failureMessage = "Превышен допустимый объем багажника"
            return false
        }
        if volume < 0 && abs(volume) > vehicle.currentTrunkVolume {
            failureMessage = "Невозможно выгрузить больше, чем загружено"
            return false
        }
        return true
    }
    
    func performAction(on vehicle: inout Vehicle, volume: Float) {
        if volume > 0 {
            vehicle.currentTrunkVolume += volume
            print("Загружено \(volume) л. Объем груза: \(vehicle.currentTrunkVolume) л.")
        } else {
            vehicle.currentTrunkVolume += volume // Уже проверили, что выгрузка возможна
            print("Выгружено \(abs(volume)) л. Текущий объем груза: \(vehicle.currentTrunkVolume) л.")
        }
    }
}

struct VehicleActionHandler {
    static func performAction(_ action: ActionsWithCar, on vehicle: inout Vehicle) {
        switch action {
        case .startEngine:
            StartEngineAction().performAction(on: &vehicle)
        case .stopEngine:
            StopEngineAction().performAction(on: &vehicle)
        case .openWindows:
            OpenWindowsAction().performAction(on: &vehicle)
        case .closeWindows: break
            // Должен быть реализован CloseWindowsAction аналогично OpenWindowsAction
        case .loadUnloadCar(let volume):
            var action = LoadUnloadCarAction()
            action.performAction(on: &vehicle, volume: volume)
        }
    }
}

struct SportCar: Vehicle {
    var isMoving: Bool = false
    
    let carBrand: ModelsCar
    let year: String
    let trunkOrBodyVolume: Float
    var currentTrunkVolume: Float
    var isStartedEngine: Bool
    var isOpenWindow: Bool
    
    mutating func performAction(_ action: ActionsWithCar) {
        VehicleActionHandler.performAction(action, on: &self)
    }
    
    func printVehicleParameters() {
        print("Brand: \(carBrand)")
        print("Year: \(year)")
        print("Trunk Volume: \(trunkOrBodyVolume)")
        print("Current Trunk Load: \(currentTrunkVolume)")
        print("Engine Started: \(isStartedEngine)")
        print("Windows Open: \(isOpenWindow)")
        print("Is Moving: \(isMoving)")
    }
}

extension SportCar {
    
}

var myCar = SportCar(isMoving: false, carBrand: .Tesla, year: "2022", trunkOrBodyVolume: 500, currentTrunkVolume: 0, isStartedEngine: false, isStopedEnigine: true, isOpenWindow: false)

// Выполнение различных действий
VehicleActionHandler.performAction(.startEngine, on: &myCar)
VehicleActionHandler.performAction(.stopEngine, on: &myCar)
VehicleActionHandler.performAction(.openWindows, on: &myCar)
VehicleActionHandler.performAction(.loadUnloadCar(volume: 100), on: &myCar)

// Печать текущих параметров автомобиля
myCar.printVehicleParameters()
