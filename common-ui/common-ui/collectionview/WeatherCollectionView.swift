//
//  WeatherCollectionView.swift
//  common-ui
//
//  Created by 김상우 on 2022/10/25.
//

import UIKit

open class WeatherCollectionView: UICollectionView {
    
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initAttribute()
    }
    
    private func initAttribute() {
        backgroundColor = .white
        layer.masksToBounds = false
        register(WeatherCollectionCell.self, forCellWithReuseIdentifier: WeatherCollectionCell.cellID)
        contentInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
