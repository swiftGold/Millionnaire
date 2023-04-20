//
//  UserService.swift
//  HWTBAM
//
//  Created by Сергей Золотухин on 09.02.2023.
//

import Foundation

final class UserService {
    
    static let shared = UserService()
    let storage: KeyValueStorage = SharedStorage()
}

extension UserService {
    
    func saveUser(user: UserStruct) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(user) {
            storage.setValueData(key: user.loginName, value: data)
        }
    }

    func getUser(key: String) -> UserStruct {
        let decoder = JSONDecoder()
        let data = storage.getValueData(key: key)
        let user = try? decoder.decode(UserStruct.self, from: data!)
        return user!
    }
}
