import UIKit

final class QuizButton: UIButton {
        
    public var status: Bool? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Resources.Colors.backgroungColor
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.layer.cornerRadius = 18
    }
}
