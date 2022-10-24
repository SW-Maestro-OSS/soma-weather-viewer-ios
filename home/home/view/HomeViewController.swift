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

open class HomeViewController: BaseViewController, UICollectionViewDelegate {

    private let viewModel: HomeViewModelProtocol
    
    var titleLabel = UILabel()
    var changeViewButton = UIButton()
    var settingButton = UIButton()
    var detailView = WeatherDetailView()
    
    var weatherCollectionView: UICollectionView?
    var weatherTableView = WeatherTableView()
    
    public init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
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
        weatherCollectionView?.reloadData()
        
        viewModel.weatherRelay.observe(on: self) { [weak self] _ in
            self?.weatherCollectionView?.reloadData()
        }
        
        weatherCollectionView!.register(WeatherCollectionCell.self, forCellWithReuseIdentifier: WeatherCollectionCell.cellID)
        
        viewModel.weatherRelay.observe(on: self) { [weak self] response in
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
        
        weatherCollectionView = {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 10
            flowLayout.minimumInteritemSpacing = 1
            let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
            collectionView.backgroundColor = .white
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.layer.masksToBounds = false
            collectionView.register(WeatherCollectionCell.self, forCellWithReuseIdentifier: WeatherCollectionCell.cellID)
            collectionView.contentInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            return collectionView
        }()
        
        weatherTableView.dataSource = self
    }
    
    func initUI() {
        
        let guide = view.layoutMarginsGuide
        
        [titleLabel, changeViewButton, settingButton, weatherCollectionView!, weatherTableView]
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

        weatherCollectionView!.snp.makeConstraints {
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
            weatherCollectionView?.isHidden = false
            weatherTableView.isHidden = true
        }
        else if UserDefaults.homeViewOption == HomeViewType.tableView {
            weatherCollectionView?.isHidden = true
            weatherTableView.isHidden = false
        }
    }
    
    @objc func tapViewChangeButton() {
        let nextViewController = WeatherViewController()
        nextViewController.viewModel = viewModel
        self.navigationController?.pushViewController(nextViewController, animated: true)
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
        guard let cell = weatherCollectionView?.dequeueReusableCell(withReuseIdentifier: WeatherCollectionCell.cellID, for: indexPath) as? WeatherCollectionCell else {
            return UICollectionViewCell()
        }
        if let data = viewModel.weatherRelay.value {
            cell.bind(currentWeather: data[indexPath.row])
        }
        
        return cell
    }
        
}


extension HomeViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = viewModel.weatherRelay.value?.count else {
            return 0
        }
        return count
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
