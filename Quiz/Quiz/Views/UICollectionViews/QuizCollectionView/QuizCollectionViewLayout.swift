import UIKit

class QuizCollectionViewLayout: UICollectionViewLayout {
    
    private var itemCount = 0
    private var itemSize = CGSize.zero
    private var contentInsets = UIEdgeInsets(top: 13, left: 16, bottom: 13, right: 16)
    private var maxRotationAngle: CGFloat = .pi * 0.1
    private let interitemSpace: CGFloat = 16
    private var itemWidth: CGFloat {
        itemSize.width
    }

    private var itemAndSpaceWidth: CGFloat {
        itemWidth + interitemSpace
    }
    
    private var contentWidth: CGFloat {
        (CGFloat(itemCount) * itemWidth) +
        (CGFloat(itemCount - 1) * interitemSpace) +
        (contentInsets.left + contentInsets.right)
    }

    private var layoutAttributes: [UICollectionViewLayoutAttributes] = []

    override var collectionViewContentSize: CGSize {
        guard let cv = collectionView else { return .zero }
        return CGSize(width: contentWidth, height: cv.bounds.height)
    }

    override func prepare() {
        super.prepare()
        guard let cv = collectionView else { return }
        cv.decelerationRate = .fast
        cv.contentInset = contentInsets
        cv.showsVerticalScrollIndicator = false
        itemCount = cv.numberOfItems(inSection: 0)
        itemSize = CGSize(width: cv.bounds.width - (interitemSpace * 2.0),
                          height: cv.bounds.height - (contentInsets.top + contentInsets.bottom))
        // Pre-variables
        layoutAttributes = []
        var currentX: CGFloat = 0
        // Calculating the attributes for all the items.
        // For large collection views more a thouthand item
        // Consider splitting these calculations into chunks
        for item in 0..<itemCount {
            // Create attributes for each item
            let indexPath = IndexPath(item: item, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            // Set attributes size
            attributes.size = itemSize
            // Set attributes center
            let xCenter = currentX + (itemSize.width / 2.0)
            let yCenter = cv.bounds.midY
            attributes.center = CGPoint(x: xCenter, y: yCenter)
            // Append to cache
            layoutAttributes.append(attributes)
            // Shift current x with item width and interitem spacing
            currentX += itemAndSpaceWidth
        }
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let cv = collectionView else { return nil }
        let visibleRect = CGRect(origin: cv.contentOffset, size: cv.bounds.size)
        for attributes in layoutAttributes where visibleRect.intersects(attributes.frame) {
            attributes.transform3D = getTransform3D(for: attributes)
        }
        return layoutAttributes.filter { rect.intersects($0.frame) }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        layoutAttributes.filter { $0.indexPath == indexPath }.first
    }
    
    override func targetContentOffset(
        forProposedContentOffset proposedContentOffset: CGPoint,
        withScrollingVelocity velocity: CGPoint) -> CGPoint
    {
        guard let cv = collectionView else { return proposedContentOffset }
        // Get target item
        let targetX = proposedContentOffset.x
        let targetMidX = targetX + (cv.bounds.width / 2.0)
        let targetItem = floor(targetMidX / itemAndSpaceWidth)
        // Calculate adjusted offset
        let adjustedX = (targetItem * itemAndSpaceWidth) - contentInsets.left
        return CGPoint(x: adjustedX, y: proposedContentOffset.y)
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        true
    }
    
    override func invalidateLayout(with context: UICollectionViewLayoutInvalidationContext) {
        if context.invalidateEverything || context.invalidateDataSourceCounts {
            layoutAttributes = []
        }
        super.invalidateLayout(with: context)
    }

    private func getTransform3D(for attributes: UICollectionViewLayoutAttributes) -> CATransform3D {
        var prespective = CATransform3DIdentity
        prespective.m34 = -1.0 / 400
        let angle = getAngle(for: attributes)
        var transform = CATransform3DRotate(prespective, angle, 0, 1, 0)
        transform = CATransform3DTranslate(transform, angle * 125, 0, 0)
        return transform
    }
    
    private func getAngle(for attributes: UICollectionViewLayoutAttributes) -> CGFloat {
        guard let cv = collectionView else { return .zero }
        let visibleRect = CGRect(origin: cv.contentOffset, size: cv.bounds.size)
        let center = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let itemDistanceFromCenter = attributes.center.x - center.x
        let totalSpaceFromCenterToEdge = (visibleRect.maxX - visibleRect.minX) / 2.0
        // Capping the factor between -1, 1
        let distanceFactor = max(-1, min(1, itemDistanceFromCenter / totalSpaceFromCenterToEdge))
        let angle = -1 * distanceFactor * maxRotationAngle
        return angle
    }
}
