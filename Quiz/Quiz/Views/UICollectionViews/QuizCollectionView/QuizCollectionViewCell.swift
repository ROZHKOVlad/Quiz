import UIKit

import UIKit

final class QuizCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "QuizCollectionViewCell"
    private let questionLabel = QuizQuestionLabel()
    
    public let optionButton1 = QuizButton()
    public let optionButton2 = QuizButton()
    public let optionButton3 = QuizButton()
    public let optionButton4 = QuizButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.isUserInteractionEnabled = true
        self.layer.cornerRadius = 18
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = Resources.Colors.menuButtonColor
        
        self.addSubview(questionLabel)
        questionLabel.font = UIFont.boldSystemFont(ofSize: 20)
        questionLabel.numberOfLines = 3
        
        self.addSubview(optionButton1)
        self.addSubview(optionButton2)
        self.addSubview(optionButton3)
        self.addSubview(optionButton4)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            questionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            questionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -230),
            questionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            questionLabel.heightAnchor.constraint(equalToConstant: 100),
            
            optionButton1.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            optionButton1.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 70),
            optionButton1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.65),
            optionButton1.heightAnchor.constraint(equalToConstant: 50),
            
            optionButton2.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            optionButton2.topAnchor.constraint(equalTo: optionButton1.bottomAnchor, constant: 20),
            optionButton2.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.65),
            optionButton2.heightAnchor.constraint(equalToConstant: 50),
            
            optionButton3.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            optionButton3.topAnchor.constraint(equalTo: optionButton2.bottomAnchor, constant: 20),
            optionButton3.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.65),
            optionButton3.heightAnchor.constraint(equalToConstant: 50),
            
            optionButton4.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            optionButton4.topAnchor.constraint(equalTo: optionButton3.bottomAnchor, constant: 20),
            optionButton4.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.65),
            optionButton4.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    public func setQuiz(question: String, statuses: [Option]) {
        var mutant = statuses
        mutant.shuffle()
        questionLabel.text = question
        optionButton1.setTitle(mutant[0].answer, for: .normal)
        optionButton2.setTitle(mutant[1].answer, for: .normal)
        optionButton3.setTitle(mutant[2].answer, for: .normal)
        optionButton4.setTitle(mutant[3].answer, for: .normal)
        optionButton1.status = mutant[0].status
        optionButton2.status = mutant[1].status
        optionButton3.status = mutant[2].status
        optionButton4.status = mutant[3].status
    }
    
    public func setTargets() {
        optionButton1.addTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
        optionButton2.addTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
        optionButton3.addTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
        optionButton4.addTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
    }
    
    @objc
    private func tap(sender: QuizButton) {
        if(sender.status == true) {
            sender.backgroundColor = .green
            optionButton1.removeTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
            optionButton2.removeTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
            optionButton3.removeTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
            optionButton4.removeTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
            return
        } else {
            sender.backgroundColor = .red
            sender.removeTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
            if(optionButton1.status == false) {
                optionButton1.backgroundColor = .red
                optionButton1.removeTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
            } else {
                optionButton1.backgroundColor = .green
                optionButton1.removeTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
            }
            if(optionButton2.status == false) {
                optionButton2.backgroundColor = .red
                optionButton2.removeTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
            } else {
                optionButton2.backgroundColor = .green
                optionButton2.removeTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
            }
            if(optionButton3.status == false) {
                optionButton3.backgroundColor = .red
                optionButton3.removeTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
            } else {
                optionButton3.backgroundColor = .green
                optionButton3.removeTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
            }
            if(optionButton4.status == false) {
                optionButton4.backgroundColor = .red
                optionButton4.removeTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
            } else {
                optionButton4.backgroundColor = .green
                optionButton4.removeTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
            }
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.questionLabel.text = nil
        
        self.optionButton1.titleLabel?.text = nil
        self.optionButton2.titleLabel?.text = nil
        self.optionButton3.titleLabel?.text = nil
        self.optionButton4.titleLabel?.text = nil
        
        self.optionButton1.backgroundColor = nil
        self.optionButton3.backgroundColor = nil
        self.optionButton4.backgroundColor = nil
    }
}
