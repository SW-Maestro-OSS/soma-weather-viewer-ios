//
//  HomeViewController.swift
//  home
//
//  Created by 김상우 on 2022/09/05.
//

import UIKit
import setting
import SnapKit

open class HomeViewController: UIViewController {
    
    var titleLabel = UILabel()
    var changeViewButton = UIButton()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        initAttribute()
        initUI()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
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
            button.addTarget(self, action: #selector(tapViewChange), for: .touchDown)
            return button
        }()
        
    }
    
    func initUI() {
        
        let guide = view.layoutMarginsGuide
        
        [titleLabel, changeViewButton]
            .forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(guide.snp.top).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        changeViewButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.left.equalTo(guide.snp.left).offset(16)
            $0.width.equalTo(60)
            $0.height.equalTo(24)
        }

        
    }
    
    @objc func tapViewChange() {
        let settingViewController = SettingViewController()
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
    
}
