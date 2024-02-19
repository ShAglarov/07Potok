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
    var isStopedEnigine: Bool { get set }
    var isOpenWindow: Bool { get set }
    
    mutating func performAction(_ action: ActionsWithCar)
    func printVehicleParameters()
}

protocol VehicleAction {
    static func perform(on vehicle: inout Vehicle, 
                        withVolume volume: Float?)
}

struct VehicleActionHandler {
    static func performAction(_ action: ActionsWithCar, on vehicle: inout Vehicle) {
        switch action {
        case .startEngine:
            StartEngineAction.perform(on: &vehicle)
        case .stopEngine:
            StopEngineAction.perform(on: &vehicle)
        case .openWindows: break
            //OpenWindowsAction.perform(on: &vehicle)
        case .closeWindows: break
            //CloseWindowsAction.perform(on: &vehicle)
        case .loadUnloadCar(let volume):
            LoadUnloadCarAction.perform(on: &vehicle, withVolume: volume)
        }
    }
}

struct StartEngineAction: VehicleAction {
    static func perform(on vehicle: inout Vehicle, withVolume volume: Float? = nil) {
        guard !vehicle.isStartedEngine else {
            print("Двигатель уже работает")
            return
        }
        vehicle.isStartedEngine = true
        vehicle.isStopedEnigine = true
        print("Двигатель запустился")
    }
}

struct StopEngineAction: VehicleAction {
    static func perform(on vehicle: inout Vehicle, withVolume volume: Float? = nil) {
        guard !vehicle.isStopedEnigine else {
            print("Двигатель уже был заглушен")
            return
        }
        
        vehicle.isStopedEnigine = true
        print("Вы заглушили двигатель")
    }
}

struct OpenWindowsAction: VehicleAction {
    static func perform(on vehicle: inout Vehicle, withVolume volume: Float?) {
        guard !vehicle.isStopedEnigine else {
            print("Двигатель уже был заглушен")
            return
        }
    }
}

struct SportCar: Vehicle {
    
    let carBrand: ModelsCar
    let year: String
    let trunkOrBodyVolume: Float
    var currentTrunkVolume: Float = 0
    var isStartedEngine: Bool = false
    var isStopedEnigine: Bool = false
    var isOpenWindow: Bool = false
    
    mutating func performAction(_ action: ActionsWithCar) {
        // Determine which action to perform and call the corresponding action interface
    }
    
    func printVehicleParameters() {
        // Implementation remains the same
    }
}

struct LoadUnloadCarAction: VehicleAction {
    static func perform(on vehicle: inout Vehicle, withVolume volume: Float? = nil) {
        guard let volume = volume else { return }
        
        let newVolume = vehicle.currentTrunkVolume + volume
        if newVolume >= 0 && newVolume <= vehicle.trunkOrBodyVolume {
            vehicle.currentTrunkVolume = newVolume
            print("Объём груза обновлен. Текущий объем: \(vehicle.currentTrunkVolume).")
        } else {
            print("Неверная операция. Громкость за пределами.")
        }
    }
}


var mySportCar: Vehicle = SportCar(carBrand: .Tesla, year: "2021", trunkOrBodyVolume: 500)
VehicleActionHandler.performAction(.startEngine, on: &mySportCar)
VehicleActionHandler.performAction(.startEngine, on: &mySportCar)
VehicleActionHandler.performAction(.stopEngine, on: &mySportCar)
VehicleActionHandler.performAction(.loadUnloadCar(volume: 100), on: &mySportCar)
