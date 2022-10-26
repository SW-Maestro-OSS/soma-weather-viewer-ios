//
//  UserDefault+Extension.swift
//  common
//
//  Created by 김상우 on 2022/10/26.
//

import Foundation
import RxCocoa

extension UserDefaults {
    @UserDefaultsManager(key: "Temperature", defaultValue: TemperatureType.celsius)
    public static var tempreatureOption: TemperatureType
    
    @UserDefaultsManager(key: "HomeView", defaultValue: HomeViewType.cardView)
    public static var homeViewOption: HomeViewType
    
    public static let temperatureTypeRelay = BehaviorRelay<TemperatureType>(value: UserDefaults.tempreatureOption)
}
