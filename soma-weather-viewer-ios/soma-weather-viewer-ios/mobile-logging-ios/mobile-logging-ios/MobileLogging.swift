//
//  MobileLogging.swift
//  mobile-logging-ios
//
//  Created by 김민령 on 2022/09/29.
//

import Foundation

protocol MobileLogging {
    func sendClickLogging(loggingScheme: LoggingScheme)
    func sendPresentLogging(loggingScheme: LoggingScheme)
}
