//
//  UserDefault.swift
//  common
//
//  Created by 김민령 on 2022/09/22.
//

import Foundation

@propertyWrapper
public struct UserDefaultsManager<T> {
    private let key: String
    private let defaultValue: T
    
    public init(key: String, defaultValue: T){
        self.key = key
        self.defaultValue = defaultValue
    }
    
    public var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
