//
//  WinModel.swift
//  HWTBAM
//
//  Created by Vania Aryutov on 10.02.2023.
//

import UIKit

struct WinModel {
    var prize: String
    var number: String
    var backgroundcolorLabel: UIColor?
    var safeSum: String
    init(prize: String, number: String, backgroundcolorLabel: UIColor? = nil, safeSum: String) {
        self.prize = prize
        self.number = number
        self.backgroundcolorLabel = backgroundcolorLabel
        self.safeSum = safeSum
    }
}
