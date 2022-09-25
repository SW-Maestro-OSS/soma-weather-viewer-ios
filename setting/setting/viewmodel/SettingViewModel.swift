//
//  SettingViewModel.swift
//  setting
//
//  Created by 김민령 on 2022/09/17.
//

import Foundation

class SettingViewModel {

    func IntToTemperature() -> Temperature{
        return Temperature(rawValue: UserDefaults.tempreatureOption)!
    }
    
    func IntToHomeView() -> HomeView {
        return HomeView(rawValue: UserDefaults.homeViewOption)!
    }
    
}
