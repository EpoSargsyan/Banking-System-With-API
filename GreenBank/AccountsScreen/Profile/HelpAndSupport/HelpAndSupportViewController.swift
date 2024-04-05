//
//  HelpAndSupportViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 19.03.24.
//

import UIKit

final class HelpAndSupportViewController: UIViewController {
    var helpAndSupportView = HelpAndSupportView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeAnimations()
    }
    
    func setupUI() {
        helpAndSupportView.setupUI()
        helpAndSupportView.frame = view.bounds
        view.addSubview(helpAndSupportView)
        navigationItem.hidesBackButton = true
    }
    
    func makeAnimations() {
        let backButton = UIAction { _ in
            self.navigationController?.popViewController(animated: true)
            self.tabBarController?.tabBar.isHidden = false
        }
        
        let firstAnimation = UIAction { _ in
            if self.helpAndSupportView.flag1 {
                self.helpAndSupportView.stackView.insertArrangedSubview(self.helpAndSupportView.loginAnswer, at: 1)
                
            } else {
                self.helpAndSupportView.stackView.removeArrangedSubview(self.helpAndSupportView.loginAnswer)
                self.helpAndSupportView.loginAnswer.removeFromSuperview()
            }
        
            self.helpAndSupportView.flag1.toggle()
        }
        
        let secondAnimation = UIAction { _ in
            let index = self.helpAndSupportView.stackView.arrangedSubviews.firstIndex(of: self.helpAndSupportView.transferAccountsQuestionTF)! + 1
            
            if self.helpAndSupportView.flag2 {
                self.helpAndSupportView.stackView.insertArrangedSubview(self.helpAndSupportView.transferAccountsAnswer, at: index)
            } else {
                self.helpAndSupportView.stackView.removeArrangedSubview(self.helpAndSupportView.transferAccountsAnswer)
                self.helpAndSupportView.transferAccountsAnswer.removeFromSuperview()
            }
            
            self.helpAndSupportView.flag2.toggle()
        }
        
        let thirdAction = UIAction { _ in
            let index = self.helpAndSupportView.stackView.arrangedSubviews.firstIndex(of: self.helpAndSupportView.transferCardsQuestionTF)! + 1
            
            if self.helpAndSupportView.flag3 {
                self.helpAndSupportView.stackView.insertArrangedSubview(self.helpAndSupportView.transferCardsAnswer, at: index)
            } else {
                self.helpAndSupportView.stackView.removeArrangedSubview(self.helpAndSupportView.transferCardsAnswer)
                self.helpAndSupportView.transferCardsAnswer.removeFromSuperview()
            }
            
            self.helpAndSupportView.flag3.toggle()
        }
        
        let fourthAction = UIAction { _ in
            let index = self.helpAndSupportView.stackView.arrangedSubviews.firstIndex(of: self.helpAndSupportView.passwordChangeQuestionTF)! + 1
            
            if self.helpAndSupportView.flag4 {
                self.helpAndSupportView.stackView.insertArrangedSubview(self.helpAndSupportView.passwordChangeAnswer, at: index)
            } else {
                self.helpAndSupportView.stackView.removeArrangedSubview(self.helpAndSupportView.passwordChangeAnswer)
                self.helpAndSupportView.transferCardsAnswer.removeFromSuperview()
            }
            
            self.helpAndSupportView.flag4.toggle()
        }
        
        self.helpAndSupportView.backButton.addAction(backButton, for: .touchUpInside)
        self.helpAndSupportView.loginQuestionBtn.addAction(firstAnimation, for: .touchUpInside)
        self.helpAndSupportView.transferAccountsQuestionBtn.addAction(secondAnimation, for: .touchUpInside)
        self.helpAndSupportView.transferCardsQuestionBtn.addAction(thirdAction, for: .touchUpInside)
        self.helpAndSupportView.passwordChangeQuestionBtn.addAction(fourthAction, for: .touchUpInside)
    }
}
