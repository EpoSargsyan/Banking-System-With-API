//
//  NewAccountViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 20.02.24.
//

import UIKit
import GreenBank_CustomUIComponents
import GreenBank_ViewModel

final public class NewAccountViewController: BaseViewController<NewAccountViewModel> {
    
    var newAccountView = NewAccountView()
    
    var newAccountInfo = NewAccountInfo()
    
    var flag: Bool = false
     
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        makeAnimations()
        setupViewModel()
        setupDelegates()
    }
    
    func setupViewModel() {
        self.viewModel = NewAccountViewModel()
    }
    
    func setupDelegates() {
        newAccountView.accountName.textField.delegate = self
        newAccountView.accountPicker.selectedTextField.delegate = self
        newAccountView.currencyPicker.selectedTextField.delegate = self
    }
    
    func setupUI() {
        newAccountView.frame = view.bounds
        view.addSubview(newAccountView)
        
        newAccountView.setupUI()
        navigationItem.hidesBackButton = true
    }
    
    func makeAnimations() {
        let requestAction = UIAction { _ in
            guard let viewModel = self.viewModel else { return }
            guard let accessToken = AppDelegate.shared?.userRegisterInformation?.accessToken else { return }
            guard let userId = AppDelegate.shared?.userRegisterInformation?.user.id else { return }
            
            self.newAccountInfo.accountName = self.newAccountView.accountName.textField.text ?? nil
            self.newAccountInfo.currency = self.newAccountView.currencyPicker.selectedTextField.text!
            self.newAccountInfo.accountType = self.newAccountView.accountPicker.selectedTextField.text!
            self.newAccountInfo.userId = userId
        
            Task {
                do {
                    try await viewModel.postNewAccount(self.newAccountInfo,
                                                       accessToken: accessToken)
                    
                    if viewModel.status == "success" {
                        NotificationCenter.default
                                    .post(name: NSNotification.Name("accountCreatedSuccessfully"),
                                          object: nil)
                        
                        let nextVC = RequestCompletedViewController()
                        nextVC.flag = true
                        self.navigationController?.pushViewController(nextVC, animated: true)
                    } else {
                        let nextVC = RequestCompletedViewController()
                        nextVC.flag = false
                        self.navigationController?.pushViewController(nextVC, animated: true)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        newAccountView.requestButton.addAction(requestAction, for: .touchUpInside)
        newAccountView.backButton.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
    }
    
    @objc func backBtnTapped() {
        navigationController?.popViewController(animated: true)
        tabBarController?.tabBar.isHidden = false
    }
}
