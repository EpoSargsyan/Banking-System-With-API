//
//  SegmentPickerCell.swift
//  GreenBank.CustomUIComponents
//
//  Created by Eprem Sargsyan on 28.02.24.
//

import UIKit

final class SegmentPickerCell: UITableViewCell {
    let accountLabel = UILabel(text: "home_account_text".localized,
                               textColor: AppColor.textBlack.uiColor,
                               font: UIFont.systemFont(ofSize: 16))
    
    let segmentPicker = UISegmentedControl(items: ["Current", "Saving"])
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        segmentPicker.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(accountLabel)
        self.addSubview(segmentPicker)
        
        self.frame.size.height = 90
        
        segmentPicker.selectedSegmentIndex = 0
    
        NSLayoutConstraint.activate([
            accountLabel.topAnchor.constraint(equalTo: self.topAnchor),
            accountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            segmentPicker.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 16),
            segmentPicker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            segmentPicker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            segmentPicker.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}
