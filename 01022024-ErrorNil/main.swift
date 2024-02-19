

import Foundation

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
    var isMoving: Bool { get }
    
    mutating func performAction(_ action: ActionsWithCar)
}

protocol VehicleAction {
    var successMessage: String { get }
    var failureMessage: String { get }
    func canPerform(on vehicle: Vehicle) -> Bool
    func performAction(on vehicle: inout Vehicle)
}

protocol VehicleActionWithParameter {
    var successMessage: String { get }
    var failureMessage: String { get }
    mutating func canPerform(on vehicle: Vehicle) -> Bool
    mutating func performAction(on vehicle: inout Vehicle, volume: Float)
}

extension VehicleAction {
    func perform(on vehicle: inout Vehicle) {
        if canPerform(on: vehicle) {
            performAction(on: &vehicle)
            print(successMessage)
        } else {
            print(failureMessage)
        }
    }
}

struct VehicleActionHandler {
     func performAction(_ action: ActionsWithCar, on vehicle: inout Vehicle) {
        switch action {
        case .startEngine:
            StartEngineAction().perform(on: &vehicle)
        case .stopEngine:
            StopEngineAction().perform(on: &vehicle)
        case .openWindows:
            OpenWindowsAction().perform(on: &vehicle)
        case .closeWindows: break
            //CloseWindowsAction().perform(on: &vehicle)
        case .loadUnloadCar(let volume):
            var loadUnloadAction = LoadUnloadCarAction()
            loadUnloadAction.performAction(on: &vehicle, volume: volume)
        }
    }
}

struct StartEngineAction: VehicleAction {
    var successMessage: String = "Завел двигатель"
    var failureMessage: String = "Двигатель уже заведен"
    
    func canPerform(on vehicle: Vehicle) -> Bool {
        return !vehicle.isStartedEngine
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.isStartedEngine = true
    }
}

struct StopEngineAction: VehicleAction {
    var successMessage: String = "Заглушил двигатель"
    var failureMessage: String = "Двигатель уже был заглушен"
    
    func canPerform(on vehicle: Vehicle) -> Bool {
        !vehicle.isStartedEngine
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.isStartedEngine = true
    }
}

struct OpenWindowsAction: VehicleAction {
    var successMessage: String = "Открыл двери"
    var failureMessage: String = "Двери уже были открыты"
    
    func canPerform(on vehicle: Vehicle) -> Bool {
        !vehicle.isOpenWindow
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.isOpenWindow = true
    }
}

struct SportCar: Vehicle {
    var isMoving: Bool
    
    
    let carBrand: ModelsCar
    let year: String
    let trunkOrBodyVolume: Float
    var currentTrunkVolume: Float = 0
    var isStartedEngine: Bool = false
    var isStopedEnigine: Bool = false
    var isOpenWindow: Bool = false
    
    mutating func performAction(_ action: ActionsWithCar) {}
}

struct LoadUnloadCarAction: VehicleActionWithParameter {
    var successMessage = "Операция загрузки/выгрузки прошла успешна"
    var failureMessage = String()
    
    mutating func canPerform(on vehicle: Vehicle) -> Bool {
        if vehicle.isMoving {
            failureMessage = "Операция невозможна: автомобиль находится в движении"
            return false
        }
        return true
    }
    
    mutating func canPerform(on vehicle: Vehicle, volume: Float) -> Bool {
        if volume > 0 {
            if vehicle.currentTrunkVolume + volume > vehicle.trunkOrBodyVolume {
                failureMessage = "Превышен допустимый объем багажника"
                return false
            }
        } else if volume < 0 {
            let unloadVolume = abs(volume)
            if vehicle.currentTrunkVolume < unloadVolume {
                failureMessage = "Невозможно выгрузить больше, чем загружено"
                return false
            }
        } else {
            failureMessage = "Объем для загрузки/выгрузки не указан"
            return false
        }
        return true
    }
    
    mutating func performAction(on vehicle: inout Vehicle, volume: Float) {
        if canPerform(on: vehicle, volume: volume) {
            if volume > 0 {
                vehicle.currentTrunkVolume += volume
                print("Загружено \(volume) л. Объем груза: \(vehicle.currentTrunkVolume) л.")
            } else {
                let unloadVolume = abs(volume)
                vehicle.currentTrunkVolume -= unloadVolume
                print("Выгружено \(unloadVolume) л. Текущий объем груза: \(vehicle.currentTrunkVolume) л.")
            }
        } else {
            print(failureMessage)
        }
    }
}

func startGame(car: inout Vehicle, vehicleHandler: VehicleActionHandler) {
    vehicleHandler.performAction(.startEngine, on: &car)
    vehicleHandler.performAction(.stopEngine, on: &car)
    vehicleHandler.performAction(.openWindows, on: &car)
    vehicleHandler.performAction(.loadUnloadCar(volume: 100), on: &car)
    vehicleHandler.performAction(.loadUnloadCar(volume: 100), on: &car)
    vehicleHandler.performAction(.loadUnloadCar(volume: 100), on: &car)
    vehicleHandler.performAction(.loadUnloadCar(volume: 100), on: &car)
    vehicleHandler.performAction(.loadUnloadCar(volume: 100), on: &car)
    vehicleHandler.performAction(.loadUnloadCar(volume: 100), on: &car)
}

var mySportCar: Vehicle = SportCar(isMoving: true, carBrand: .Tesla, year: "2021", trunkOrBodyVolume: 500)
startGame(car: &mySportCar, vehicleHandler: .init())
