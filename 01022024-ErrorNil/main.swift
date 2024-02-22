

import Foundation

enum ModelsCar {
    case Tesla
    case Volva
    case BMW
    case Mersedes
}

enum LoadUnload {
    case load
    case unload
}

enum ActionsWithCar {
    case moving
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadUnloadCar(action: LoadUnload, volume: Float)
}

protocol Vehicle {
    var carBrand: ModelsCar { get }
    var year: String { get }
    var trunkOrBodyVolume: Float { get set }
    var currentTrunkVolume: Float { get set }
    var isStartedEngine: Bool { get set }
    var isStopedEnigine: Bool { get set }
    var isOpenWindow: Bool { get set }
    var isCloseWindow: Bool { get set }
    var isMoving: Bool { get set }
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
    mutating func canPerform(on vehicle: Vehicle, action: LoadUnload, volume: Float) -> Bool
    mutating func performAction(on vehicle: inout Vehicle, action: LoadUnload, volume: Float)
}

extension VehicleActionWithParameter {
    mutating func perform(on vehicle: inout Vehicle, action: LoadUnload, volume: Float) {
        if !canPerform(on: vehicle, action: action, volume: volume) {
            print(failureMessage)
        } else {
            performAction(on: &vehicle, action: action, volume: volume)
            print(successMessage)
        }
    }
}

extension VehicleAction {
    func perform(on vehicle: inout Vehicle) {
        if canPerform(on: vehicle) {
            performAction(on: &vehicle)
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
        case .closeWindows:
            CloseWindowsAction().perform(on: &vehicle)
        case .loadUnloadCar(let action, let volume):
            var loadUnloadAction = LoadUnloadCarAction()
            loadUnloadAction.perform(on: &vehicle, action: action, volume: volume)
        case .moving:
            MovingActions().perform(on: &vehicle)
        }
    }
}

struct MovingActions: VehicleAction {
    var successMessage: String = "Машина тронулась"
    var failureMessage: String = "Мы уже в движении"
    
    func canPerform(on vehicle: Vehicle) -> Bool {
        return true
    }
    
    func performAction(on vehicle: inout Vehicle) {
        if !vehicle.isStartedEngine {
            print("Сначала нужно завести машину")
        } else if vehicle.isMoving {
            print(failureMessage)
        } else {
            vehicle.isMoving = true
            print(successMessage)
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
        vehicle.isStopedEnigine = false
        print(successMessage)
    }
}

struct StopEngineAction: VehicleAction {
    var successMessage: String = "Заглушил двигатель"
    var failureMessage: String = "Двигатель уже был заглушен"
    
    func canPerform(on vehicle: Vehicle) -> Bool {
        !vehicle.isStopedEnigine
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.isStopedEnigine = true
        vehicle.isStartedEngine = false
        vehicle.isMoving = false
        print(successMessage)
    }
}

struct OpenWindowsAction: VehicleAction {
    var successMessage: String = "Открыл окна"
    var failureMessage: String = "Окна уже были открыты"
    
    func canPerform(on vehicle: Vehicle) -> Bool {
        !vehicle.isOpenWindow
    }
    
    func performAction(on vehicle: inout Vehicle) {
        vehicle.isOpenWindow = true
        vehicle.isCloseWindow = false
        print(successMessage)
    }
}

struct CloseWindowsAction: VehicleAction {
    
    var successMessage: String = "Закрыл двери"
    var failureMessage: String = "Двери уже были закрыты"
    
    func canPerform(on vehicle: Vehicle) -> Bool {
        !vehicle.isCloseWindow
    }
    func performAction(on vehicle: inout Vehicle) {
        vehicle.isCloseWindow = true
        vehicle.isOpenWindow = false
        print(successMessage)
    }
}

struct LoadUnloadCarAction: VehicleActionWithParameter {
    var successMessage = "Операция прошла успешна"
    var failureMessage = ""
    
    mutating func canPerform(on vehicle: Vehicle, action: LoadUnload, volume: Float) -> Bool {
        failureMessage = "Операция невозможна: автомобиль находится в движении"
        guard !vehicle.isMoving else { return false }
        switch action {
        case .load:
            if vehicle.currentTrunkVolume + volume > vehicle.trunkOrBodyVolume {
                failureMessage = "Превышен допустимый объем багажника"
                return false
            }
        case .unload:
            if vehicle.currentTrunkVolume - volume < 0 {
                failureMessage = "Невозможно выгрузить больше, чем загружено"
                return false
            }
        }
        return true
    }
    
