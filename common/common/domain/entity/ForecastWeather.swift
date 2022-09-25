//
//  ForecastWeather.swift
//  home
//
//  Created by 김상우 on 2022/09/22.
//

import Foundation

// 예측 날씨
public struct ForecastWeather: Decodable {
    let weather: [CurrentWeather]

    enum CodingKeys: String, CodingKey {
        case list
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.weather = try container.decode([CurrentWeather].self, forKey: .list)

//        weather = try response.decode([Weather].self, forKey: .weather)

    }
}
