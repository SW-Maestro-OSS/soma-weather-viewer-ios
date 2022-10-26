//
//  DateFormatter.swift
//  common
//
//  Created by 김상우 on 2022/09/27.
//

import Foundation
import soma_foundation

open class DateParser {
    private static let strToDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    private static let dateToStrFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = I18NStrings.dateFormat.localized()
        return formatter
    }()
    
    private init(){}
    
    // 현재 날짜
    public static func getCurrentDate() -> String {
        let date = Date()
        return dateToStrFormatter.string(from: date)
    }
    
    // DTO to parsed string date = "0000년 00월 00일"
    public static func dtoToParsedString(_ str: String?) -> String? {
        guard let str = str else { return nil }
        guard let date = strToDateFormatter.date(from: str) else { return "" }
        return dateToStrFormatter.string(from: date)
    }
    
    // DTO to only time
    public static func dtoToParsedTime(_ str: String?) -> String? {
        guard let str = str else { return nil }
        let result = str.suffix(8)
        return String(result)
    }
}
