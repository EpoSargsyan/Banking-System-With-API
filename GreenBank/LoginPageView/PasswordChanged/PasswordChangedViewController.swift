//
//  PasswordChangedViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 06.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

final public class PasswordChangedViewController: UIViewController {
    
    let passwordChangedView = PasswordChangedView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
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
}
