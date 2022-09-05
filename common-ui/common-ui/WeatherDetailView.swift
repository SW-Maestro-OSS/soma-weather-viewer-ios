//
//  WeatherDetailView.swift
//  common-ui
//
//  Created by 김상우 on 2022/09/05.
//

import UIKit
import SnapKit

open class WeatherDetailView: UIView {
    var dateLabel = UILabel()
    var weatherImageView = UIImageView()
    var descriptionLabel = UILabel()
    var tempLabel = UILabel()
    var tempMaxLabel = UILabel()
    var tempMinLabel = UILabel()
    var humidityLabel = UILabel()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initAttribute()
        initUI()
    }

    func initAttribute() {
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 8
        
        dateLabel = {
            let label = UILabel()
            label.text = "2022년 9월 5일"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 20)
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
            label.text = "태풍 오는 중"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            return label
        }()
        
        tempLabel = {
            let label = UILabel()
            label.text = "평균 온도 29'C"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            return label
        }()
        
        tempMaxLabel = {
            let label = UILabel()
            label.text = "최고 온도 32'C"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            return label
        }()
        
        tempMinLabel = {
            let label = UILabel()
            label.text = "최저 온도 28'C"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            return label
        }()
        
        humidityLabel = {
            let label = UILabel()
            label.text = "습도 69%"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            return label
        }()
    }
    
    
    func initUI() {
        [dateLabel, weatherImageView, tempLabel, tempMaxLabel, tempMinLabel, humidityLabel]
            .forEach { self.addSubview($0) }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(16)
            $0.width.equalTo(80)
            $0.height.equalTo(80)
            $0.centerX.equalToSuperview()
        }
        
        tempLabel.snp.makeConstraints {
            $0.top.equalTo(weatherImageView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        tempMaxLabel.snp.makeConstraints {
            $0.top.equalTo(tempLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        tempMinLabel.snp.makeConstraints {
            $0.top.equalTo(tempMaxLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        humidityLabel.snp.makeConstraints {
            $0.top.equalTo(tempMinLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-16)
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
