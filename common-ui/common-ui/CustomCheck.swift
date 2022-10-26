//
//  CustomCheck.swift
//  setting
//
//  Created by 김민령 on 2022/09/18.
//

import UIKit

open class CustomCheck: UIImageView {
    
    public override init(image: UIImage? = UIImage(systemName: "checkmark")) {
        super.init(image: image)
        tintColor = .black
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
