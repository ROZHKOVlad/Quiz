import UIKit
import FirebaseDatabase
import FirebaseDatabaseSwift

class FireBaseSubjects {
    
//    static let shared = FireBaseSubjects()
//    
//    private var ref: DatabaseReference! = Database.database().reference()
//    
//    public var subjects: [Subject] = []
//    
//    func observeSubjects() {
//        ref.observe(.value) { parentSnapshot in
//            guard let children = parentSnapshot.children.allObjects as? [DataSnapshot] else { return }
//            self.subjects = children.compactMap({ snapshot in
//                return try?  snapshot.data(as: Subject.self)
//            })
//        }
//    }
    
    static let subjects: [Subject] = [Subject(subjectTitle: Resources.Strings.Subjects.sports,
                                                 subjectQuestions: [Quiz(quizQuestion: "Сколько золотых мечей у Месси?",
                                                                         quizAnswers: [Option(optionAnswer: "8",
                                                                                              optionStatus: true),
                                                                                       Option(optionAnswer: "6",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "7",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "9",
                                                                                              optionStatus: false)]),
                                                                    Quiz(quizQuestion: "Что такое Пинг-Понг?",
                                                                         quizAnswers: [Option(optionAnswer: "Настольный теннис",
                                                                                              optionStatus: true),
                                                                                       Option(optionAnswer: "Крикет",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "Гольф",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "Сквош",
                                                                                              optionStatus: false)]),
                                                                    Quiz(quizQuestion: "Какой был первый вид спорта?",
                                                                         quizAnswers: [Option(optionAnswer: "Борьба",
                                                                                              optionStatus: true),
                                                                                       Option(optionAnswer: "Бег",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "Футбол",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "Метание копья",
                                                                                              optionStatus: false)]),
                                                                    Quiz(quizQuestion: "Где изобрели футбол??",
                                                                         quizAnswers: [Option(optionAnswer: "Англия",
                                                                                              optionStatus: true),
                                                                                       Option(optionAnswer: "Бразилия",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "Германия",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "Недерланды",
                                                                                              optionStatus: false)]),
                                                                    Quiz(quizQuestion: "Сколько раз Майкл Фелпс выиграл Олимпийское золото?",
                                                                         quizAnswers: [Option(optionAnswer: "24",
                                                                                              optionStatus: true),
                                                                                       Option(optionAnswer: "16",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "8",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "32",
                                                                                              optionStatus: false)]),
                                                                    Quiz(quizQuestion: "У кого наибольшая средняя результативность за историю баскетбола?",
                                                                         quizAnswers: [Option(optionAnswer: "Майкл Джордан",
                                                                                              optionStatus: true),
                                                                                       Option(optionAnswer: "Ларри Берд",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "Леброн Джеймс",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "Стефан Карри",
                                                                                              optionStatus: false)]),
                                                                    Quiz(quizQuestion: "Какая теннисистка больше всех выиграла титулов Большого Шлема?",
                                                                         quizAnswers: [Option(optionAnswer: "Сирена Уиллиамс",
                                                                                              optionStatus: true),
                                                                                       Option(optionAnswer: "Винус Уиллиамс",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "Наоми Осака",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "Виктория Азаренко",
                                                                                              optionStatus: false)]),
                                                                    Quiz(quizQuestion: "Какая протяженность марафона?",
                                                                         quizAnswers: [Option(optionAnswer: "42 км",
                                                                                              optionStatus: true),
                                                                                       Option(optionAnswer: "21 км",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "10,5 км",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "84",
                                                                                              optionStatus: false)]),
                                                                    Quiz(quizQuestion: "Сколько игроков в бейсбольной команде?",
                                                                         quizAnswers: [Option(optionAnswer: "9",
                                                                                              optionStatus: true),
                                                                                       Option(optionAnswer: "7",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "8",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "6",
                                                                                              optionStatus: false)]),
                                                                    Quiz(quizQuestion: "Кто выйграл ЧМ-2018?",
                                                                         quizAnswers: [Option(optionAnswer: "Франция",
                                                                                              optionStatus: true),
                                                                                       Option(optionAnswer: "Россия",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "Хорватия",
                                                                                              optionStatus: false),
                                                                                       Option(optionAnswer: "Аргентина",
                                                                                              optionStatus: false)])])]
    
    
    
    
    
    
}
