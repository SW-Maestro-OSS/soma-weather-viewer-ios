//
//  String+Extension.swift
//  common
//
//  Created by 김상우 on 2022/10/26.
//

import Foundation

extension String {
    
    public func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
    
    //argurment가 있는 경우
    public func localized(with argument: CVarArg = [], comment: String = "") -> String {
        //argurment가 여러개일 경우
        if let arguments = argument as? [CVarArg] {
            return String(format: self.localized(comment: comment), arguments: arguments)
        }
        return String(format: self.localized(comment: comment), argument)
    }
    
}
