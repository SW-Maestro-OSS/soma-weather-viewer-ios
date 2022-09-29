//
//  BackButton.swift
//  common-ui
//
//  Created by 김상우 on 2022/09/05.
//

import UIKit

open class CustomBackButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitle("BACK_BUTTON".localized(), for: .normal)
        setTitleColor(UIColor.black, for: .normal)
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 4
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
