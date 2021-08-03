//
// Created by Liempo on 7/30/21.
//

import AsyncDisplayKit

class PostCell : ASCellNode {

    private var titleText: ASTextNode!
    private var descText: ASTextNode!
    private var authorText: ASTextNode!
    private var contentText: ASTextNode!
    private var postImage: ASNetworkImageNode!

    private var container: ASDisplayNode!

    var post: Post?

    convenience init(post: Post) {
        self.init()
        self.post = post
    }

    override init() {
        super.init()

        // Initialize and configure all
        // cell components before didLoad()

        self.automaticallyManagesSubnodes = true
        self.shadowColor = UIColor.systemGray.cgColor
        self.shadowOpacity = 0.5
        self.shadowRadius = 12
        self.shadowOffset = .init(width: 0, height: 4)

        self.container = .init()
        self.container.backgroundColor = .systemBackground
        self.container.cornerRadius = 16
        self.container.clipsToBounds = true
        self.container.automaticallyManagesSubnodes = true

        self.titleText = .init()
        self.titleText.maximumNumberOfLines = 2
        self.titleText.truncationMode = .byTruncatingTail

        self.authorText = .init()
        self.authorText.maximumNumberOfLines = 1

        self.descText = .init()
        self.descText.maximumNumberOfLines = 3

        self.postImage = .init()
        self.postImage.shouldCacheImage = true
        self.postImage.contentMode = .scaleAspectFill
        self.postImage.style.preferredLayoutSize =
            ASLayoutSizeMake(
                ASDimensionMake(.fraction, 1),
                ASDimensionMake(256)
            )
    }

    override func didLoad() {
        // Bind data from `self.post` here because
        // `self.post` is nil when accessed in init()

        self.titleText.attributedText = .init(
            string: self.post?.title ?? "An error error occurred",
            attributes: [
                .font : UIFont.boldSystemFont(ofSize: 24)
            ]
        )
        self.descText.attributedText = .init(
            string: self.post?.desc ?? "",
            attributes: [
                .font : UIFont.systemFont(ofSize: 13),
                .foregroundColor : UIColor.systemGray
            ]
        )
        self.authorText.attributedText = .init(
            string: self.post?.author ?? "",
            attributes: [
                .font : UIFont.systemFont(ofSize: 17),
                .foregroundColor : UIColor.systemGray
            ]
        )
        self.postImage.url = .init(
            string: self.post?.imageUrl ?? "")

        setNeedsDisplay()
    }

    override func layoutSpecThatFits(
        _ constrainedSize: ASSizeRange
    ) -> ASLayoutSpec {
        let textLayoutSpec = ASInsetLayoutSpec(
            insets: .init(all: 24),
            child: ASStackLayoutSpec(
                direction: .vertical,
                spacing: 4,
                justifyContent: .start,
                alignItems: .start,
                children: [
                    self.titleText,
                    self.authorText,
                    self.descText
                ]
            )
        )
        container.layoutSpecBlock =  {
            node, range in
            ASStackLayoutSpec(
                direction: .vertical,
                spacing: .zero,
                justifyContent: .start,
                alignItems: .stretch,
                children: [
                    self.postImage,
                    textLayoutSpec
                ]
            )
        }
        return ASInsetLayoutSpec(
            insets: .init(
                top: .zero,
                left: 18,
                bottom: 24,
                right: 18
            ),
            child: container
        )
    }

}
