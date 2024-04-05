//
//  QRTransfersView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 29.03.24.
//

import UIKit
import GreenBank_CustomUIComponents

final class QRTransfersView: UIView {
    public let backButton = UIButton(backgroundColor: AppColor.cremeWhite.uiColor,
                                     title: "",
                                     image: "forgot_password_back".localized)
    
    private let transferQRLabel = UILabel(text: "QR_label_text".localized,
                                            textColor: AppColor.accentDefault.uiColor,
                                            font: UIFont.systemFont(ofSize: 17))
    
    private let qrScanLabel = UILabel(text: "QR_scan_text".localized,
                                      textColor: AppColor.accentDefault.uiColor,
                                      font: UIFont.systemFont(ofSize: 15))
    
    public var cameraView = UIView()
    
    private let qrScanningExmpleLabel = UILabel(text: "QR_using_example_text".localized,
                                                textColor: AppColor.accentDefault.uiColor,
                                                font: UIFont.systemFont(ofSize: 14))
    
    public var segmentPicker = UISegmentedControl(items: ["Scan", "My QR"])
    
    public func setupUI() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        transferQRLabel.translatesAutoresizingMaskIntoConstraints = false
        qrScanLabel.translatesAutoresizingMaskIntoConstraints = false
        cameraView.translatesAutoresizingMaskIntoConstraints = false
        qrScanningExmpleLabel.translatesAutoresizingMaskIntoConstraints = false
        segmentPicker.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backButton)
        self.addSubview(transferQRLabel)
        self.addSubview(qrScanLabel)
        self.addSubview(cameraView)
        self.addSubview(qrScanningExmpleLabel)
        self.addSubview(segmentPicker)
        
        self.backgroundColor = AppColor.cremeWhite.uiColor
        qrScanningExmpleLabel.numberOfLines = 2
        qrScanningExmpleLabel.textAlignment = .center
        segmentPicker.selectedSegmentIndex = 0
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            transferQRLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            transferQRLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            qrScanLabel.topAnchor.constraint(equalTo: transferQRLabel.bottomAnchor, constant: 100),
            qrScanLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cameraView.topAnchor.constraint(equalTo: qrScanLabel.bottomAnchor, constant: 20),
            cameraView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 33),
            cameraView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            cameraView.heightAnchor.constraint(equalToConstant: 335)
        ])
        
        NSLayoutConstraint.activate([
            qrScanningExmpleLabel.topAnchor.constraint(equalTo: cameraView.bottomAnchor, constant: 16),
            qrScanningExmpleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 46),
            qrScanningExmpleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45)
        ])
        
        NSLayoutConstraint.activate([
            segmentPicker.topAnchor.constraint(equalTo: qrScanningExmpleLabel.bottomAnchor, constant: 100),
            segmentPicker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            segmentPicker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            segmentPicker.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}
