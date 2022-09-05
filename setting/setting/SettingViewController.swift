//
//  SettingViewController.swift
//  setting
//
//  Created by 김상우 on 2022/09/05.
//

import UIKit

open class SettingViewController: UIViewController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

