//
//  Dependable.swift
//  common
//
//  Created by 김상우 on 2022/09/20.
//

import Foundation

public protocol Dependable {
    associatedtype T
    var dependencies: T! { get set }
}
