import UIKit

final class Option {
    
    private var optionAnswer: String = ""
    public var answer: String {
        get {
            return self.optionAnswer
        }
        set {
            self.optionAnswer = newValue
        }
    }
    
    private var optionStatus: Bool = true
    public var status: Bool {
        get {
            return self.optionStatus
        }
        set {
            self.optionStatus = newValue
        }
    }
    
    init(optionAnswer: String, optionStatus: Bool) {
        self.optionAnswer = optionAnswer
        self.optionStatus = optionStatus
    }
}
