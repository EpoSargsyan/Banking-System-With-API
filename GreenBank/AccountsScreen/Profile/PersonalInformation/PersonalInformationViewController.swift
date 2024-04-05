//
//  PersonalInformationViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 19.03.24.
//

import UIKit
import GreenBank_ViewModel

final class PersonalInformationViewController: BaseViewController<UserProfileViewModel> {
    let personalInfoView = PersonalInformationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        personalInfoView.scrollView.contentInset = contentInsets
        personalInfoView.scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        personalInfoView.scrollView.contentInset = .zero
        personalInfoView.scrollView.scrollIndicatorInsets = .zero
    }
    
    func setupUI() {
        personalInfoView.setupUI()
        personalInfoView.frame = view.bounds
        view.addSubview(personalInfoView)
        navigationItem.hidesBackButton = true
    }
    
    func setupViewModel() {
        self.viewModel = UserProfileViewModel()
    }
    
    func setupDelegates() {
        personalInfoView.surnameField.textField.delegate = self
        personalInfoView.emailField.textField.delegate = self
        personalInfoView.nameField.textField.delegate = self
        personalInfoView.phoneField.textField.delegate = self
    }
    
    func makeButtonAction() {
        let backButtonAction = UIAction { _ in
            self.navigationController?.popViewController(animated: true)
            self.tabBarController?.tabBar.isHidden = false
        }
        
        let calendarAction = UIAction { _ in
            self.personalInfoView.addBlurEffect(to: self.personalInfoView)
            self.personalInfoView.removeKeyBoard()
        }
        
        let selectAnimation = UIAction { _ in
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/YYYY"
            self.personalInfoView.birthDateField.textField.text = formatter.string(from: self.personalInfoView.datePickerView.datePicker.date)
            
            self.personalInfoView.datePickerView.removeFromSuperview()
            self.personalInfoView.blurEffectView.removeFromSuperview()
        }
        
//        let saveButtonAction = UIAction { _ in
//            
//        }
    
        personalInfoView.backButton.addAction(backButtonAction, for: .touchUpInside)
        personalInfoView.textFieldButton.addAction(calendarAction, for: .touchUpInside)
        personalInfoView.datePickerView.selectButton.addAction(selectAnimation, for: .touchUpInside)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
