import UIKit

final class Subject: Decodable {
    
    init(from decoder: any Decoder) throws {
        return
    }
    
    private var subjectQuestions: [Quiz] = []
    public var quizes : [Quiz] {
        get {
            return self.subjectQuestions
        }
        set {
            self.subjectQuestions = newValue
        }
    }
    
    private var subjectTitle: String = ""
    public var title: String {
        get {
            return subjectTitle
        }
        set {
            self.subjectTitle = newValue
        }
    }
    
    
    init(subjectTitle: String, subjectQuestions: [Quiz]) {
        self.subjectTitle = subjectTitle
        self.subjectQuestions = subjectQuestions
    }
}

