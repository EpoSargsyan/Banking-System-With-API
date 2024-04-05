//
//  SignupViewController.swift
//  GreenBank
//
//  Created by Anna Hakobyan on 31.01.24.
//

import UIKit
import GreenBank_ViewModel

final class SignupViewController: BaseViewController<RegisterViewModel> {
    
    let signupView = SignupView()
    
    let datePickerView = DatePickerView()
    
    var userRegistrationInfo = UserRegistrationInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupViewModel()
        setupDelegates()
        makeButtonAction()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrameValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.size.height, right: 0)
        
        signupView.scrollView.contentInset = contentInsets
        signupView.scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        signupView.scrollView.contentInset = .zero
        signupView.scrollView.scrollIndicatorInsets = .zero
    }
    
    private func setupUI() {
        signupView.setupSignupPage()
        signupView.frame = view.bounds
        
        view.addSubview(signupView)
    }
    
    func setupViewModel() {
        self.viewModel = RegisterViewModel()
    }
    
    func setupDelegates() {
        signupView.surnameField.textField.delegate = self
        signupView.emailField.textField.delegate = self
        signupView.nameField.textField.delegate = self
        signupView.passwordField.textField.delegate = self
        signupView.phoneField.textField.delegate = self
    }
    
    func makeButtonAction() {
        let calendarAction = UIAction { _ in
            self.signupView.addBlurEffect(to: self.signupView)
            self.removeKeyBoard()
        }
        
        let selectAnimation = UIAction { _ in
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/YYYY"
            self.signupView.birthDateField.textField.text = formatter.string(from: self.signupView.datePickerView.datePicker.date)
            self.signupView.datePickerView.removeFromSuperview()
            self.signupView.blurEffectView.removeFromSuperview()
        }
        
        let signUpAction = UIAction { _ in
            guard let viewModel = self.viewModel else { return }
                
            self.userRegistrationInfo.firstName = self.signupView.nameField.textField.text!
            self.userRegistrationInfo.lastName = self.signupView.surnameField.textField.text!
            self.userRegistrationInfo.email = self.signupView.emailField.textField.text!
            self.userRegistrationInfo.phone = self.signupView.phoneField.textField.text!
            self.userRegistrationInfo.password = self.signupView.passwordField.textField.text!
            self.userRegistrationInfo.birthDate = self.signupView.birthDateField.textField.text!
        
            AppDelegate.shared?.keyChain["password"] = self.signupView.passwordField.textField.text!
            
            UserDefaults.standard.setValue(self.userRegistrationInfo.email, forKey: "email")
            
            Task {
                do {
                    try await viewModel.postUser(self.userRegistrationInfo)
                    
                    let nextVC = SignUpVerificationViewController()
                    nextVC.modalPresentationStyle = .fullScreen
                    self.show(nextVC, sender: nil)
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        let signInAction = UIAction { _ in
            self.dismiss(animated: true)
        }
        
        signupView.textFieldButton.addAction(calendarAction, for: .touchUpInside)
        signupView.datePickerView.selectButton.addAction(selectAnimation, for: .touchUpInside)
        signupView.signupButton.addAction(signUpAction, for: .touchUpInside)
        signupView.signInButton.addAction(signInAction, for: .touchUpInside)
    }
    
    func removeKeyBoard() {
        signupView.nameField.textField.resignFirstResponder()
        signupView.surnameField.textField.resignFirstResponder()
        signupView.emailField.textField.resignFirstResponder()
        signupView.phoneField.textField.resignFirstResponder()
        signupView.passwordField.textField.resignFirstResponder()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
