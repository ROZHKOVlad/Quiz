import UIKit

enum Resources {
    enum Colors {
        static let backgroungColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        static let menuButtonColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        static let quizLabel = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    }
    
    enum Fonts {
        static let quizLabelFont = UIFont.familyNames[34]
    }
    
    enum Images {
        enum Subjects {
            static let sports = UIImage(named: "sports")
            static let countries = UIImage(named: "countries")
        }
    }
    
    enum Strings {
        enum Subjects {
            static let sports = "Спорт"
            static let countries = "Страны"
        }
        
        enum Menu {
            static let start = "Start"
            static let results = "Results"
            static let quizLogo = "QUIZ"
        }
    }
}
