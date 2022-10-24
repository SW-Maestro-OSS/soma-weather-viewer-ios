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
                                            temp: TemperatureConverter.kelvinToCelsius(temp: self.temp),
                                            tempMax: TemperatureConverter.kelvinToCelsius(temp: self.tempMax),
                                            tempMin: TemperatureConverter.kelvinToCelsius(temp: self.tempMin),
                                            humidity: self.humidity)
        return currentWeather
    }
    
    public func toFahrenheit() -> CurrentWeather {
        let currentWeather = CurrentWeather(date: self.date,
                                            weatherStatus: self.weatherStatus,
                                            weatherIcon: self.weatherIcon,
                                            temp: TemperatureConverter.kelvinToFahrenheit(temp: self.temp),
                                            tempMax: TemperatureConverter.kelvinToFahrenheit(temp: self.tempMax),
                                            tempMin: TemperatureConverter.kelvinToFahrenheit(temp: self.tempMin),
                                            humidity: self.humidity)
        return currentWeather
    }
}
