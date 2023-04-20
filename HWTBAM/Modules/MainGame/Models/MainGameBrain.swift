//
//  MainGameBrain.swift
//  HWTBAM
//
//  Created by Сергей Золотухин on 09.02.2023.
//

import UIKit
 
struct MainGameBrain {
    var questionNumber = 0
    let intArray = [1, 2, 3, 4]
    let qNumArray = [0, 1, 2, 3, 4]
    var hallHelp: HallHelpModel?
    var usedPrompts = UsedPrompts(fiftyFifty: true, hallHelp: true, callToFriend: true)
    
    let quiz = [
    [Question(text: "Универсальные шаблоны помогают реализовать это", answer: ["Архитектуру", "Коллекции", "Переменные свойства", "Гибкие функции"], correctAnswer: "4"),
    Question(text: "Сколько способов обработки ошибок существует в Swift?", answer: ["2", "4", "1", "3"], correctAnswer: "2"),
    Question(text: "Обработка ошибок, это процесс ...?", answer: ["Реагирования на ошибки", "Прогнозирования ошибок", "Хранения ошибок", "Генерации ошибок"], correctAnswer: "1"),
    Question(text: "Как называется класс, у которого наследуют?", answer: ["Наследник", "Класс", "Подкласс", "Суперкласс"], correctAnswer: "4"),
    Question(text: "Если String пустая, то startIndex и endIndex будут ...?", answer: ["Пустыми", "nil", "Неравными", "Равными"], correctAnswer: "4")],
    
    [Question(text: "Как традиционно называют экземпляр класса в ООП?", answer: ["Экземпляр", "Структура", "Объект", "Таргет"], correctAnswer: "3"),
    Question(text: "Что из перечисленного является ссылочным типом?", answer: ["Свойства", "Структуры", "Классы", "Перечисления"], correctAnswer: "3"),
    Question(text: "Можно ли сравнивать две строки?", answer: ["Нет", "Да", "Только !=", "Только =="], correctAnswer: "2"),
    Question(text: "Как пишется сокращенная форма записи массива в Swift?", answer: ["Array<ElementType>", "Array(ElementType)[]", "[ElementType]", "[ElementType]()"], correctAnswer: "3"),
    Question(text: "Сколько основных типов коллекций обеспечивает Swift?", answer: ["3", "5", "2", "4"], correctAnswer: "1")],
    
    [Question(text: "Сколько основных свойств имеет UIStackView?", answer: ["4", "3", "2", "1"], correctAnswer: "1"),
    Question(text: "Для каких типов доступны деинициализаторы?", answer: ["Типы перечислений", "Структурные типы", "Все перечисленные ", "Классовые типы"], correctAnswer: "4"),
    Question(text: "Чем разделяются протокола в композиции протоколов?", answer: [",", "&", "-", ":"], correctAnswer: "2"),
    Question(text: "Какой тип хранит только положительные целые числа?", answer: ["UInt", "Int", "Double", "Float"], correctAnswer: "1"),
    Question(text: "Являются ли Swift Array универсальными?", answer: ["Нет", "Только Dictionary", "Да", "Только Array"], correctAnswer: "3")]
    ]
    
    let questionNumberArray = [14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
    let numberArray = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    var checkedAnswer: Bool?
    let moneyLabelArray = ["100", "200", "300", "500", "1 000", "2 000", "4 000", "8 000", "16 000", "32 000", "64 000", "125 000", "250 000", "500 000", "1 000 000"]
    let numberLabelArray = ["Вопрос 1", "Вопрос 2", "Вопрос 3", "Вопрос 4", "Вопрос 5", "Вопрос 6", "Вопрос 7", "Вопрос 8", "Вопрос 9", "Вопрос 10", "Вопрос 11", "Вопрос 12", "Вопрос 13", "Вопрос 14", "Вопрос 15"]
    
    func getBlockQuestionsNumber(_ number: Int) -> Int {
        var valueInt = 0
        
        switch number {
        case 0..<5:
            valueInt = 0
        case 5..<10:
            valueInt = 1
        case 10..<15:
            valueInt = 2
        default:
            print("default value")
        }
        return valueInt
    }

    func getQuestionText() -> String {
        LogicMeneger.shared.counter()
        let blockNumber = getBlockQuestionsNumber(questionNumber)
        
        let arrayInt = LogicMeneger.shared.randomInt
        
        let intValue = LogicMeneger.shared.intValue
        
        return quiz[blockNumber][arrayInt[intValue]].text
    }
    
    mutating func changeCostText() -> String {
        return moneyLabelArray[questionNumber]
    }
    
    mutating func changeNumberText() -> String {
        return numberLabelArray[questionNumber]
    }
    
    mutating func nextQuestion(_ intValue: Int) {
           questionNumber = intValue
   }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        let blockNumber = getBlockQuestionsNumber(questionNumber)
        let arrayInt = LogicMeneger.shared.randomInt
        
        let intValue = LogicMeneger.shared.intValue
        
        if userAnswer == quiz[blockNumber][arrayInt[intValue]].correctAnswer {
            return true
        } else {
            return false
        }
    }
    
