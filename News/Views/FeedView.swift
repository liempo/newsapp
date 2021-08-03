//
// Created by Liempo on 7/29/21.
//

import ReNode
import RxSwift
import AsyncDisplayKit

public final class FeedView : ReNode<AppState> {

    private var collection : ReCollection<Post>!
    private var layout : UICollectionViewFlowLayout!

    override init() {
        super.init()

        // Initialize the collection layout
        self.layout = .init()

        // Initialize the collection view
        self.collection = .init(collectionViewLayout: self.layout)
        self.collection.style.flexGrow = 1
        self.collection.renderCell = {
            post, node, properties -> ASCellNode in
            PostCell(post: post)
        }
    }

    public override func layoutSpecThatFits(
        _ constrainedSize: ASSizeRange
    ) -> ASLayoutSpec {
        ASWrapperLayoutSpec(
            layoutElement: self.collection
        )
    }

    public override func reactiveBind(obx: Observable<AppState>) {
        self.collection.singleListBind(simple: obx.map { $0.posts })
    }
}
