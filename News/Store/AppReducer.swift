//
// Created by Liempo on 7/29/21.
//
import ReSwift

public func AppReducer(
    action: Action,
    state: AppState?
) -> AppState {
    var state = state ?? AppState()
    state.clearStateTypes()

    switch action {

    case let load as AppAction.Load:
        state.posts.setValue(load.posts)

    default:
        break
    }

    return state
}