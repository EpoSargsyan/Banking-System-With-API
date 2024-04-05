//
//  ResetPasswordViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 06.02.24.
//

import UIKit
import GreenBank_CustomUIComponents
import GreenBank_ViewModel

final public class ResetPasswordViewController: BaseViewController<ResetPasswordViewModel> {
    
    let resetPasswordView = ResetPasswordView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupViewModel()
        makeButtonAction()
        setupDelegates()
    }
    
    func setupUI() {
        resetPasswordView.setupUI()
        
        resetPasswordView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(resetPasswordView)
        
        view.backgroundColor = AppColor.cremeWhite.uiColor
        
        resetPasswordView.backgroundColor = AppColor.cremeWhite.uiColor
        
        NSLayoutConstraint.activate([
            resetPasswordView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            resetPasswordView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resetPasswordView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resetPasswordView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        navigationItem.hidesBackButton = true
    }
    
    func setupViewModel() {
        self.viewModel = ResetPasswordViewModel()
    }
    
    func setupDelegates() {
        resetPasswordView.passwordTextField.textField.delegate = self
        resetPasswordView.confirmPasswordTextField.textField.delegate = self
    }
    
    func makeButtonAction() {
        let continueButtonAction = UIAction { _ in
            guard let viewModel = self.viewModel else { return }
            guard let password = self.resetPasswordView.confirmPasswordTextField.textField.text else { return }
            
            Task {
                do {
                    try await viewModel.resetPassword(password: password)
                    
                    let nextVC = PasswordChangedViewController()
                    nextVC.modalPresentationStyle = .fullScreen
                    self.show(nextVC, sender: nil)
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        resetPasswordView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        resetPasswordView.continueButton.addAction(continueButtonAction, for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
