//
//  TextField.swift
//  GreenBank.CustomUIComponents
//
//  Created by Eprem Sargsyan on 30.01.24.
//

import UIKit

public class TextField: UITextField {
    var eyeConfiguration: Bool = false
    
    public convenience init(placeholder: String,
                            rightImage: String? = nil,
                            leftImage: String? = nil,
                            isSecureTextEntry: Bool = false) {
        self.init()
        
        self.placeholder = placeholder
        self.isSecureTextEntry = isSecureTextEntry
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        
        self.textColor = UIColor.gray
        self.font = UIFont.systemFont(ofSize: 14)
        self.rightViewMode = .always
        
        if let rightImage {
            let imageView = UIImageView(image: UIImage(named: rightImage)?.withRenderingMode(.alwaysTemplate))
            imageView.tintColor = .gray
            self.rightView = imageView
        }
        
        if let leftImage {
            let imageView = UIImageView(image: UIImage(named: leftImage))
            imageView.tintColor = .green
            self.leftView = imageView
            self.leftViewMode = .unlessEditing
        }
        
        if isSecureTextEntry {
            self.isSecureTextEntry = true
            
            let eyeButton: UIButton = {
                let button = UIButton()
                button.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
                return button
            }()
            
            eyeButtonSettings(button: eyeButton)
        }
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
    }
    
    private func eyeButtonSettings(button: UIButton) {
        if self.isSecureTextEntry {
            button.setImage(UIImage(named: "signup_eye_off_logo".localized)?.withRenderingMode(.alwaysTemplate), for: .normal)
            
            button.tintColor = .lightGray
            rightView = button
            rightViewMode = .always
        } else {
            button.setImage(UIImage(named: "signup_eye_logo".localized)?.withRenderingMode(.alwaysTemplate), for: .normal)
            self.isSecureTextEntry = false
            button.tintColor = .lightGray
            rightView = button
            rightViewMode = .always
        }
    }

    @objc func eyeButtonTapped(button: UIButton) {
        eyeConfiguration = !eyeConfiguration
        self.isSecureTextEntry = !self.isSecureTextEntry
        eyeButtonSettings(button: button)
    }
    
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        if (self.leftView != nil) {
            return bounds.insetBy(dx: 40, dy: 0)
        }
        
        return bounds.insetBy(dx: 14, dy: 0)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 14, dy: 0)
    }
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        if (self.leftView != nil) {
            return bounds.insetBy(dx: 50, dy: 0)
        }
        
        return bounds.insetBy(dx: 14, dy: 0)
    }
    
    override public func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        
        if rect.origin.x.isNaN || rect.origin.x.isInfinite {
            rect.origin.x = bounds.width - rect.width
        } else {
            rect.origin.x -= 14
        }
        
        return rect
    }
    
    public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        
        if rect.origin.x.isNaN || rect.origin.x.isInfinite {
            rect.origin.x = bounds.width - rect.width
        } else {
            rect.origin.x += 14
        }
        
        return rect
    }
}

