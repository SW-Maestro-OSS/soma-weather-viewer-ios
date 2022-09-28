//
//  NextViewController.swift
//  home
//
//  Created by 김상우 on 2022/09/05.
//

import UIKit
import common_ui
import RxSwift
import RxCocoa

class WeatherViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    var viewTypeChangeButton = UIButton()
    var backButton = CustomBackButton()
    var weatherTableView = WeatherTableView()
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
            .subscribe(on: MainScheduler.instance)
            .bind(to: weatherTableView.rx.items(
                cellIdentifier: WeatherTableCell.cellID,
                cellType: WeatherTableCell.self)
            ) { index, data, cell in
                cell.bind(currentWeather: data)
            }.disposed(by: disposeBag)
    }
    
    func initAttribute() {
        view.backgroundColor = .white
        //weatherTableView.dataSource = self
        
        viewTypeChangeButton = {
            let button = UIButton()
            button.setTitle("타입 전환", for: .normal)
            button.layer.cornerRadius = 4
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.setTitleColor(UIColor.black, for: .normal)
            //button.addTarget(self, action: #selector(), for: .touchDown)
            return button
        }()
        
        backButton.addTarget(self, action: #selector(tapBackButton), for: .touchDown)
    }
    
    func initUI() {
        let guide = view.safeAreaLayoutGuide
        
        [backButton, viewTypeChangeButton, weatherTableView]
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
}
