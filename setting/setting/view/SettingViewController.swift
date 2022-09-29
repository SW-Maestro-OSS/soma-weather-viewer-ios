//
//  SettingViewController.swift
//  setting
//
//  Created by 김상우 on 2022/09/05.
//

import UIKit
import SnapKit
import soma_foundation

open class SettingViewController: UIViewController {
    
    let viewModel = SettingViewModel()
    
    //MARK: property init
    private var temperatureOptionStackView = UIStackView()
    private var temperatureOptionLabel = UILabel()
    private var celsiusButton = UIButton()
    private var celsiusLabel = UILabel()
    private var fahrenheitButton = UIButton()
    private var fahrenheitLabel = UILabel()
    private var temperCheck = CustomCheck()
    
    private var homeOptionStackView = UIStackView()
    private var homeOptionLabel = UILabel()
    private var todayButton = UIButton()
    private var todayLabel = UILabel()
    private var fiveDaysButton = UIButton()
    private var fiveDaysLabel = UILabel()
    private var homeViewCheck = CustomCheck()
    
    
    var temperatureMode : Temperature?
    var homeViewMode : HomeView?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.temperatureMode = viewModel.IntToTemperature()
        self.homeViewMode = viewModel.IntToHomeView()
        
        initAttribute()
        initUI()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    //MARK: view attribute
    func initAttribute() {
        view.backgroundColor = .white
        
        temperatureOptionLabel = {
            let label = UILabel()
            label.text = "TEMPERATURE_OPTION".localized()
            
            return label
        }()
        
        celsiusButton = {
            let button = UIButton()
            button.backgroundColor = .gray
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.darkGray.cgColor
//            button.addSubview(celsiusLabel)
            button.tag = Temperature.celsius.rawValue
            button.addTarget(self, action: #selector(temperatureOptionTouched), for: .touchUpInside)
            
            return button
        }()
        
        celsiusLabel = {
            let label = UILabel()
            label.text = "CELSIUS".localized()
            label.textColor = .black
            
            return label
        }()
        
        fahrenheitButton = {
            let button = UIButton()
            button.backgroundColor = .gray
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.darkGray.cgColor
//            button.addSubview(fahrenheitLabel)
            button.tag = Temperature.fahrenheit.rawValue
            button.addTarget(self, action: #selector(temperatureOptionTouched), for: .touchUpInside)
            
            return button
        }()
        
        fahrenheitLabel = {
            let label = UILabel()
            label.text = "FAHRENHEIT".localized()
            label.textColor = .black
            
            return label
        }()
        
        
        
        temperatureOptionStackView = {
            let st = UIStackView(arrangedSubviews: [temperatureOptionLabel ,celsiusButton, fahrenheitButton])
            st.spacing = 0
            st.axis = .vertical
            st.distribution = .fillEqually
            st.alignment = .fill
            st.spacing = 1
            
            return st
        }()
        
        homeOptionLabel = {
            let label = UILabel()
            label.text = "HOME_OPTION".localized()
            
            return label
        }()
        
        todayButton = {
            let button = UIButton()
            button.backgroundColor = .gray
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.darkGray.cgColor
//            button.addSubview(todayLabel)
            button.tag = HomeView.today.rawValue
            button.addTarget(self, action: #selector(homeViewOptionTouched), for: .touchUpInside)
            
            return button
        }()
        
        todayLabel = {
            let label = UILabel()
            label.text = "CURRENT_WEATHER".localized()
            label.textColor = .black
            
            return label
        }()
        
       fiveDaysButton = {
           let button = UIButton()
           button.backgroundColor = .gray
           button.layer.borderWidth = 1
           button.layer.borderColor = UIColor.darkGray.cgColor
           button.tag = HomeView.fiveDays.rawValue
           button.addTarget(self, action: #selector(homeViewOptionTouched), for: .touchUpInside)
//           button.addSubview(fiveDaysLabel)
           
           return button
       }()
        
        fiveDaysLabel = {
            let label = UILabel()
            label.text = "FIVE_DAYS_WEATHER".localized()
            label.textColor = .black
            
            return label
        }()
        
        
        homeOptionStackView = {
            let st = UIStackView(arrangedSubviews: [homeOptionLabel ,todayButton, fiveDaysButton])
            st.spacing = 0
            st.axis = .vertical
            st.distribution = .fillEqually
            st.alignment = .fill
            st.spacing = 1

            return st
        }()
        
    }
    
    //MARK: auto layout
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
        
        changeTemperatureOption(viewModel.IntToTemperature())
        changeHomeViewOption(viewModel.IntToHomeView())
        
    }
    
    func checkConstraints(_ check: CustomCheck){
        check.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
    }
    
    func changeTemperatureOption(_ option: Temperature){
        switch option {
        case .celsius:
            celsiusButton.addSubview(temperCheck)
        case .fahrenheit:
            fahrenheitButton.addSubview(temperCheck)
        }
        checkConstraints(temperCheck)
    }
    
    func changeHomeViewOption(_ option: HomeView) {
        
        switch option {
        case .today:
            todayButton.addSubview(homeViewCheck)
        case .fiveDays:
            fiveDaysButton.addSubview(homeViewCheck)
        }
        
        checkConstraints(homeViewCheck)
    }
    
    @objc func temperatureOptionTouched(button: UIButton) {
        UserDefaults.tempreatureOption = button.tag
        
        changeTemperatureOption(viewModel.IntToTemperature())
        
        temperatureMode = viewModel.IntToTemperature()
        print("🤖 Now temperature mode : \(temperatureMode)")
    }
    
    @objc func homeViewOptionTouched(button: UIButton){
        UserDefaults.homeViewOption = button.tag
        
        changeHomeViewOption(viewModel.IntToHomeView())
        
        homeViewMode = viewModel.IntToHomeView()
        print("🤖 Now homeView mode : \(homeViewMode)")
        
    }

    
}

