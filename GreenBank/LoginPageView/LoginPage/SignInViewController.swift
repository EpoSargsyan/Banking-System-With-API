//
//  SignInViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 31.01.24.
//

import UIKit
import GreenBank_CustomUIComponents
import GreenBank_ViewModel

class SignInViewController: BaseViewController<LoginViewModel> {
    
    var signInView = SignInView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.primaryDefault.uiColor
        setupUI()
        makeButtonAction()
        setupDelegates()  
        setupViewModel()
    }
    
    func setupUI() {
        signInView.setupUI()
        signInView.frame = view.bounds
        signInView.backgroundColor = AppColor.cremeWhite.uiColor
        signInView.layer.cornerRadius = 20

        view.addSubview(signInView)
        signInView.signInButon.isEnabled = true
        
        navigationItem.hidesBackButton = true
    }
    
    func setupDelegates() {
        signInView.emailTextField.textField.delegate = self
        signInView.passwordTextField.textField.delegate = self
    }
    
    func setupViewModel() {
        self.viewModel = LoginViewModel()
    }
    
    func makeButtonAction() {
        let signUpAction = UIAction { _ in
            let nextVC = SignupViewController()
            let navVC = UINavigationController(rootViewController: nextVC)
            navVC.modalPresentationStyle = .fullScreen
            self.present(navVC, animated: true)
        }
        
        let forgotPasswordAction = UIAction { _ in
            let nextVC = ForgotPasswordViewController()
            let navigationController = UINavigationController(rootViewController: nextVC)
            navigationController.modalPresentationStyle = .fullScreen
            self.show(navigationController, sender: nil)
        }
        
        let signInButtonAction = UIAction { _ in
            let email = self.signInView.emailTextField.textField.text!
            let password = self.signInView.passwordTextField.textField.text!
            guard let viewModel = self.viewModel else { return }
            
            if viewModel.validator.validationForUserRegistrationData(email: email,
                                                                     password: password,
                                                                     confirmPassword: password) {
                Task {
                    do {
                        if let appDelegate = AppDelegate.shared {
                            let user = try await viewModel.getUser(withEmail: email, withPassword: password)
                            appDelegate.userRegisterInformation = user?.value
                        }
                        
                        UserDefaults.standard.setValue(true, forKey: email)
                        
                        let nextVC = TabBarViewController()
                        nextVC.modalPresentationStyle = .fullScreen
                        self.present(nextVC, animated: true)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        signInView.signUpButton.addAction(signUpAction, for: .touchUpInside)
        signInView.forgotPasswordButton.addAction(forgotPasswordAction, for: .touchUpInside)
        signInView.signInButon.addAction(signInButtonAction, for: .touchUpInside)
    }
}
