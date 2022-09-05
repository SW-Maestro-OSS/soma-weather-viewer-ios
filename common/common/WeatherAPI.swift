//
//  WeatherAPI.swift
//  common
//
//  Created by 김민령 on 2022/09/05.
//

import Foundation
import Moya

public enum WeatherAPI {
    case today(lat: Float, lon: Float)
    case forecast(lat: Float, lon: Float)
}

extension WeatherAPI : TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.openweathermap.org/data/2.5")!
    }
    
    public var path: String {
        switch self {
        case .today:
            return "/weather"
        case .forecast:
            return "/forecast"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .today, .forecast:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .today(let lat, let lon), .forecast(let lat, let lon):
            return .requestParameters(parameters: ["lat" : lat, "lon": lon, "appid": "ebf570c2cd766862f873321c5527f30e"], encoding: URLEncoding.queryString)
        }
    }
    
    public var headers: [String : String]? {
        return .none
    }
    
    
}
