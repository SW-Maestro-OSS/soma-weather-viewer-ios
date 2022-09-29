//
//  WeatherDetailView.swift
//  common-ui
//
//  Created by 김상우 on 2022/09/05.
//

import UIKit
import SnapKit
import Kingfisher
import common
import soma_foundation

open class WeatherDetailView: UIView {
    var dateLabel = UILabel()
    var weatherImageView = UIImageView()
    var descriptionLabel = UILabel()
    var tempLabel = UILabel()
    var tempMaxLabel = UILabel()
    var tempMinLabel = UILabel()
    var humidityLabel = UILabel()
    let viewHeight: CGFloat = 340
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initAttribute()
        initUI()
    }
    
    public func bind(forecastWeather: ForecastWeather?) {
        guard let data = forecastWeather?.list?[0] else { return }
        if let url = URL(string: data.weatherIcon) {
            weatherImageView.kf.setImage(with: url)
        }
        dateLabel.text = data.date
        descriptionLabel.text = data.weatherStatus
        tempLabel.text = "CURRENT_TEMPERATURE_%d".localized(with: TemperatureConverter.kelvinToCelsius(temper: data.temp))
        tempMaxLabel.text = "MAX_TEMPERATURE_%d".localized(with: data.tempMax)
        tempMinLabel.text = "MIN_TEMPERATURE_%d".localized(with: data.tempMin)
        humidityLabel.text = "HUMIDITY_%d".localized(with: data.humidity)
    }

    func initAttribute() {
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 8
        
        dateLabel = {
            let label = UILabel()
            label.text = " "
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 20)
            return label
        }()
        
        weatherImageView = {
            let imageview = UIImageView()
            imageview.backgroundColor = .white
            imageview.contentMode = .scaleAspectFit
            return imageview
        }()
        
        descriptionLabel = {
            let label = UILabel()
            label.text = ""
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 20)
            return label
        }()
        
        tempLabel = {
            let label = UILabel()
            label.text = ""
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()
        
        tempMaxLabel = {
            let label = UILabel()
            label.text = ""
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()
        
        tempMinLabel = {
            let label = UILabel()
            label.text = ""
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()
        
        humidityLabel = {
            let label = UILabel()
            label.text = ""
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()
    }
    
    
    func initUI() {
        
        self.snp.makeConstraints {
            $0.height.equalTo(viewHeight)
        }
        
        [dateLabel, weatherImageView, descriptionLabel, tempLabel, tempMaxLabel, tempMinLabel, humidityLabel]
            .forEach { self.addSubview($0) }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(16)
            $0.width.equalTo(120)
            $0.height.equalTo(120)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(weatherImageView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        tempLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        tempMaxLabel.snp.makeConstraints {
            $0.top.equalTo(tempLabel.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
        
        tempMinLabel.snp.makeConstraints {
            $0.top.equalTo(tempMaxLabel.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
        
        humidityLabel.snp.makeConstraints {
            $0.top.equalTo(tempMinLabel.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
