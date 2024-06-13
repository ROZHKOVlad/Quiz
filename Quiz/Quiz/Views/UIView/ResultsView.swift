import UIKit

final class ResultsView: UIView {
    
    public let button = UIButton()
    public let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = Resources.Colors.backgroungColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 18
        self.layer.borderWidth = 2
        
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back to Menu", for: .normal)
        button.layer.cornerRadius = 13
        button.layer.borderWidth = 1.5
        button.backgroundColor = Resources.Colors.menuButtonColor
        button.titleLabel?.textColor = .white
        
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = Resources.Colors.menuButtonColor
        label.font = UIFont.boldSystemFont(ofSize: 21)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
    
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 40),
            button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            button.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3),
            
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -25),
            label.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1),
            label.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4)
        ])
    }
}
