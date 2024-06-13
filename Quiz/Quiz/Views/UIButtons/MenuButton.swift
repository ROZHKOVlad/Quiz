import UIKit

final class MenuButton: UIButton {
    
    private var title: String = ""
    
    init(title: String) {
        super.init(frame: CGRect())
        self.title = title
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Resources.Colors.menuButtonColor
        self.layer.cornerRadius = 18
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        self.setTitle(title, for: .normal)
        self.layer.borderWidth = 2
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(.lightGray, for: .highlighted)
    }
}
