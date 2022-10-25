//
//  NextViewController.swift
//  home
//
//  Created by 김상우 on 2022/09/05.
//

import UIKit
import common_ui
import soma_foundation

class WeatherViewController: UIViewController {
    
    var viewTypeChangeButton = UIButton()
    var backButton = CustomBackButton()
    var weatherTableView = WeatherTableView()
    var weatherCollectionView = WeatherCollectionView(frame: CGRect.zero,
                                                      collectionViewLayout: WeatherCollectionViewFlowLayout())
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAttribute()
        initUI()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func bind() {
        guard let viewModel = viewModel else { return }
        
        viewModel.weatherRelay
            .observe(on: self) { [weak self] _ in 
                self?.weatherCollectionView.reloadData()
                self?.weatherTableView.reloadData()
            }
    }
    
    func initAttribute() {
        view.backgroundColor = .white
        weatherTableView.dataSource = self
        weatherCollectionView.delegate = self
        weatherCollectionView.dataSource = self
        weatherCollectionView.isHidden = true
        
        viewTypeChangeButton = {
            let button = UIButton()
            button.setTitle("TYPE_CHANGE".localized(), for: .normal)
            button.layer.cornerRadius = 4
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.setTitleColor(UIColor.black, for: .normal)
            button.addTarget(self, action: #selector(tapViewTypeChangeButton), for: .touchDown)
            return button
        }()
        
        backButton.addTarget(self, action: #selector(tapBackButton), for: .touchDown)
    }
    
    func initUI() {
        let guide = view.safeAreaLayoutGuide
        
        [backButton, viewTypeChangeButton, weatherCollectionView, weatherTableView]
            .forEach { view.addSubview($0) }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(guide.snp.top).offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(80)
            $0.height.equalTo(24)
        }
        
        viewTypeChangeButton.snp.makeConstraints {
            $0.top.equalTo(guide.snp.top).offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.width.equalTo(80)
            $0.height.equalTo(24)
        }
        
        weatherCollectionView.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        weatherTableView.snp.makeConstraints {
            $0.top.equalTo(viewTypeChangeButton.snp.bottom).offset(30)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview().offset(-30)
        }
    }
    
    @objc func tapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func tapViewTypeChangeButton() {
        weatherTableView.isHidden = !weatherTableView.isHidden
        weatherCollectionView.isHidden = !weatherCollectionView.isHidden
    }
}


extension WeatherViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 360)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.weatherRelay.value?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionCell.cellID, for: indexPath) as? WeatherCollectionCell else {
            return UICollectionViewCell() }
        
        guard let data = viewModel?.weatherRelay.value?[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        cell.bind(currentWeather: data)
        return cell
    }
}


extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.weatherRelay.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableCell.cellID, for: indexPath) as? WeatherTableCell else {
            return UITableViewCell()
        }
        
        guard let data = viewModel?.weatherRelay.value?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.bind(currentWeather: data)
        return cell
    }
}
