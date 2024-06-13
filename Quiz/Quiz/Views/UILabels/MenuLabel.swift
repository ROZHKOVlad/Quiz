import UIKit

final class MenuLabel: UILabel {
    
    init(text: String) {
        super.init(frame: CGRect())
        self.text = text
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = Resources.Colors.quizLabel
        font = UIFont(name: Resources.Fonts.quizLabelFont, size: 90)
        textAlignment = .center
    }
}
