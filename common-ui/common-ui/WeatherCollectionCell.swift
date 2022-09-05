//
//  WeatherCollectionCell.swift
//  common-ui
//
//  Created by 김상우 on 2022/09/06.
//

import UIKit

open class WeatherCollectionCell: UICollectionViewCell {
    
    public static let cellID = "weather_collection_cell"
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
