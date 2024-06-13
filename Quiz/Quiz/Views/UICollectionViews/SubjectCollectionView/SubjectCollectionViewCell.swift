import UIKit

final class SubjectCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SubjectCollectionViewCell"
    
    let subjectLabel = UILabel()
    let subjectImageView = UIImageView()
    
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
        
        self.addSubview(subjectImageView)
        subjectImageView.translatesAutoresizingMaskIntoConstraints = false
        subjectImageView.layer.cornerRadius = 18
        subjectImageView.contentMode = .scaleAspectFit
        
        
        self.addSubview(subjectLabel)
        subjectLabel.translatesAutoresizingMaskIntoConstraints = false
        subjectLabel.textAlignment = .center
        subjectLabel.textColor = .white
        subjectLabel.font = UIFont.boldSystemFont(ofSize: 20)
                             }
    public func layout() {
        NSLayoutConstraint.activate([
            subjectImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subjectImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            subjectImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            subjectImageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            subjectLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subjectLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            subjectLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
            subjectLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.subjectImageView.image = nil
        self.subjectLabel.text = nil
    }
}
