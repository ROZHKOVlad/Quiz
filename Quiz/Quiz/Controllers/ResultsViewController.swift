import UIKit

class ResultsViewController: UIViewController {
    
    private let navigationBarApperiance = UINavigationBarAppearance()
    
    private var cell = ResultsCollectionViewCell()
    private let resultsCollectionView: ResultsCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return ResultsCollectionView(layout: layout)
    }()
    
    private let results = ["","","","",""]
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    
    private func setup() {
        navigationBarApperiance.backgroundColor = Resources.Colors.backgroungColor
        navigationController?.navigationBar.standardAppearance = navigationBarApperiance
        
        self.view.backgroundColor = Resources.Colors.backgroungColor
        
        self.view.addSubview(resultsCollectionView)
        resultsCollectionView.delegate = self
        resultsCollectionView.dataSource = self
        resultsCollectionView.register(ResultsCollectionViewCell.self, forCellWithReuseIdentifier: ResultsCollectionViewCell.identifier)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            resultsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            resultsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            resultsCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20),
            resultsCollectionView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -10),
        ])
    }
}

extension ResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResultsCollectionViewCell.identifier, for: indexPath) as? ResultsCollectionViewCell else { fatalError("Can not parse this object") }
        cell.setup()
        cell.layout()
        cell.loginLabel.text = "4n3ofo4nfo4nfo4"
        cell.resultsLabel.text = "10"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
}

extension ResultsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.size.width - 30, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
