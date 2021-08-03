//
// Created by Liempo on 8/2/21.
//

import RxSwift
import ReSwiftThunk

public func LoadPostsThunk(
    scope: DisposeBag
) -> Thunk<AppState> {
    Thunk {
        dispatch, getState in

        // Check if state is not null then proceed
        guard getState() != nil else { return }

        let posts = [
            Post(
                title: "Alec John wins MVP for the 2021-2022 NBA Season",
                desc: "Alec John has plenty of scoring titles. Now, he finally has an MVP trophy to go with them. The Calamba City Goons star won the NBA's top individual honor",
                author: "ESPN", content: "",
                imageUrl: "https://cdn-wp.thesportsrush.com/2021/07/57c7732c-untitled-design-58.jpg"
            ),
            Post(
                title: "Alec John wins MVP for the 2021-2022 NBA Season",
                desc: "Alec John has plenty of scoring titles. Now, he finally has an MVP trophy to go with them. The Calamba City Goons star won the NBA's top individual honor",
                author: "ESPN", content: "",
                imageUrl: "https://cdn-wp.thesportsrush.com/2021/07/57c7732c-untitled-design-58.jpg"
            )
        ]

        dispatch(AppAction.Load(posts: posts))
    }
}
