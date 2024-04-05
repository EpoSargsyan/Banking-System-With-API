//
//  AccountLinkingTableViewCell.swift
//  GreenBank.CustomUIComponents
//
//  Created by Anna Hakobyan on 26.03.24.
//

import UIKit

public final class AccountLinkingTableViewCell: UITableViewCell {
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
    
    let textUnderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        cellTextLabel.translatesAutoresizingMaskIntoConstraints = false
        textUnderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(iconImageView)
        self.addSubview(cellTextLabel)
        self.addSubview(textUnderLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 9.5),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 9.5),
            iconImageView.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            cellTextLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 9.5),
            cellTextLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            cellTextLabel.heightAnchor.constraint(equalToConstant: 14),
            cellTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textUnderLabel.topAnchor.constraint(equalTo: cellTextLabel.bottomAnchor, constant: 2),
            textUnderLabel.leadingAnchor.constraint(equalTo: cellTextLabel.leadingAnchor),
            textUnderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textUnderLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
