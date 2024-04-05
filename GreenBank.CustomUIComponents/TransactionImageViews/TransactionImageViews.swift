//
//  TransactionImageViews.swift
//  GreenBank.CustomUIComponents
//
//  Created by Eprem Sargsyan on 27.03.24.
//

import UIKit

final public class TransactionImageViews: UIView {
    let label = UILabel(text: "",
                        textColor: AppColor.accentDefault.uiColor,
                        font: UIFont.systemFont(ofSize: 14))
    
    var imageView = UIImageView()
    
    public var navigationBtn = UIButton()
    
    public init(text: String, imageName: String) {
        super.init(frame: .zero)
        
        label.text = text
        imageView.image = UIImage(named: imageName)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        navigationBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(label)
        self.addSubview(imageView)
        self.addSubview(navigationBtn)
        
        navigationBtn.backgroundColor = .none
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 23),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            navigationBtn.topAnchor.constraint(equalTo: self.topAnchor),
            navigationBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navigationBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            navigationBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
