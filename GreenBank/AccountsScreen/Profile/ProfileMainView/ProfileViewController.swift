//
//  ProfileViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 20.02.24.
//

import UIKit
import GreenBank_ViewModel
import GreenBank_CustomUIComponents

final class ProfileViewController: BaseViewController<UserProfileViewModel> {
    
    var profileView = ProfileView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupViewModel()
        makeAnimations()
    }
    
    func setupViewModel() {
        self.viewModel = UserProfileViewModel()
    }
    
    func setupUI() {
        profileView.setupUI()
        profileView.getUserProfileInfo()
        profileView.backgroundColor = AppColor.cremeWhite.uiColor
        profileView.frame = view.bounds
        view.addSubview(profileView)
    }
    
    func makeAnimations() {
        let profileInfoAction = UIAction { _ in
            let nextVC = PersonalInformationViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.tabBarController?.tabBar.isHidden = true
            self.show(nextVC, sender: nil)
        }
        
        let settingsAction = UIAction { _ in
            let nextVC = SettingsViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(nextVC, animated: true)
            self.tabBarController?.tabBar.isHidden = true
        }
        
        let privacyPolicyActtion = UIAction { _ in
            let nextVC = PrivacyPolicyViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(nextVC, animated: true)
            self.tabBarController?.tabBar.isHidden = true
        }
        
        let helpAndSupportAction = UIAction { _ in
            let nextVC = HelpAndSupportViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(nextVC, animated: true)
            self.tabBarController?.tabBar.isHidden = true
        }
        
        profileView.personalInfoBtn.addAction(profileInfoAction, for: .touchUpInside)
        profileView.settingsBtn.addAction(settingsAction, for: .touchUpInside)
        profileView.privacyBtn.addAction(privacyPolicyActtion, for: .touchUpInside)
        profileView.helpSupportBtn.addAction(helpAndSupportAction, for: .touchUpInside)
    }
}
