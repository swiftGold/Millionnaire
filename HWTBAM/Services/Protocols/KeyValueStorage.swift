//
//  KeyValueStorage.swift
//  HWTBAM
//
//  Created by Сергей Золотухин on 09.02.2023.
//

import Foundation

protocol KeyValueStorage {
    func setValueData(key: String, value: Data)
    func getValueData(key: String) -> Data?
}
