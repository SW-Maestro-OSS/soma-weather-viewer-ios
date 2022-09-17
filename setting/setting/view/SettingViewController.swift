//
//  SettingViewController.swift
//  setting
//
//  Created by 김상우 on 2022/09/05.
//

import UIKit
import SnapKit

open class SettingViewController: UIViewController {
    
    private var temperatureOptionStackView = UIStackView()
    private var temperatureOptionLabel = UILabel()
    private var celsiusButton = UIButton()
    private var celsiusLabel = UILabel()
    private var fahrenheitButton = UIButton()
    private var fahrenheitLabel = UILabel()
    
    private var homeOptionStackView = UIStackView()
    private var homeOptionLabel = UILabel()
    private var todayButton = UIButton()
    private var todayLabel = UILabel()
    private var fiveDaysButton = UIButton()
    private var fiveDaysLabel = UILabel()
    
    private var check = UIImage(systemName: "checkmark")
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initAttribute()
        initUI()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func initAttribute() {
        view.backgroundColor = .white
        
        temperatureOptionLabel = {
            let label = UILabel()
            label.text = "온도 표현 방식"
            
            return label
        }()
        
        celsiusButton = {
            let button = UIButton()
            button.backgroundColor = .gray
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.darkGray.cgColor
//            button.addSubview(celsiusLabel)
            
            return button
        }()
        
        celsiusLabel = {
            let label = UILabel()
            label.text = "섭씨"
            label.textColor = .black
            
            return label
        }()
        
        fahrenheitButton = {
            let button = UIButton()
            button.backgroundColor = .gray
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.darkGray.cgColor
//            button.addSubview(fahrenheitLabel)
            
            return button
        }()
        
        fahrenheitLabel = {
            let label = UILabel()
            label.text = "화씨"
            label.textColor = .black
            
            return label
        }()
        
        
        
        temperatureOptionStackView = {
            let st = UIStackView(arrangedSubviews: [temperatureOptionLabel ,celsiusButton, fahrenheitButton])
            st.spacing = 0
            st.axis = .vertical
            st.distribution = .fillEqually
            st.alignment = .fill
            
            return st
        }()
        
        homeOptionLabel = {
            let label = UILabel()
            label.text = "홈 화면 콘텐츠"
            
            return label
        }()
        
        todayButton = {
            let button = UIButton()
            button.backgroundColor = .gray
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.darkGray.cgColor
//            button.addSubview(todayLabel)
            
            return button
        }()
        
        todayLabel = {
            let label = UILabel()
            label.text = "현재날씨"
            label.textColor = .black
            
            return label
        }()
        
       fiveDaysButton = {
           let button = UIButton()
           button.backgroundColor = .gray
           button.layer.borderWidth = 1
           button.layer.borderColor = UIColor.darkGray.cgColor
//           button.addSubview(fiveDaysLabel)
           
           return button
       }()
        
        fiveDaysLabel = {
            let label = UILabel()
            label.text = "5일치 날씨"
            label.textColor = .black
            
            return label
        }()
        
        
        homeOptionStackView = {
            let st = UIStackView(arrangedSubviews: [homeOptionLabel ,todayButton, fiveDaysButton])
            st.spacing = 0
            st.axis = .vertical
            st.distribution = .fillEqually
            st.alignment = .fill

            return st
        }()
        
    }
    
    func initUI(){
        
        [temperatureOptionLabel, celsiusButton, fahrenheitButton].forEach { temperatureOptionStackView.addArrangedSubview($0) }
        [homeOptionLabel, todayButton, fiveDaysButton].forEach { homeOptionStackView.addArrangedSubview($0)}

        [temperatureOptionStackView, homeOptionStackView].forEach{ view.addSubview($0)}
        
        celsiusButton.addSubview(celsiusLabel)
        fahrenheitButton.addSubview(fahrenheitLabel)
        todayButton.addSubview(todayLabel)
        fiveDaysButton.addSubview(fiveDaysLabel)
        
        temperatureOptionStackView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        homeOptionStackView.snp.makeConstraints { make in
            make.top.equalTo(temperatureOptionStackView.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        
        celsiusLabel.snp.makeConstraints { make in
            make.leading.equalTo(celsiusButton.snp.leading).offset(10)
            make.centerY.equalToSuperview()
        }
        
        fahrenheitLabel.snp.makeConstraints { make in
            make.leading.equalTo(fahrenheitButton.snp.leading).offset(10)
            make.centerY.equalToSuperview()
        }
        
        todayLabel.snp.makeConstraints { make in
            make.leading.equalTo(todayButton.snp.leading).offset(10)
            make.centerY.equalToSuperview()
        }
        
        fiveDaysLabel.snp.makeConstraints { make in
            make.leading.equalTo(fiveDaysButton.snp.leading).offset(10)
            make.centerY.equalToSuperview()
        }
        
    }
    
}

