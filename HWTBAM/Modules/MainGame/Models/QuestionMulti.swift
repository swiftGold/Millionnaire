//
//  QuestionMulti.swift
//  HWTBAM
//
//  Created by Сергей Золотухин on 09.02.2023.
//

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(text: String, answer: [String], correctAnswer: String) {
        self.text = text
        self.answer = answer
        self.correctAnswer = correctAnswer
    }
}
