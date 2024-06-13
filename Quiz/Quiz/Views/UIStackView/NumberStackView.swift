import UIKit

final class NumberStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        for i in 1...10 {
            let numberLabel = NumberLabel()
            numberLabel.text = "\(i)"
            numberLabel.textColor = .black
            self.addArrangedSubview(numberLabel)
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.alignment = .center
        self.distribution = UIStackView.Distribution.fillEqually
    }
    
    public func setColor(forIndex: Int, color: UIColor) {
        self.arrangedSubviews[forIndex].layer.backgroundColor = color.cgColor
    }
}
