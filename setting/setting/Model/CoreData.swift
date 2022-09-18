//
//  coreData.swift
//  setting
//
//  Created by 김민령 on 2022/09/18.
//

import Foundation

public enum Temperature : Int {
    case celsius //섭씨
    case fahrenheit //화씨
}

public enum HomeView: Int {
    case today
    case fiveDays
}

extension UserDefaults {
    static func setTemperature(_ option: Temperature){
        UserDefaults.standard.set(option.rawValue, forKey: "Temperature")
    }
    
    static func temperature() -> Temperature {
        let getItem = UserDefaults.standard.integer(forKey: "Temperature")
        return Temperature(rawValue: getItem)!
    }
    
    static func setHomeView(_ option: HomeView) {
        UserDefaults.standard.set(option.rawValue, forKey: "HomeView")
    }
    
    static func homeView() -> HomeView {
        let getItem = UserDefaults.standard.integer(forKey: "HomeView")
        return HomeView(rawValue: getItem)!
    }
}