    mutating func performAction(on vehicle: inout Vehicle, action: LoadUnload, volume: Float) {
        switch action {
        case .load:
            vehicle.currentTrunkVolume += volume
            vehicle.trunkOrBodyVolume -= volume
            print("Загружено \(volume) л. Объем груза: \(vehicle.currentTrunkVolume) л. Свободного места: \(vehicle.trunkOrBodyVolume)")
        case .unload:
            vehicle.currentTrunkVolume -= volume
            vehicle.trunkOrBodyVolume += volume
            print("Выгружено \(volume) л. Текущий объем груза: \(vehicle.currentTrunkVolume) л. Свободного места: \(vehicle.trunkOrBodyVolume)")
        }
    }
}

struct SportCar: Vehicle {
    let carBrand: ModelsCar
    let year: String
    var trunkOrBodyVolume: Float
    var currentTrunkVolume: Float = 0
    var isStartedEngine: Bool = false
    var isStopedEnigine: Bool = false
    var isOpenWindow: Bool = false
    var isCloseWindow: Bool = false
    var isMoving: Bool = false
}

struct TrunkCar: Vehicle {
    var carBrand: ModelsCar
    var year: String
    var trunkOrBodyVolume: Float
    var currentTrunkVolume: Float = 0
    var isStartedEngine: Bool = false
    var isStopedEnigine: Bool = false
    var isOpenWindow: Bool = false
    var isCloseWindow: Bool = false
    var isMoving: Bool = false
}

func startGame(car: inout Vehicle, vehicleHandler: VehicleActionHandler) {
    vehicleHandler.performAction(.startEngine, on: &car) //Завел двигатель
    vehicleHandler.performAction(.startEngine, on: &car) //Двигатель уже заведен
    vehicleHandler.performAction(.stopEngine, on: &car) //Заглушил двигатель
    vehicleHandler.performAction(.openWindows, on: &car) //Открыл окна
    vehicleHandler.performAction(.startEngine, on: &car) //Завел двигатель
    vehicleHandler.performAction(.moving, on: &car) //Машина тронулась
    vehicleHandler.performAction(.moving, on: &car) //Мы уже в движении
    vehicleHandler.performAction(.stopEngine, on: &car) //Заглушил двигатель
    vehicleHandler.performAction(.moving, on: &car) // Сначала нужно завести машину
    vehicleHandler.performAction(.startEngine, on: &car) //Завел двигатель
    vehicleHandler.performAction(.moving, on: &car) // Машина тронулась
    vehicleHandler.performAction(.loadUnloadCar(action: .load, volume: 50), on: &car) //Операция невозможна: автомобиль находится в движении
    vehicleHandler.performAction(.stopEngine, on: &car) // Заглушил двигатель
    vehicleHandler.performAction(.loadUnloadCar(action: .unload, volume: 30), on: &car) // Невозможно выгрузить больше, чем загружено
    vehicleHandler.performAction(.moving, on: &car) // Сначала нужно завести машину
    vehicleHandler.performAction(.loadUnloadCar(action: .unload, volume: 201), on: &car) //Невозможно выгрузить больше, чем загружено
    vehicleHandler.performAction(.moving, on: &car) // Сначала нужно завести машину
    vehicleHandler.performAction(.startEngine, on: &car) // Завел двигатель
    vehicleHandler.performAction(.moving, on: &car) // Машина тронулась
    vehicleHandler.performAction(.loadUnloadCar(action: .load, volume: 30), on: &car) //Операция невозможна: автомобиль находится в движении
    vehicleHandler.performAction(.stopEngine, on: &car) //Заглушил двигатель
    vehicleHandler.performAction(.loadUnloadCar(action: .load, volume: 30), on: &car) // Загружено 30.0 л. Объем груза: 30.0 л. Свободного места: 70.0
    vehicleHandler.performAction(.loadUnloadCar(action: .unload, volume: 10), on: &car) // Выгружено 10.0 л. Текущий объем груза: 20.0 л. Свободного места: 80.0
}

var mySportCar: Vehicle = SportCar(carBrand: .Tesla, year: "2021", trunkOrBodyVolume: 100)
startGame(car: &mySportCar, vehicleHandler: .init())
