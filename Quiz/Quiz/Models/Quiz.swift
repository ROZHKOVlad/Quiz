import UIKit

final class Quiz {
    
   
    private var quizQuestion: String = ""
    public var question: String {
        get {
            return self.quizQuestion
        }
        set {
            self.quizQuestion = newValue
        }
    }
    
    private var quizAnswers: [Option] = []
    public var answers: [Option] {
        get {
            return self.quizAnswers
        }
        set {
            self.quizAnswers = newValue
        }
    }
        
    init(quizQuestion: String, quizAnswers: [Option]) {
        self.quizQuestion = quizQuestion
        self.quizAnswers = quizAnswers
    }
}
