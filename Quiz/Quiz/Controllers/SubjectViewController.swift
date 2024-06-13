import UIKit

final class SubjectViewController: UIViewController {
    
    private let navigationBarApperiance = UINavigationBarAppearance()
    
    private var cell = SubjectCollectionViewCell()
    private let subjectCollectionView: SubjectCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return SubjectCollectionView(layout: layout)
    }()
        
    private var subjects: [Subject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    
    private func setup() {
        subjects = FireBaseSubjects.subjects
        
        navigationBarApperiance.backgroundColor = Resources.Colors.backgroungColor
        navigationController?.navigationBar.standardAppearance = navigationBarApperiance
        
        self.view.backgroundColor = Resources.Colors.backgroungColor
        
        self.view.addSubview(subjectCollectionView)
        subjectCollectionView.delegate = self
        subjectCollectionView.dataSource = self
        subjectCollectionView.register(SubjectCollectionViewCell.self, forCellWithReuseIdentifier: SubjectCollectionViewCell.identifier)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            subjectCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            subjectCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            subjectCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40),
            subjectCollectionView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -10),
        ])
    }
}

extension SubjectViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)  -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubjectCollectionViewCell.identifier, for: indexPath) as? SubjectCollectionViewCell else { fatalError("Can not parse this object") }
        

        cell.setup()
        cell.layout()
        cell.subjectLabel.text = subjects[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subjects.count
    }
}

extension SubjectViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
           
        let viewController = QuizViewController(quizesIndex: indexPath.row)
       
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = self.view.frame.width / 2.5
        return CGSize(width: side, height: side - 25)
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.view.frame.width - self.view.frame.width * 4 / 5 - 40
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

}
