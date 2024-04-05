//
//  PrivacyPolicyViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 19.03.24.
//

import UIKit

final class PrivacyPolicyViewController: UIViewController {
    
    let privacyPolicyView = PrivacyPolicyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        makeAnimation()
    }
    
    func setupUI() {
        privacyPolicyView.setupUI()
        privacyPolicyView.frame = view.bounds
        view.addSubview(privacyPolicyView)
        navigationItem.hidesBackButton = true
    }
    
    func makeAnimation() {
        let backButtonAction = UIAction { _ in
            self.navigationController?.popViewController(animated: true)
            self.tabBarController?.tabBar.isHidden = false
        }
        
        privacyPolicyView.backButton.addAction(backButtonAction, for: .touchUpInside)
    }
}
