import UIKit

final class NumberLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.systemFont(ofSize: 23)
        self.textAlignment = .center
        self.textColor = .black
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 14
    }
}
