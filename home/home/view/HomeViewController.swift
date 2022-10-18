//
//  HomeViewController.swift
//  home
//
//  Created by 김상우 on 2022/09/05.
//

import UIKit
import setting
import SnapKit
//import RxSwift
import common_ui
import common
import soma_foundation

open class HomeViewController: BaseViewController, UICollectionViewDelegate {

    private let viewModel: HomeViewModelProtocol
    
//    let disposeBag = DisposeBag()
    var titleLabel = UILabel()
    var changeViewButton = UIButton()
    var settingButton = UIButton()
    var detailView = WeatherDetailView()
    
    var weatherCollectionView: UICollectionView?
    
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
    }
    
    
    //weatherRelay 관찰 -> 변경되면 detailView에 넣기
    func bind() {
        viewModel.getWeather(lat: 36, lon: 128)
        
//        viewModel.weatherRelay.observe(on: self){ [weak self] response in self?.detailView.bind(forecastWeather: response) }

//        viewModel.weatherRelay
//            .subscribe(on: MainScheduler.instance)
//            .bind { [weak self] response in
//                self?.detailView.bind(forecastWeather: response)
//            }.disposed(by: disposeBag)

        //TODO: rx없이 수정
//        weatherCollectionView!.register(WeatherCollectionCell.self, forCellWithReuseIdentifier: WeatherCollectionCell.cellID)
//        viewModel.weatherRelay.observe(on: self) { [weak self] response in
//
//        }
//
        //TODO: tableView delegate 에 dequereusableCell여기에 cell.bind(currentWeather: data) 이거 넣어서 구현하기
//        viewModel.weatherRelay
//            .subscribe(on: MainScheduler.instance)
//            .bind(to: weatherCollectionView!.items(
//                cellIdentifier: WeatherCollectionCell.cellID,
//                cellType: WeatherCollectionCell.self)
//            ) { index, data, cell in
//                cell.bind(currentWeather: data)
//            }.disposed(by: disposeBag)
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
            collectionView.layer.masksToBounds = false
            collectionView.register(WeatherCollectionCell.self, forCellWithReuseIdentifier: WeatherCollectionCell.cellID)
            collectionView.contentInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            return collectionView
        }()
    }
    
    func initUI() {
        
        let guide = view.layoutMarginsGuide
        
        [titleLabel, changeViewButton, settingButton, weatherCollectionView!]
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

//        detailView.snp.makeConstraints {
//            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
//            $0.centerX.equalToSuperview()
//            $0.left.equalToSuperview().offset(32)
//            $0.right.equalToSuperview().offset(-32)
//            //$0.bottom.equalToSuperview().offset(-30)
//        }
        
        weatherCollectionView!.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(400)
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


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 360)
    }
}
