//
//  KeyboardButton.swift
//  assignment2
//
//  Created by Тимур Бакланов on 26.10.2021.
//

import UIKit

class KeyboardButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = 10
        self.setTitleColor(UIColor.black, for: .normal)
        layer.backgroundColor = UIColor.systemGray6.cgColor
    }

}
