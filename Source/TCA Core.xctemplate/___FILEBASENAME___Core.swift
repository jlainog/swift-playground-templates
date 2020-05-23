import Foundation
import ComposableArchitecture

//MARK:- State
public struct ___VARIABLE_productName___State: Equatable {
    
}

//MARK:- Action
public enum ___VARIABLE_productName___Action: Equatable {
    case newAction
}

//MARK:- Environment
public struct ___VARIABLE_productName___Environment {
    var mainQueue = DispatchQueue.main.eraseToAnyScheduler()
}

//MARK:- Reducer
public let <#Domain#>Reducer = Reducer<___VARIABLE_productName___State, ___VARIABLE_productName___Action, ___VARIABLE_productName___Environment> {
    state, action, environment in
    switch action {
    case .newAction:
        return .none
    }
}
