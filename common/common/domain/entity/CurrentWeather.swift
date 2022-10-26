import Foundation

// 현재 날씨
public struct CurrentWeather {
    public let date: String
    public let weatherStatus: String
    public let weatherIcon: String
    public var temp: Float
    public var tempMax: Float
    public var tempMin: Float
    public let humidity: Int
    
    public func toCelsius() -> CurrentWeather {
        let currentWeather = CurrentWeather(date: self.date,
                                            weatherStatus: self.weatherStatus,
                                            weatherIcon: self.weatherIcon,
                                            temp: self.temp.kelvinToCelsius(),
                                            tempMax: self.tempMax.kelvinToCelsius(),
                                            tempMin: self.tempMin.kelvinToCelsius(),
                                            humidity: self.humidity)
        return currentWeather
    }
    
    public func toFahrenheit() -> CurrentWeather {
        let currentWeather = CurrentWeather(date: self.date,
                                            weatherStatus: self.weatherStatus,
                                            weatherIcon: self.weatherIcon,
                                            temp: self.temp.kelvinToFahrenheit(),
                                            tempMax: self.tempMax.kelvinToFahrenheit(),
                                            tempMin: self.tempMin.kelvinToFahrenheit(),
                                            humidity: self.humidity)
        return currentWeather
    }
}
