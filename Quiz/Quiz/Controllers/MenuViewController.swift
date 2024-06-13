import UIKit

class MenuViewController: UIViewController {

    private let quizLabel = MenuLabel(text: Resources.Strings.Menu.quizLogo)
    private let startButton = MenuButton(title: Resources.Strings.Menu.start)
//    private let resultsButton = MenuButton(title: Resources.Strings.Menu.results)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    
    private func setup() {
//        FireBaseSubjects.shared.observeSubjects()

        navigationController?.navigationBar.tintColor = Resources.Colors.menuButtonColor
        view.backgroundColor = Resources.Colors.backgroungColor
        
        view.addSubview(quizLabel)
        
        view.addSubview(startButton)
        startButton.addTarget(self, action: #selector(tapStartButton), for: .touchUpInside)
        
//        view.addSubview(resultsButton)
//        resultsButton.addTarget(self, action: #selector(tapResultsButton), for: .touchUpInside)

    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            quizLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            quizLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            quizLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            quizLabel.heightAnchor.constraint(equalToConstant: 130),
            
            startButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -90),
            startButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.45),
            startButton.heightAnchor.constraint(equalToConstant: 60),

//            resultsButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            resultsButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -8),
//            resultsButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.45),
//            resultsButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc
    private func tapStartButton()  {
        let pushingViewController = SubjectViewController()
        navigationController?.pushViewController(pushingViewController, animated: true)
    }
    
    @objc
    private func tapResultsButton() {
//        let pushingViewController = ResultsViewController()
//        navigationController?.pushViewController(pushingViewController, animated: true)
    }
}


