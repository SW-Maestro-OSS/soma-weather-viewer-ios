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
import soma_foundation

open class HomeViewController: BaseViewController {

    // dependencies
    private let viewModel: HomeViewModelProtocol
    private let weatherViewController: WeatherViewController
    private var weatherCollectionView: UICollectionView
    private let weatherTableView: UITableView

    var titleLabel = UILabel()
    var changeViewButton = UIButton()
    var settingButton = UIButton()

    // dependency injection
    public init(viewModel: HomeViewModelProtocol,
                weatherViewController: WeatherViewController,
                weatherCollectionView: UICollectionView,
                weatherTableView: UITableView) {
        self.viewModel = viewModel
        self.weatherViewController = weatherViewController
        self.weatherCollectionView = weatherCollectionView
        self.weatherTableView = weatherTableView
        super.init()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        initAttribute()
        initUI()
        bind()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        initUIByViewType()
    }
    
    func bind() {
        viewModel.getWeather(lat: 36, lon: 128)
        
        viewModel.weatherRelay.observe(on: self) { [weak self] _ in
            self?.weatherCollectionView.reloadData()
            self?.weatherTableView.reloadData()
        }
    }
    
    func initAttribute() {
        view.backgroundColor = .white
        
        titleLabel = {
            let label = UILabel()
            label.text = "HOME".localized()
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            return label
        }()
        
        changeViewButton = {
            let button = UIButton()
            button.setTitle("VIEW_CHANGE".localized(), for: .normal)
            button.layer.cornerRadius = 4
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.setTitleColor(UIColor.black, for: .normal)
            button.addTarget(self, action: #selector(tapViewChangeButton), for: .touchDown)
            return button
        }()
        
        settingButton = {
            let button = UIButton()
            button.setTitle("SETTING".localized(), for: .normal)
            button.layer.cornerRadius = 4
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.setTitleColor(UIColor.black, for: .normal)
            button.addTarget(self, action: #selector(tapSettingButton), for: .touchDown)
            return button
        }()
        
        weatherCollectionView.delegate = self
        weatherCollectionView.dataSource = self
        
        weatherTableView.dataSource = self
    }
    
    func initUI() {
        
        let guide = view.layoutMarginsGuide
        
        [titleLabel, changeViewButton, settingButton, weatherCollectionView, weatherTableView]
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

        weatherCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        weatherTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-50)
        }
        
    }
    
    func initUIByViewType() {
        if UserDefaults.homeViewOption == HomeViewType.cardView {
            weatherCollectionView.isHidden = false
            weatherTableView.isHidden = true
        }
        else if UserDefaults.homeViewOption == HomeViewType.tableView {
            weatherCollectionView.isHidden = true
            weatherTableView.isHidden = false
        }
    }
    
    @objc func tapViewChangeButton() {
        self.navigationController?.pushViewController(weatherViewController, animated: true)
    }
    
    @objc func tapSettingButton() {
        let settingViewController = SettingViewController()
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
    
}


extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 360)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.weatherRelay.value?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = weatherCollectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionCell.cellID, for: indexPath) as? WeatherCollectionCell else {
            return UICollectionViewCell()
        }
        
        guard let data = viewModel.weatherRelay.value else {
            return UICollectionViewCell()
        }
        
        cell.bind(currentWeather: data[indexPath.row])
        return cell
    }
        
}


extension HomeViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.weatherRelay.value?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableCell.cellID, for: indexPath) as? WeatherTableCell else { return UITableViewCell() }
        
        guard let data = viewModel.weatherRelay.value?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.bind(currentWeather: data)
        return cell
    }
}
