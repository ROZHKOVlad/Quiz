import UIKit

class QuizViewController: UIViewController {
    
    private let quizCollectionView = QuizCollectionView(layout: QuizCollectionViewLayout())
    private let stackView = NumberStackView()
    private let resultsView = ResultsView()
    private let backButton = UIButton()
    
    private var result = 0
    private var answers = 0
    private var a = [false,false,false,false,false,false,false,false,false,false]

    private var quizes: [Quiz] = []
    
    init(quizesIndex: Int) {
        super.init(nibName: nil, bundle: nil)
        self.quizes = FireBaseSubjects.subjects[quizesIndex].quizes
    }
    
    override func viewDidLoad() {
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.view.backgroundColor = Resources.Colors.backgroungColor
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.isNavigationBarHidden = true
        
        self.view.addSubview(backButton)
        backButton.setTitle("Exit Quiz", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        backButton.setTitleColor(Resources.Colors.menuButtonColor, for: .normal)
        backButton.addTarget(self, action: #selector(exitQuiz), for: .touchUpInside)
        
        self.view.addSubview(quizCollectionView)
        quizCollectionView.delegate = self
        quizCollectionView.dataSource = self
        quizCollectionView.register(QuizCollectionViewCell.self, forCellWithReuseIdentifier: QuizCollectionViewCell.identifier)
        
        self.view.addSubview(stackView)
        
        self.view.addSubview(resultsView)
        resultsView.alpha = 0
        resultsView.isHidden = true
        resultsView.button.addTarget(self, action: #selector(goToMenu), for: .touchUpInside)
    }
    
    @objc
    private func exitQuiz() {
        let alert = UIAlertController(title: "Are you sure?", message: "Your progress will not be saved", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: "Default action"), style: .default, handler: { _ in
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
            self.navigationController?.isNavigationBarHidden = false
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc
    private func goToMenu() {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            quizCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            quizCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            quizCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            quizCollectionView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -100),
            
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50),
            
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 7),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            backButton.widthAnchor.constraint(equalToConstant: 100),
            backButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

extension QuizViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizCollectionViewCell.identifier, for: indexPath) as? QuizCollectionViewCell else { fatalError("reverererferferfre") }
        cell.setQuiz(question: quizes[indexPath.item].question, statuses: quizes[indexPath.item].answers)
        cell.setTargets()
        
        cell.optionButton1.backgroundColor = Resources.Colors.backgroungColor
        cell.optionButton2.backgroundColor = Resources.Colors.backgroungColor
        cell.optionButton3.backgroundColor = Resources.Colors.backgroungColor
        cell.optionButton4.backgroundColor = Resources.Colors.backgroungColor

        if(a[indexPath.item] == true) {
            if(cell.optionButton1.status == true) {
                cell.optionButton1.backgroundColor = .green
            } else {
                cell.optionButton1.backgroundColor = .red
            }
            if(cell.optionButton2.status == true) {
                cell.optionButton2.backgroundColor = .green
            } else {
                cell.optionButton2.backgroundColor = .red
            }
            if(cell.optionButton3.status == true) {
                cell.optionButton3.backgroundColor = .green
            } else {
                cell.optionButton3.backgroundColor = .red
            }
            if(cell.optionButton4.status == true) {
                cell.optionButton4.backgroundColor = .green
            } else {
                cell.optionButton4.backgroundColor = .red
            }
            
        }
        
        cell.optionButton1.tag = indexPath.item
        cell.optionButton2.tag = indexPath.item
        cell.optionButton3.tag = indexPath.item
        cell.optionButton4.tag = indexPath.item
        
        cell.optionButton1.addTarget(self, action: #selector(changeStackViewChildColor(sender:)), for: .touchUpInside)
        cell.optionButton2.addTarget(self, action: #selector(changeStackViewChildColor(sender:)), for: .touchUpInside)
        cell.optionButton3.addTarget(self, action: #selector(changeStackViewChildColor(sender:)), for: .touchUpInside)
        cell.optionButton4.addTarget(self, action: #selector(changeStackViewChildColor(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc
    private func changeStackViewChildColor(sender: QuizButton) {
        a[sender.tag] = true
        if(stackView.arrangedSubviews[sender.tag].layer.backgroundColor == UIColor.red.cgColor ||
           stackView.arrangedSubviews[sender.tag].layer.backgroundColor == UIColor.green.cgColor) {
            sender.removeTarget(self, action: #selector(changeStackViewChildColor(sender:)), for: .touchUpInside)
            return
        }
        if(sender.backgroundColor == UIColor.green) {
            stackView.setColor(forIndex: sender.tag, color: .green)
            answers = answers + 1
            result = result + 1
            sender.removeTarget(self, action: #selector(changeStackViewChildColor(sender:)), for: .touchUpInside)
        } else if (sender.backgroundColor == UIColor.red) {
            stackView.setColor(forIndex: sender.tag, color: .red)
            answers = answers + 1
            sender.removeTarget(self, action: #selector(changeStackViewChildColor(sender:)), for: .touchUpInside)
        }
        if(answers == quizes.count) {
            UIView.animate(withDuration: 1.5) { [self] in
                self.quizCollectionView.alpha = 0.6
                self.backButton.alpha = 0.6
                self.stackView.alpha = 0.6
                self.quizCollectionView.isScrollEnabled = false
                self.backButton.removeTarget(self, action: #selector(exitQuiz), for: .touchUpInside)
                NSLayoutConstraint.activate([
                     resultsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                     resultsView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
                     resultsView.widthAnchor.constraint(equalToConstant: 300),
                     resultsView.heightAnchor.constraint(equalToConstant: 200)
                ])
                resultsView.alpha = 1
                resultsView.isHidden = false
                resultsView.label.text = "Result: " + "\(result)"
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizes.count
    }
}

