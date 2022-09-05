//
//  NextViewController.swift
//  home
//
//  Created by 김상우 on 2022/09/05.
//

import UIKit
import common_ui

class WeatherViewController: UIViewController {
    
    var viewTypeChangeButton = UIButton()
    var backButton = CustomBackButton()
    var weatherTableView = WeatherTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAttribute()
        initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func initAttribute() {
        view.backgroundColor = .white
        weatherTableView.dataSource = self
        
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
            $0.left.equalToSuperview().offset(32)
            $0.right.equalToSuperview().offset(-32)
            $0.bottom.equalToSuperview().offset(-30)
        }
    }
    
    @objc func tapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableCell.cellID) as? WeatherTableCell else { return UITableViewCell() }
        
        return cell
    }
}
