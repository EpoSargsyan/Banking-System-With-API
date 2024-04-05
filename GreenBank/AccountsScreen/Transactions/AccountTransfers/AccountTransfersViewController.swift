//
//  AccountTransfersViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 28.03.24.
//

import UIKit
import GreenBank_ViewModel
import GreenBank_CustomUIComponents

final class AccountTransfersViewController: BaseViewController<TransactionsViewModel>, PassAccountInfoDelegate {
    let accountTransferView = AccountTransfersView()
    var transferInfo = TransactionInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        makeAnimations()
        setupDelegates()
    }
    
    func setupUI() {
        accountTransferView.setupUI()
        view.backgroundColor = AppColor.cremeWhite.uiColor
        accountTransferView.frame = view.bounds
        view.addSubview(accountTransferView)
        navigationItem.hidesBackButton = true
        accountTransferView.accountPicker.accounts = AppDelegate.shared?.accounts?.value
        accountTransferView.accountPicker2.accounts = AppDelegate.shared?.accounts?.value
    }
    
    func setupViewModel() {
        self.viewModel = TransactionsViewModel()
    }
    
    func setupDelegates() {
        self.accountTransferView.accountPicker2.delegate = self
    }
    
    func makeAnimations() {
        let backButtonAction = UIAction { _ in
            self.navigationController?.popViewController(animated: true)
            self.tabBarController?.tabBar.isHidden = false
        }
        
        let transferAction = UIAction { _ in
            guard let viewModel = self.viewModel else { return }
            guard let accessToken = AppDelegate.shared?.userRegisterInformation?.accessToken else { return }
            guard let refreshToken = AppDelegate.shared?.userRegisterInformation?.refreshToken else { return }
            
            self.transferInfo.refreshToken = refreshToken
            self.transferInfo.amount = Double(self.accountTransferView.amountTF.textField.text!)
            self.transferInfo.description = self.accountTransferView.purposeTF.textField.text
            self.transferInfo.from = self.accountTransferView.accountPicker.selectedTextField.text
            self.transferInfo.to = self.accountTransferView.creditAccountTF.textField.text
            self.transferInfo.transactionType = "account"
            
            Task {
                do {
                    try await viewModel.transfer(accountTransferInfo: self.transferInfo, accessToken: accessToken)
                
                    NotificationCenter.default
                        .post(name: NSNotification.Name("accountCreatedSuccessfully"),
                              object: nil)
                    
                    let nextVC = RequestCompletedViewController()
                    nextVC.flag = true
                    self.navigationController?.pushViewController(nextVC, animated: true)
                    
                } catch {
                    NotificationCenter.default
                        .post(name: NSNotification.Name("accountCreatedSuccessfully"),
                              object: nil)
                    
                    let nextVC = RequestCompletedViewController()
                    nextVC.flag = false
                    self.navigationController?.pushViewController(nextVC, animated: true)
                    print(error.localizedDescription)
                }
            }
        }
        
        accountTransferView.backButton.addAction(backButtonAction, for: .touchUpInside)
        accountTransferView.transferBtn.addAction(transferAction, for: .touchUpInside)
    }
    
    func passInfoFromFunction(accountInfo: String) {
        self.accountTransferView.creditAccountTF.textField.text = accountInfo
    }
}
