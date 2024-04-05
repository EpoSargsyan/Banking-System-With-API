//
//  CustomTableViewCell.swift
//  GreenBank.CustomUIComponents
//
//  Created by Eprem Sargsyan on 22.02.24.
//

import UIKit

final public class CustomTableViewCell: UITableViewCell {
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let cellTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        cellTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(iconImageView)
        self.addSubview(cellTextLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17),
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            cellTextLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            cellTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellTextLabel.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
