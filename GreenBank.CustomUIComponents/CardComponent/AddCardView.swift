//
//  AddCardView.swift
//  GreenBank.CustomUIComponents
//
//  Created by Anna Hakobyan on 06.03.24.
//

import UIKit

public final class AddCardCollectionViewCell: UICollectionViewCell {
    let button = UIButton()
    let topLabel = UILabel()
    let bottomLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupConstraints()
    }
    
    private func setup() {
        
        button.setTitle("+", for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.setTitleColor(.blue, for: .normal)
        button.layer.cornerRadius = 15 // Half of the height for a circular button
        button.clipsToBounds = true
        
        topLabel.text = "homePage_topLabel".localized
        topLabel.font = UIFont.systemFont(ofSize: 16)
        
        bottomLabel.text = "homePage_bottomLabel".localized
        bottomLabel.textColor = .gray
        bottomLabel.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        NotificationCenter.default
                    .post(name: NSNotification.Name("requestNewCard"),
                          object: nil)
    }
    
    func setupConstraints() {
        contentView.addSubview(button)
        contentView.addSubview(topLabel)
        contentView.addSubview(bottomLabel)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            button.widthAnchor.constraint(equalToConstant: 30), 
        ])
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: button.topAnchor),
            topLabel.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 8),
            topLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 6),
            bottomLabel.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor),
            bottomLabel.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor),
        ])
    }
}
