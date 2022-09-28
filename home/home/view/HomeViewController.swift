//
//  HomeViewController.swift
//  home
//
//  Created by 김상우 on 2022/09/05.
//

import UIKit
import setting
import SnapKit
import RxSwift
import common_ui
import common

open class HomeViewController: BaseViewController {

    private let viewModel: HomeViewModelProtocol
    
    let disposeBag = DisposeBag()
    var titleLabel = UILabel()
    var changeViewButton = UIButton()
    var settingButton = UIButton()
    var detailView = WeatherDetailView()
    
    public init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        initAttribute()
        initUI()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func bind() {
        viewModel.getWeather(lat: 36, lon: 128)
        viewModel.weatherRelay
            .subscribe(on: MainScheduler.instance)
            .bind { [weak self] response in
                self?.detailView.bind(forecastWeather: response)
            }.disposed(by: disposeBag)
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
    
    
//    required public init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}
