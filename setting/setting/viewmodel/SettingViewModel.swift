//
//  SettingViewModel.swift
//  setting
//
//  Created by 김민령 on 2022/09/17.
//

import Foundation
import common

class SettingViewModel {

    func IntToTemperature() -> TemperatureType{
        return UserDefaults.tempreatureOption
    }
    
    func IntToHomeView() -> HomeViewType {
        return UserDefaults.homeViewOption
    }
    
}
