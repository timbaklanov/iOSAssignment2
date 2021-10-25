//
//  CustomButton.swift
//  assignment2
//
//  Created by Тимур Бакланов on 25.10.2021.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.borderWidth = 1
        layer.cornerRadius = 15
    }
    
}
