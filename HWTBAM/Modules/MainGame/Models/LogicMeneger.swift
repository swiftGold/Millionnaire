//
//  GetRandomInt.swift
//  HWTBAM
//
//  Created by Сергей Золотухин on 11.02.2023.
//

final class LogicMeneger {
    var rightMakeMistake = false
    var intValue: Int = 4
    let qNumArray = [0, 1, 2, 3, 4]
    var randomInt: [Int] = []
    
    private init() {
        getRandomNumberQ()
    }
    
    static let shared = LogicMeneger()
 
    func getRandomNumberQ() {
        let intSet = Set(qNumArray)
        randomInt = Array(intSet)
    }
    
    func counter() {
        if intValue == 4 {
            intValue = 0
        } else {
            intValue += 1
        }
    }
}
