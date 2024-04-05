//
//  SignUpSuccessViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 16.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

final public class SignUpSuccessViewController: UIViewController {
    
    let passwordChangedView = SignUpSuccessView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        makeBtnAction()
    }
    
    func setupUI() {
        passwordChangedView.setupUI()
        
        passwordChangedView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(passwordChangedView)
        
        view.backgroundColor = AppColor.cremeWhite.uiColor
        
        passwordChangedView.backgroundColor = AppColor.cremeWhite.uiColor
        
        NSLayoutConstraint.activate([
            passwordChangedView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            passwordChangedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            passwordChangedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            passwordChangedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        navigationItem.hidesBackButton = true
    }
    
    func makeBtnAction() {
        let continueAction = UIAction { _ in
            let nextVC = SignInViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.show(nextVC, sender: nil)
            
            self.dismiss(animated: true)
        }
        
        passwordChangedView.continueBtn.addAction(continueAction, for: .touchUpInside)
    }
}
