//
//  ChangePasswordViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 25.03.24.
//

import UIKit
import GreenBank_ViewModel
import GreenBank_CustomUIComponents

final class ChangePasswordViewController: BaseViewController<UserProfileViewModel> {
    var changePasswordView = ChangePasswordView()
    
    var newPasswordInfo = ChangePasswordInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        setupUI()
        setupViewModel()
        setupDelegates()
        makeAnimations()
    }
    
    func setupUI() {
        changePasswordView.setupUI()
        changePasswordView.backgroundColor = AppColor.cremeWhite.uiColor
        changePasswordView.frame = view.bounds
        view.addSubview(changePasswordView)
        navigationItem.hidesBackButton = true
    }
    
    func setupViewModel() {
        self.viewModel = UserProfileViewModel()
    }
    
    func setupDelegates() {
        changePasswordView.newPasswordTextField.textField.delegate = self
        changePasswordView.confirmPasswordTextField.textField.delegate = self
    }
    
    func makeAnimations() {
        let backButtonAction = UIAction { _ in
            self.navigationController?.popToViewController(SettingsViewController(), animated: true)
            self.tabBarController?.tabBar.isHidden = false
        }
        
        let continueAction = UIAction { _ in
            guard let viewModel = self.viewModel else { return }
            guard let userId = AppDelegate.shared?.userRegisterInformation?.user.id else { return }
            guard let accessToken = AppDelegate.shared?.userRegisterInformation?.accessToken else { return }
            guard let refreshToken = AppDelegate.shared?.userRegisterInformation?.refreshToken else { return }
            
            self.newPasswordInfo.newPassword = self.changePasswordView.newPasswordTextField.textField.text!
            self.newPasswordInfo.newPasswordAgain = self.changePasswordView.confirmPasswordTextField.textField.text!
            self.newPasswordInfo.refreshToken = refreshToken
            self.newPasswordInfo.userId = userId
            
            do {
                self.newPasswordInfo.oldPassword = try AppDelegate.shared?.keyChain.get("password")
            } catch {
                print(error.localizedDescription)
            }
            
            Task {
                do {
                    try await viewModel.changePassword(changePasswordInfo: self.newPasswordInfo, accessToken: accessToken)
                    
                    AppDelegate.shared?.keyChain["password"] = self.newPasswordInfo.newPassword
                    
                    let nextVC = RequestCompletedViewController()
                    nextVC.flag = true
                    self.navigationController?.pushViewController(nextVC, animated: true)
                    
                } catch {
                    let nextVC = RequestCompletedViewController()
                    nextVC.flag = false
                    self.navigationController?.pushViewController(nextVC, animated: true)
                    
                    print(error.localizedDescription)
                }
            }
        }
        
        changePasswordView.backButton.addAction(backButtonAction, for: .touchUpInside)
        changePasswordView.saveButton.addAction(continueAction, for: .touchUpInside)
    }
}
