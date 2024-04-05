//
//  TransactionsView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 20.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

final class TransactionsView: UIView {
    public let segmentPicker = UISegmentedControl(items: ["Transactions", "Templates"])
    
    let transferAccount = TransactionImageViews(text: "Transfer to Account", imageName: "transferAccount")
    
    let transferToCard = TransactionImageViews(text: "Transfer to Card", imageName: "transferCard")
    
    let easyTransfer = TransactionImageViews(text: "Easy transfer", imageName: "easyTransfer")
    
    let qrTransfer = TransactionImageViews(text: "QR transfer", imageName: "qrTransfer")
    
    public func setupUI() {
        segmentPicker.translatesAutoresizingMaskIntoConstraints = false
        transferAccount.translatesAutoresizingMaskIntoConstraints = false
        transferToCard.translatesAutoresizingMaskIntoConstraints = false
        easyTransfer.translatesAutoresizingMaskIntoConstraints = false
        qrTransfer.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(segmentPicker)
        self.addSubview(transferAccount)
        self.addSubview(transferToCard)
        self.addSubview(easyTransfer)
        self.addSubview(qrTransfer)
        
        segmentPicker.selectedSegmentIndex = 0
        
        NSLayoutConstraint.activate([
            segmentPicker.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            segmentPicker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            segmentPicker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            segmentPicker.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        NSLayoutConstraint.activate([
            transferAccount.topAnchor.constraint(equalTo: segmentPicker.bottomAnchor, constant: 30),
            transferAccount.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            transferAccount.widthAnchor.constraint(equalToConstant: 166),
            transferAccount.heightAnchor.constraint(equalToConstant: 240)
        ])
        
        NSLayoutConstraint.activate([
            transferToCard.topAnchor.constraint(equalTo: segmentPicker.bottomAnchor, constant: 30),
            transferToCard.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            transferToCard.widthAnchor.constraint(equalToConstant: 166),
            transferToCard.heightAnchor.constraint(equalToConstant: 240)
        ])
        
        NSLayoutConstraint.activate([
            easyTransfer.topAnchor.constraint(equalTo: transferAccount.bottomAnchor, constant: 30),
            easyTransfer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            easyTransfer.widthAnchor.constraint(equalToConstant: 166),
            easyTransfer.heightAnchor.constraint(equalToConstant: 240)
        ])
        
        NSLayoutConstraint.activate([
            qrTransfer.topAnchor.constraint(equalTo: transferAccount.bottomAnchor, constant: 30),
            qrTransfer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            qrTransfer.widthAnchor.constraint(equalToConstant: 166),
            qrTransfer.heightAnchor.constraint(equalToConstant: 240)
        ])
    }
}
