//
//  EmptyAccountCell.swift
//  GreenBank.CustomUIComponents
//
//  Created by Anna Hakobyan on 28.03.24.
//

import UIKit


final public class EmptyAccountCell: UITableViewCell {
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
        cellTextLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cellTextLabel)
        
        NSLayoutConstraint.activate([
            cellTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            cellTextLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            cellTextLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}
