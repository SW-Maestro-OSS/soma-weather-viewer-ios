//
//  WeatherTableCell.swift
//  common-ui
//
//  Created by 김상우 on 2022/09/05.
//

import Foundation
import UIKit

open class WeatherTableCell: UITableViewCell {
    
    public static let cellID = "weather_table_cell"
    var superView = UIView()
    var dateLabel = UILabel()
    var weatherImageView = UIImageView()
    var descriptionLabel = UILabel()
    var tempLabel = UILabel()
    var humidityLabel = UILabel()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initAttribute()
        initUI()
    }
    
    func initAttribute() {
        superView = {
            let view = UIView()
            view.backgroundColor = .white
            return view
        }()
        
        dateLabel = {
            let label = UILabel()
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()
        
        weatherImageView = {
            let imageview = UIImageView()
            imageview.backgroundColor = .lightGray
            imageview.contentMode = .scaleAspectFit
            return imageview
        }()
        
        descriptionLabel = {
            let label = UILabel()
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            return label
        }()
        
        tempLabel = {
            let label = UILabel()
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            return label
        }()
        
        humidityLabel = {
            let label = UILabel()
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()
    }
    
    func initUI() {
        
        addSubview(superView)

        [dateLabel, weatherImageView, descriptionLabel, tempLabel, humidityLabel]
            .forEach { superView.addSubview($0) }
        
        superView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
        }
        
        weatherImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(dateLabel.snp.right).offset(16)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(weatherImageView.snp.right).offset(16)
        }
        
        tempLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(descriptionLabel.snp.right).offset(8)
        }
        
        humidityLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(tempLabel.snp.right).offset(8)
        }
        
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
