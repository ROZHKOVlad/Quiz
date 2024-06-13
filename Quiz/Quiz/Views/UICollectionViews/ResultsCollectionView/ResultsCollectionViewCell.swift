import UIKit

final class ResultsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ResultsCollectionViewCell"
    
    let resultsLabel = UILabel()
    let loginLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup() {
        self.layer.cornerRadius = 18
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundConfiguration = UIBackgroundConfiguration.listPlainCell()
        self.backgroundColor = Resources.Colors.menuButtonColor
        self.isUserInteractionEnabled = true
        
        self.addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.textAlignment = .left
        loginLabel.textColor = .white
        loginLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        
        self.addSubview(resultsLabel)
        resultsLabel.translatesAutoresizingMaskIntoConstraints = false
        resultsLabel.textAlignment = .right
        resultsLabel.textColor = .white
        resultsLabel.font = UIFont.boldSystemFont(ofSize: 15)
                             }
    public func layout() {
        NSLayoutConstraint.activate([
            loginLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            loginLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            loginLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            loginLabel.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            resultsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            resultsLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            resultsLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2),
            resultsLabel.heightAnchor.constraint(equalTo: self.heightAnchor),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.loginLabel.text = nil
        self.resultsLabel.text = nil
    }
}

