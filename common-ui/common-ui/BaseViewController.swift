//
//  BaseViewController.swift
//  common-ui
//
//  Created by 김상우 on 2022/09/26.
//

import UIKit

// init UIViewController without Storyboard
open class BaseViewController: UIViewController {
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable, message: "remove required init")
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
