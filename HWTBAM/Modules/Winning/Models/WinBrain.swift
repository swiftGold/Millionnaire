//
//  WinBrain.swift
//  HWTBAM
//
//  Created by Vania Aryutov on 11.02.2023.
//

import UIKit

struct WinBrain {
    var winValues = [
        WinModel(prize: "1 000 000", number: "Вопрос 15", backgroundcolorLabel: Theme.millionColor.withAlphaComponent(0.5), safeSum: "1 000 000"),
        WinModel(prize: "500 000", number: "Вопрос 14", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "32 000"),
        WinModel(prize: "250 000", number: "Вопрос 13", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "32 000"),
        WinModel(prize: "125 000", number: "Вопрос 12", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "32 000"),
        WinModel(prize: "64 000", number: "Вопрос 11", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "32 000"),
        WinModel(prize: "32 000", number: "Вопрос 10", backgroundcolorLabel: Theme.safeSumColor.withAlphaComponent(0.5), safeSum: "32 000"),
        WinModel(prize: "16 000", number: "Вопрос 9", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "1 000"),
        WinModel(prize: "8 000", number: "Вопрос 8", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "1 000"),
        WinModel(prize: "4 000", number: "Вопрос 7", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "1 000"),
        WinModel(prize: "2 000", number: "Вопрос 6", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "1 000"),
        WinModel(prize: "1 000", number: "Вопрос 5", backgroundcolorLabel: Theme.safeSumColor.withAlphaComponent(0.5), safeSum: "1 000"),
        WinModel(prize: "500", number: "Вопрос 4", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "0"),
        WinModel(prize: "300", number: "Вопрос 3", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "0"),
        WinModel(prize: "200", number: "Вопрос 2", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "0"),
        WinModel(prize: "100", number: "Вопрос 1", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "0")
    ]
    
    var reversedWinValues = [
        WinModel(prize: "100", number: "Вопрос 1", backgroundcolorLabel: Theme.millionColor.withAlphaComponent(0.5), safeSum: "0"),
        WinModel(prize: "200", number: "Вопрос 2", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "0"),
        WinModel(prize: "300", number: "Вопрос 3", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "0"),
        WinModel(prize: "500", number: "Вопрос 4", backgroundcolorLabel:   Theme.questionColor.withAlphaComponent(0.5), safeSum: "0"),
        WinModel(prize: "1 000", number: "Вопрос 5", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "1 000"),
        WinModel(prize: "2 000", number: "Вопрос 6", backgroundcolorLabel: Theme.safeSumColor.withAlphaComponent(0.5), safeSum: "1 000"),
        WinModel(prize: "4 000", number: "Вопрос 7", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "1 000"),
        WinModel(prize: "8 000", number: "Вопрос 8", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "1 000"),
        WinModel(prize: "16 000", number: "Вопрос 9", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "1 000"),
        WinModel(prize: "32 000", number: "Вопрос 10", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "32 000"),
        WinModel(prize: "64 000", number: "Вопрос 11", backgroundcolorLabel: Theme.safeSumColor.withAlphaComponent(0.5), safeSum: "32 000"),
        WinModel(prize: "125 000", number: "Вопрос 12", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "32 000"),
        WinModel(prize: "250 000", number: "Вопрос 13", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "32 000"),
        WinModel(prize: "500 000", number: "Вопрос 14", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "32 000"),
        WinModel(prize: "1 000 000", number: "Вопрос 15", backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "32 000")
    ]
    
    mutating func getSafeSum(cellNumber: Int) -> String {
        return reversedWinValues[cellNumber].safeSum
    }
}


