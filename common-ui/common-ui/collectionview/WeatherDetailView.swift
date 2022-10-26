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
    var superView = UIView()
    var dateLabel = UILabel()
    var weatherImageView = UIImageView()
    var descriptionLabel = UILabel()
    var tempLabel = UILabel()
    var tempMaxLabel = UILabel()
    var tempMinLabel = UILabel()
    var humidityLabel = UILabel()
    let viewHeight: CGFloat = 360
    let viewWidth: CGFloat = 300
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initAttribute()
        initUI()
    }
    
    public func bind(currentWeather: CurrentWeather?) {
        guard let data = currentWeather else { return }
        if let url = URL(string: data.weatherIcon) {
            weatherImageView.kf.setImage(with: url)
        }
        dateLabel.text = data.date
        descriptionLabel.text = data.weatherStatus
        var tempText = "\(Int(data.temp))"
        var tempMaxText = "\(Int(data.tempMax))"
        var tempMinText = "\(Int(data.tempMin))"
        if UserDefaults.tempreatureOption == .celsius {
            tempText += "°C"
            tempMaxText += "°C"
            tempMinText += "°C"
        }
        else {
            tempText += "°F"
            tempMaxText += "°F"
            tempMinText += "°F"
        }
        tempLabel.text = I18NStrings.currentTemperature.localized() + tempText
        tempMaxLabel.text = I18NStrings.maxTemperature.localized() + tempMaxText
        tempMinLabel.text = I18NStrings.minTermperature.localized() + tempMinText
        humidityLabel.text = I18NStrings.humidity.localized() + "\(data.humidity)%"
    }

    func initAttribute() {
        
        self.backgroundColor = .white
        superView.backgroundColor = .white
        superView.layer.cornerRadius = 14
        superView.layer.masksToBounds = false
        superView.layer.applyShadow(color: .black, alpha: 0.16, x: 0, y: 0, blur: 30)
        
        dateLabel = {
            let label = UILabel()
            label.text = " "
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 18)
            return label
        }()
        
        weatherImageView = {
            let imageview = UIImageView()
            imageview.backgroundColor = .white
            imageview.contentMode = .scaleAspectFit
            imageview.layer.masksToBounds = false
            return imageview
        }()
        
        descriptionLabel = {
            let label = UILabel()
            label.text = ""
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 18)
            return label
        }()
        
        tempLabel = {
            let label = UILabel()
            label.text = ""
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 14)
            return label
        }()
        
        tempMaxLabel = {
            let label = UILabel()
            label.text = ""
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 14)
            return label
        }()
        
        tempMinLabel = {
            let label = UILabel()
            label.text = ""
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 14)
            return label
        }()
        
        humidityLabel = {
            let label = UILabel()
            label.text = ""
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 14)
            return label
        }()
    }
    
    
    func initUI() {
        
        self.addSubview(superView)
        
        self.snp.makeConstraints {
            $0.height.equalTo(viewHeight)
            $0.width.equalTo(viewWidth)
        }
        
        superView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        [dateLabel, weatherImageView, descriptionLabel, tempLabel, tempMaxLabel, tempMinLabel, humidityLabel]
            .forEach { superView.addSubview($0) }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(16)
            $0.width.equalTo(140)
            $0.height.equalTo(140)
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
