//
//  HomePageView.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 19.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

final public class HomePageView: UIView {
    private let circleView = UIView()
    
    private let bankLogo = UIImageView(image: UIImage(named: "home_bank_logo".localized))
    
    private let openBalanceLabel = UILabel(text: "home_open_balance".localized,
                                           textColor: AppColor.textBlack.uiColor,
                                           font: UIFont.systemFont(ofSize: 16))
    
    private let dontHaveAccLabel = UILabel(text: "home_have_acc_question".localized,
                                           textColor: AppColor.textGrey.uiColor,
                                           font: UIFont.systemFont(ofSize: 15))
    
    let addNewAccBtn = UIButton(backgroundColor: AppColor.primaryFocus.uiColor,
                                title: "home_new_account_btn_text".localized)
    
    func setupUI() {
        circleView.translatesAutoresizingMaskIntoConstraints = false
        bankLogo.translatesAutoresizingMaskIntoConstraints = false
        openBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        dontHaveAccLabel.translatesAutoresizingMaskIntoConstraints = false
        addNewAccBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(circleView)
        circleView.addSubview(bankLogo)
        self.addSubview(openBalanceLabel)
        self.addSubview(dontHaveAccLabel)
        self.addSubview(addNewAccBtn)
        
        self.backgroundColor = AppColor.cremeWhite.uiColor
        
        circleView.layer.cornerRadius = 29
        circleView.backgroundColor = AppColor.lightGrey.uiColor
        
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 306),
            circleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            circleView.heightAnchor.constraint(equalToConstant: 60),
            circleView.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            bankLogo.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            bankLogo.centerXAnchor.constraint(equalTo: circleView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            openBalanceLabel.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 13),
            openBalanceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dontHaveAccLabel.topAnchor.constraint(equalTo: openBalanceLabel.bottomAnchor, constant: 10),
            dontHaveAccLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addNewAccBtn.topAnchor.constraint(equalTo: dontHaveAccLabel.bottomAnchor, constant: 32),
            addNewAccBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addNewAccBtn.widthAnchor.constraint(equalToConstant: 176),
            addNewAccBtn.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
