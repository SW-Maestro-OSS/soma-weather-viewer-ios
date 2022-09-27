import Foundation

// 현재 날씨
public struct CurrentWeather {
    public let date: String
    public let weatherStatus: String
    public let weatherIcon: String
    public let temp: Float
    public let tempMax: Float
    public let tempMin: Float
    public let humidity: Int
}
