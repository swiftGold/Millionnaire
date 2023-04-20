//
//  SharedStorage.swift
//  HWTBAM
//
//  Created by Сергей Золотухин on 09.02.2023.
//

import Foundation

final class SharedStorage: KeyValueStorage {
    let storage = UserDefaults.standard

    func getValueData(key: String) -> Data? {
        return storage.value(forKey: key) as? Data
    }

    func setValueData(key: String, value: Data) {
        storage.set(value, forKey: key)
    }
}
