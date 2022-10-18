//
//  WeatherTableView.swift
//  common-ui
//
//  Created by 김상우 on 2022/09/05.
//

import UIKit

open class WeatherTableView: UITableView {
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        initAttribute()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initAttribute() {
        
        self.backgroundColor = .white
        self.register(WeatherTableCell.self, forCellReuseIdentifier: WeatherTableCell.cellID)
        self.rowHeight = 60
        
    }
    
}
