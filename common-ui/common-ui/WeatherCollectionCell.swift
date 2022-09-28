//
//  WeatherCollectionCell.swift
//  common-ui
//
//  Created by 김상우 on 2022/09/06.
//

import UIKit
import common

open class WeatherCollectionCell: UICollectionViewCell {
    
    public static let cellID = "weather_collection_cell"
    var detailView = WeatherDetailView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)

        initAttribute()
        initUI()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func bind(currentWeather: CurrentWeather) {
        detailView.bind(currentWeather: currentWeather)
    }
    
    func initAttribute() {
        self.backgroundColor = .gray
    }
    
    func initUI() {
        contentView.addSubview(detailView)
        detailView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
