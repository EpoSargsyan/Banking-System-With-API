//
//  SettingsViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 19.03.24.
//

import UIKit
import GreenBank_ViewModel

final class SettingsViewController: UIViewController {
    var settingsView = SettingsView()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupDelegates()
        makeAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        self.settingsView.lightDarkView.switcher.isOn = UserDefaults.standard.bool(forKey: "switcherMode")
    }
    
    func setupUI() {
        settingsView.setupUI()
        settingsView.frame = view.bounds
        view.addSubview(settingsView)
        navigationItem.hidesBackButton = true
    }
    
    func setupDelegates() {
        settingsView.popUpView.passwordTextField.textField.delegate = self
    }
    
    func makeAnimation() {
        let changePasswordAction = UIAction { _ in
            self.settingsView.addBlurEffect(to: self.settingsView)
        }
        
        let backButton = UIAction { _ in
            self.navigationController?.popViewController(animated: true)
            self.tabBarController?.tabBar.isHidden = false
        }
        
        let continuewAction = UIAction { _ in
            let nextVC = ChangePasswordViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
        let switcherAction = UIAction { _ in
            if self.settingsView.lightDarkView.switcher.isOn {
                UserDefaults.standard.setValue(true, forKey: "switcherMode")
                SceneDelegate.shared?.setAppearanceMode()
            } else {
                UserDefaults.standard.setValue(false, forKey: "switcherMode")
                SceneDelegate.shared?.setAppearanceMode()
            }
        }
        
        settingsView.lightDarkView.switcher.addAction(switcherAction, for: .valueChanged)
        settingsView.changePaswordBtn.addAction(changePasswordAction, for: .touchUpInside)
        settingsView.backButton.addAction(backButton, for: .touchUpInside)
        settingsView.popUpView.continueBtn.addAction(continuewAction, for: .touchUpInside)
    }
}
