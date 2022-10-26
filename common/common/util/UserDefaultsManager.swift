//
//  UserDefault.swift
//  common
//
//  Created by 김민령 on 2022/09/22.
//

import Foundation
import RxCocoa

@propertyWrapper
public struct UserDefaultsManager<T: Codable> {
    private let key: String
    private let defaultValue: T

    public init(key: String, defaultValue: T){
        self.key = key
        self.defaultValue = defaultValue
    }

    public var wrappedValue: T {
        get {
            if let savedData = UserDefaults.standard.object(forKey: key) as? Data {
                let decoder = JSONDecoder()
                if let loadObject = try? decoder.decode(T.self, from: savedData) {
                    return loadObject
                }
            }
            return defaultValue
        }
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
    }
}

