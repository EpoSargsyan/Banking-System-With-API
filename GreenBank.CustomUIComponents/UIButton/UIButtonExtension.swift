//
//  UIButtonExtension.swift
//  GreenBank.CustomUIComponents
//
//  Created by Eprem Sargsyan on 30.01.24.
//

import UIKit

public extension UIButton {
    convenience init(backgroundColor: UIColor,
                     title: String,
                     textColor: UIColor? = .white,
                     image: String? = nil) {
        self.init()
        
        self.layer.cornerRadius = 8
        self.backgroundColor = backgroundColor
        self.setTitleColor(textColor, for: .normal)
        self.setTitle(title, for: .normal)
        
        if let image {
            self.setImage(UIImage(named: image), for: .normal)
        }
    }
}
