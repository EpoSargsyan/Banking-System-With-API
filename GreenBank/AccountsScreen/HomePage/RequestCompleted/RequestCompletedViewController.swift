//
//  RequestCompletedViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 23.02.24.
//

import UIKit
import GreenBank_ViewModel

final class RequestCompletedViewController: UIViewController {
    let successView = RequestCompletedView()
    let failedView = RequestFailedView()
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupUI(flag: self.flag)
        makeAnimation()
    }
    
    func setupUI(flag: Bool) {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        
        if flag {
            successView.setupUI()
            successView.frame = view.bounds
            view.addSubview(successView)
        } else {
            failedView.setupUI()
            failedView.frame = view.bounds
            view.addSubview(failedView)
        }
    }
    
    func makeAnimation() {
        successView.countinueBtn.addTarget(self, action: #selector(countinueBtnTapped), for: .touchUpInside)
        failedView.countinueBtn.addTarget(self, action: #selector(countinueBtnTapped), for: .touchUpInside)
    }
    
    @objc func countinueBtnTapped() {
        navigationController?.popToRootViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
}
