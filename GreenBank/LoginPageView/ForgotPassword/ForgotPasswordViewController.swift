//
//  ForgotPasswordViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 01.02.24.
//

import UIKit
import GreenBank_CustomUIComponents
import GreenBank_ViewModel

final public class ForgotPasswordViewController: BaseViewController<ForgotPasswordViewModel> {
    
    public let forgotPasswordView = ForgotPasswordView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupDelegates()
        setupViewModel()
        makeButtonAction()
    }
    
    func setupUI() {
        forgotPasswordView.setupUI()
        
        view.backgroundColor = AppColor.cremeWhite.uiColor
        
        forgotPasswordView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(forgotPasswordView)
        
        forgotPasswordView.backgroundColor = AppColor.cremeWhite.uiColor
        
        NSLayoutConstraint.activate([
            forgotPasswordView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            forgotPasswordView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            forgotPasswordView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            forgotPasswordView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupViewModel() {
        self.viewModel = ForgotPasswordViewModel()
    }
 
    func setupDelegates() {
        forgotPasswordView.emailTextField.textField.delegate = self
    }
    
    func makeButtonAction() {
        let continueButtonAction = UIAction { _ in
            guard let viewModel = self.viewModel else { return }
            let email = self.forgotPasswordView.emailTextField.textField.text!
            
            Task {
                do {
                    try await viewModel.sendingEmail(email)
                    
                    let nextVC = VerificationViewController()
                    nextVC.modalPresentationStyle = .fullScreen
                    self.show(nextVC, sender: nil)
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        forgotPasswordView.continueButton.addAction(continueButtonAction, for: .touchUpInside)
        forgotPasswordView.backButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
