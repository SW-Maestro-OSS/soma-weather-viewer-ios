//
//  WeatherCollectionViewFlowLayout.swift
//  common-ui
//
//  Created by 김상우 on 2022/10/25.
//

import UIKit

open class WeatherCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    public override init() {
        super.init()
        initAttribute()
    }
    
    private func initAttribute() {
        scrollDirection = .horizontal
        minimumLineSpacing = 10
        minimumInteritemSpacing = 1
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
