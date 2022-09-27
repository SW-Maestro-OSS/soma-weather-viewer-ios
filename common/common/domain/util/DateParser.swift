//
//  DateFormatter.swift
//  common
//
//  Created by 김상우 on 2022/09/27.
//

import Foundation

open class DateParser {
    static let shared = DateParser()
    private let strDateFormat: String = "yyyy-MM-dd"
    private let paresedDateFormat: String = "yyyy년 MM월 dd일"
    private let strToDateFormatter = DateFormatter()
    private let dateToStrFormatter = DateFormatter()
    
    private init() {
        strToDateFormatter.dateFormat = self.strDateFormat
        dateToStrFormatter.dateFormat = self.paresedDateFormat
    }
    
    // 현재 날짜
    func getCurrentDate() -> String {
        let date = Date()
        return dateToStrFormatter.string(from: date)
    }
    
    // DTO to parsed string date = "0000년 00월 00일"
    func dtoToParsedString(_ str: String) -> String {
        guard let date = strToDateFormatter.date(from: str) else { return "" }
        return dateToStrFormatter.string(from: date)
    }
    
    // DTO to only time
    func dtoToParsedTime(_ str: String) -> String {
        let result = str.suffix(8)
        return String(result)
    }
}
