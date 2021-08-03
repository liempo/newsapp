//
// Created by Liempo on 7/29/21.
//

import ReSwift
import ReSwiftThunk
import ReNode

public struct AppState : ReState {

    var posts: StatePropertyList<Post> = .init()

    public mutating func clearStateTypes() {
        self.posts.clearFlag()
    }

}

extension AppState {

    public static func createStore(
        _ state: AppState? = nil
    ) -> Store<AppState> {

        let thunk: Middleware<AppState> =
            createThunkMiddleware()

        return .init(
            reducer: AppReducer,
            state: state ?? .init(),
            middleware: [
                thunk
            ]
        )
    }

}