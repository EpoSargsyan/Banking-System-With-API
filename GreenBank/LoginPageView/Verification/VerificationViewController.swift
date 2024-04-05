//
//  VerificationViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 02.02.24.
//

import UIKit
import GreenBank_CustomUIComponents
import GreenBank_ViewModel

final public class VerificationViewController: BaseViewController<VerificationViewModel> {
    let verificationView = VerificationView()
    
    var verificationCode = ""
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        makeButtonAction()
        setupDelegates()
        setupViewModel()
    }
    
    func setupUI() {
        verificationView.setupUI()
        
        verificationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(verificationView)
        
        view.backgroundColor = AppColor.cremeWhite.uiColor
        
        verificationView.backgroundColor = AppColor.cremeWhite.uiColor
        
        NSLayoutConstraint.activate([
            verificationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            verificationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verificationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            verificationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        navigationItem.hidesBackButton = true
    }
    
    func setupViewModel() {
        self.viewModel = VerificationViewModel()
    }
    
    func setupDelegates() {
        verificationView.digitsView.firstDigit.delegate = self
        verificationView.digitsView.secondDigit.delegate = self
        verificationView.digitsView.thirdDigit.delegate = self
        verificationView.digitsView.fourthDigit.delegate = self
    }
    
    func makeButtonAction() {
        let continueButtonAction = UIAction { _ in
            guard let viewModel = self.viewModel else { return }
            
            Task {
                do {
                    try await viewModel.sendForgotPasswordCode(verificationCode: self.verificationCode)
                    let nextVC = ResetPasswordViewController()
                    nextVC.modalPresentationStyle = .fullScreen
                    self.show(nextVC, sender: nil)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        verificationView.backButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        verificationView.continueButton.addAction(continueButtonAction, for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
