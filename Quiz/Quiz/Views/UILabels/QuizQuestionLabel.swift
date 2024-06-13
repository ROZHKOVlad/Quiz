import UIKit

final class QuizQuestionLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .white
        self.font = UIFont(name: Resources.Fonts.quizLabelFont, size: 30)
        self.textAlignment = .center
    }
}
