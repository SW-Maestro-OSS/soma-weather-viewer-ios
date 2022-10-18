//
//  WeatherTableCell.swift
//  common-ui
//
//  Created by 김상우 on 2022/09/05.
//

import Foundation
import UIKit
import common
import Kingfisher

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
    
    public func bind(currentWeather: CurrentWeather) {
        print("테이블 bind 시작 = \(currentWeather)")
        if let url = URL(string: currentWeather.weatherIcon) {
            weatherImageView.kf.setImage(with: url)
        }
        dateLabel.text = String(currentWeather.date.suffix(7))
        descriptionLabel.text = "\(currentWeather.weatherStatus)"
        tempLabel.text = "\(TemperatureConverter.kelvinToCelsius(temper: currentWeather.temp))°C"
        humidityLabel.text = "\(Int(currentWeather.humidity))%"
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
            imageview.backgroundColor = .white
            imageview.contentMode = .scaleAspectFit
            imageview.layer.cornerRadius = 8
            imageview.layer.applyShadow(color: .black, alpha: 0.16, x: 0, y: 0, blur: 16)
            return imageview
        }()
        
        descriptionLabel = {
            let label = UILabel()
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textAlignment = .center
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
            $0.width.equalTo(80)
            $0.left.equalToSuperview().offset(16)
        }
        
        weatherImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(40)
            $0.left.equalTo(dateLabel.snp.right).offset(16)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(70)
            $0.left.equalTo(weatherImageView.snp.right).offset(8)
        }
        
        tempLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(descriptionLabel.snp.right).offset(16)
        }
        
        humidityLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(tempLabel.snp.right).offset(16)
        }
        
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
