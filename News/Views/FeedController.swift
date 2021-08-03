//
// Created by Liempo on 7/29/21.
//

import ReNode
import ReSwift
import AsyncDisplayKit

class FeedController : ReSingleStateController<AppState, FeedView> {
    
    public static func spawn(store: Store<AppState>? = nil) -> FeedController {
        let vc = FeedController(reNode: .init())
        vc.store = store ?? AppState.createStore()

        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure view controller settings
        self.view.backgroundColor = .systemBackground

        // Dispatch initial app actions
        self.store?.dispatch(
            LoadPostsThunk(scope: self.reDisposedBag))
    }



}
