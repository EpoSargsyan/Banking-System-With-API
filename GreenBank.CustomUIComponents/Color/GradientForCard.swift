//
//  GradientForCard.swift
//  GreenBank.CustomUIComponents
//
//  Created by Anna Hakobyan on 19.03.24.
//

import UIKit

extension UIView {
    func applyGradient(colors: [String]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = 30
        gradientLayer.frame = self.bounds
        var cgColors: [CGColor] = []
        for colorString in colors {
            cgColors.append(UIColor(hex: colorString, alpha: 1).cgColor)
        }
        gradientLayer.colors = cgColors
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
