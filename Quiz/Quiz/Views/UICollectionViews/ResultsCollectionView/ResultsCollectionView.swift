import UIKit

class ResultsCollectionView: UICollectionView {
    
    init(layout: UICollectionViewLayout) {
        super.init(frame: CGRect(), collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Resources.Colors.backgroungColor
        self.showsVerticalScrollIndicator = false
    }
}