    func getButtonTitle(with buttonNumber: Int) -> String {
        let blockNumber = getBlockQuestionsNumber(questionNumber)
        let arrayInt = LogicMeneger.shared.randomInt
        
        let intValue = LogicMeneger.shared.intValue
        
        let stringValue = quiz[blockNumber][arrayInt[intValue]].answer[buttonNumber]
        return stringValue
    }

    mutating func promptFifryFifry(_ buttons: [UIButton]) {
        let twoNumberArray = fiftyFifty()
        
        buttons.forEach { element in
            if element.tag == twoNumberArray[0] || element.tag == twoNumberArray[1] {
                element.setTitle("", for: .normal)
            }
        }
    }
    
    //выбираем два неправильных ответа
    mutating func fiftyFifty() -> [Int] {
        var arrayQ = intArray
        let correctInt = getCorrectInt()
        
        arrayQ.enumerated().forEach { arrayIndex, arrayValue in
            if arrayValue == correctInt {
                arrayQ.remove(at: arrayIndex)
            }
        }
        
        guard let randomElement = arrayQ.randomElement() else { fatalError() }
        
        arrayQ.enumerated().forEach { arrayIndex, arrayValue in
            if arrayValue == randomElement {
                arrayQ.remove(at: arrayIndex)
            }
        }
        return arrayQ
    }
    
    //делаем модель для отображения помощи зала
    mutating func hallHelpValues() {
        let correctInt = getCorrectInt()
        
        if questionNumber > 9 {
            switch correctInt {
            case 1:
                hallHelp = HallHelpModel(firstValue: 250, secondValue: 40, thirdValue: 200, fourthValue: 10)
            case 2:
                hallHelp = HallHelpModel(firstValue: 200, secondValue: 40, thirdValue: 125, fourthValue: 10)
            case 3:
                hallHelp = HallHelpModel(firstValue: 40, secondValue: 10, thirdValue: 250, fourthValue: 200)
            case 4:
                hallHelp = HallHelpModel(firstValue: 10, secondValue: 200, thirdValue: 40, fourthValue: 250)
            default:
                print("Omg Omg!!!")
            }
        } else {
            switch correctInt {
            case 1:
                hallHelp = HallHelpModel(firstValue: 350, secondValue: 25, thirdValue: 75, fourthValue: 50)
            case 2:
                hallHelp = HallHelpModel(firstValue: 25, secondValue: 350, thirdValue: 75, fourthValue: 50)
            case 3:
                hallHelp = HallHelpModel(firstValue: 25, secondValue: 75, thirdValue: 350, fourthValue: 50)
            case 4:
                hallHelp = HallHelpModel(firstValue: 25, secondValue: 75, thirdValue: 50, fourthValue: 350)
            default:
                print("Omg Omg!!!")
            }
        }
    }
    
    func callToFriend() {
        LogicMeneger.shared.rightMakeMistake = true
    }
    
    mutating func setfiftyFifty(_ isUsed: Bool) {
        usedPrompts.fiftyFifty = isUsed
    }
    
    mutating func setHallHelp(_ isUsed: Bool) {
        usedPrompts.hallHelp = isUsed
    }
    
    mutating func setCallToFriend(_ isUsed: Bool) {
        usedPrompts.callToFriend = isUsed
    }
    
    mutating func setupPrompts(with model: UsedPrompts) {
        usedPrompts = model
    }
    
    func safeMoney(_ number: Int) -> LoseViewModel {
        var safeNumber = 0
        var safeMoney = ""
        
        switch number {
        case 0..<5:
            safeNumber = 15
            safeMoney = "0"
        case 5..<10:
            safeNumber = 10
            safeMoney = "1000"
        case 10..<15:
            safeNumber = 5
            safeMoney = "32 000"
        case 15:
            safeNumber = 0
            safeMoney = "1 000 000"
        default:
            print("default value")
        }
        
        let loseViewModel = LoseViewModel(safeNumber: safeNumber, safeMoney: safeMoney)
        return loseViewModel
    }
    
    func forEachArray<T: UIView>(_ array: [T], _ value: Int, _ color: UIColor) {
        array.forEach { element in
            if element.tag == value {
                element.backgroundColor = color
            }
        }
    }
    
    func disableButton(_ sender: UIButton, _ imageName: String) {
        sender.setImage(UIImage(named: imageName), for: .normal)
        sender.isEnabled = false
    }

    func getCorrectInt() -> Int {
        let blockNumber = getBlockQuestionsNumber(questionNumber)
        let arrayInt = LogicMeneger.shared.randomInt
        
        let intValue = LogicMeneger.shared.intValue
        
        guard let correctInt = Int(quiz[blockNumber][arrayInt[intValue]].correctAnswer) else { fatalError() }
        return correctInt
    }
}
