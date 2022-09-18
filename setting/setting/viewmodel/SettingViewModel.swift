//
//  SettingViewModel.swift
//  setting
//
//  Created by 김민령 on 2022/09/17.
//

import Foundation

class SettingViewModel {
    
    func IntToTemperature(_ rawValue: Int) -> Temperature{
        return Temperature(rawValue: rawValue)!
    }
    
    func IntToHomeView(_ rawValue: Int) -> HomeView {
        return HomeView(rawValue: rawValue)!
    }
    
    func setTemperatureOption(_ option: Temperature){
        UserDefaults.setTemperature(option)
    }
    
    func getTemperatureOption() -> Temperature {
        return UserDefaults.temperature()
    }
    
    func setHomeViewOption(_ option: HomeView){
        UserDefaults.setHomeView(option)
    }
    
    func getHomeViewOption() -> HomeView {
        return UserDefaults.homeView()
    }
    
}
