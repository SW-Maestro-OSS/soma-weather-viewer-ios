//
//  HomeViewController.swift
//  home
//
//  Created by 김상우 on 2022/09/05.
//

import UIKit
import setting
import SnapKit
import common_ui
import common

open class HomeViewController: UIViewController {
    
    var titleLabel = UILabel()
    var backButton = CustomBackButton()
    var changeViewButton = UIButton()
    var settingButton = UIButton()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        initAttribute()
        initUI()
        
        //Test mock
//        let test = HomeViewModel()
//        test.today(lat: 44.34, lon: 10.99)
//        test.forecast(lat: 44.34, lon: 10.99)
        
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func initAttribute() {
        view.backgroundColor = .white
        
        titleLabel = {
            let label = UILabel()
            label.text = "HOME"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            return label
        }()
        
        changeViewButton = {
            let button = UIButton()
            button.setTitle("뷰 전환", for: .normal)
            button.layer.cornerRadius = 4
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.setTitleColor(UIColor.black, for: .normal)
            button.addTarget(self, action: #selector(tapViewChangeButton), for: .touchDown)
            return button
        }()
        
        settingButton = {
            let button = UIButton()
            button.setTitle("세팅", for: .normal)
            button.layer.cornerRadius = 4
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.setTitleColor(UIColor.black, for: .normal)
            button.addTarget(self, action: #selector(tapSettingButton), for: .touchDown)
            return button
        }()
        
    }
    
    func initUI() {
        
        let guide = view.layoutMarginsGuide
        
        let detailView = WeatherDetailView()
        
        [titleLabel, changeViewButton, settingButton, detailView]
            .forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(guide.snp.top).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        changeViewButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.left.equalTo(guide.snp.left).offset(16)
            $0.width.equalTo(80)
            $0.height.equalTo(24)
        }
        
        settingButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.right.equalTo(guide.snp.right).offset(-16)
            $0.width.equalTo(80)
            $0.height.equalTo(24)
        }

        detailView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(32)
            $0.right.equalToSuperview().offset(-32)
            //$0.bottom.equalToSuperview().offset(-30)
        }
        
    }
    
    @objc func tapViewChangeButton() {
        let nextViewController = WeatherViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc func tapSettingButton() {
        let settingViewController = SettingViewController()
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
    
}
