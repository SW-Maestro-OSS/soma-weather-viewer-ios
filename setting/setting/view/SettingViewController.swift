//
//  SettingViewController.swift
//  setting
//
//  Created by 김상우 on 2022/09/05.
//

import UIKit
import SnapKit
import soma_foundation
import common
import common_ui
import RxCocoa

open class SettingViewController: BaseViewController {
    
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
    
    var temperatureMode : TemperatureType?
    var homeViewMode : HomeViewType?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.temperatureMode = UserDefaults.tempreatureOption
        self.homeViewMode = UserDefaults.homeViewOption
        
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
            label.text = I18NStrings.temperatureOption.localized()
            return label
        }()
        
        celsiusButton = {
            let button = UIButton()
            button.backgroundColor = .lightGray
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.darkGray.cgColor
            button.tag = TemperatureType.celsius.rawValue
            button.addTarget(self, action: #selector(temperatureOptionTouched), for: .touchUpInside)
            return button
        }()
        
        celsiusLabel = {
            let label = UILabel()
            label.text = I18NStrings.celsius.localized()
            label.textColor = .black
            return label
        }()
        
        fahrenheitButton = {
            let button = UIButton()
            button.backgroundColor = .lightGray
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.darkGray.cgColor
            button.tag = TemperatureType.fahrenheit.rawValue
            button.addTarget(self, action: #selector(temperatureOptionTouched), for: .touchUpInside)
            return button
        }()
        
        fahrenheitLabel = {
            let label = UILabel()
            label.text = I18NStrings.fahrenheit.localized()
            label.textColor = .black
            return label
        }()
        
        temperatureOptionStackView = {
            let stackView = UIStackView(arrangedSubviews: [temperatureOptionLabel ,celsiusButton, fahrenheitButton])
            stackView.spacing = 0
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.alignment = .fill
            stackView.spacing = 1
            return stackView
        }()
        
        homeOptionLabel = {
            let label = UILabel()
            label.text = I18NStrings.homeOption.localized()
            return label
        }()
        
        todayButton = {
            let button = UIButton()
            button.backgroundColor = .lightGray
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.darkGray.cgColor
            button.tag = HomeViewType.cardView.rawValue
            button.addTarget(self, action: #selector(homeViewOptionTouched), for: .touchUpInside)
            return button
        }()
        
        todayLabel = {
            let label = UILabel()
            label.text = I18NStrings.currentWeather.localized()
            label.textColor = .black
            return label
        }()
        
        fiveDaysButton = {
            let button = UIButton()
            button.backgroundColor = .lightGray
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.darkGray.cgColor
            button.tag = HomeViewType.tableView.rawValue
            button.addTarget(self, action: #selector(homeViewOptionTouched), for: .touchUpInside)
            return button
        }()
        
        fiveDaysLabel = {
            let label = UILabel()
            label.text = I18NStrings.fiveDaysWeather.localized()
            label.textColor = .black
            return label
        }()
        
        homeOptionStackView = {
            let stackView = UIStackView(arrangedSubviews: [homeOptionLabel ,todayButton, fiveDaysButton])
            stackView.spacing = 0
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.alignment = .fill
            stackView.spacing = 1
            return stackView
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
        
        changeTemperatureOption(UserDefaults.tempreatureOption)
        changeHomeViewOption(UserDefaults.homeViewOption)
        
    }
    
    func checkConstraints(_ check: CustomCheck){
        check.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
    }
    
    func changeTemperatureOption(_ option: TemperatureType){
        switch option {
        case .celsius:
            celsiusButton.addSubview(temperCheck)
        case .fahrenheit:
            fahrenheitButton.addSubview(temperCheck)
        }
        checkConstraints(temperCheck)
    }
    
    func changeHomeViewOption(_ option: HomeViewType) {
        switch option {
        case .cardView:
            todayButton.addSubview(homeViewCheck)
        case .tableView:
            fiveDaysButton.addSubview(homeViewCheck)
        }
        checkConstraints(homeViewCheck)
    }
    
    @objc func temperatureOptionTouched(button: UIButton) {
        guard let type = TemperatureType(rawValue: button.tag) else { return }
        UserDefaults.tempreatureOption = type
        UserDefaults.temperatureTypeRelay.accept(type)
        changeTemperatureOption(UserDefaults.tempreatureOption)
        temperatureMode = UserDefaults.tempreatureOption
    }
    
    @objc func homeViewOptionTouched(button: UIButton){
        guard let type = HomeViewType(rawValue: button.tag) else { return }
        UserDefaults.homeViewOption = type
        changeHomeViewOption(UserDefaults.homeViewOption)
        homeViewMode = UserDefaults.homeViewOption
    }
}

